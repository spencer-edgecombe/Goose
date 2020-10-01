//
//  Client.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-03-31.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import Alamofire

struct WaterlooURL {
    static let empty = WaterlooURL(url: "")
    private(set) var url: String
}

class Client {
    
    private static let key = "00b09dabadf4ce42fd5b10ce729d244d"
    private static let defaultParameters: [String: String] = ["key" : key]

    private let apiUrl = "https://api.uwaterloo.ca/v2"
    private let subjectsUri = "/codes/subjects.json"
    private let facultiesUri = "/codes/groups.json"

    
    
    static let shared: Client = {
        return Client()
    }()
    
    private func endpoint(uri: String) -> String {
        return "\(apiUrl)\(uri)"
    }
    
    private func coursesUri(subjectName: String) -> String {
        return "/courses/\(subjectName).json"
    }
    
    func coursesURL(subject: inout Subject) -> WaterlooURL {
        return WaterlooURL(url: endpoint(uri: coursesUri(subjectName: subject.name)))
    }
    
    func facultyURL() -> WaterlooURL {
        return WaterlooURL(url: endpoint(uri: facultiesUri))
    }
    
    func subjectsURL() -> WaterlooURL {
        return WaterlooURL(url: endpoint(uri: subjectsUri))
    }
    
    private func courseDetailsUri(subjectName: String, courseNumber: String) -> String {
        return "/courses/\(subjectName)/\(courseNumber).json"
    }
    
    func courseDetailsURL(course: inout Course) -> WaterlooURL {
        return WaterlooURL(url: endpoint(uri: courseDetailsUri(subjectName: course.subject, courseNumber: course.catalogNumber)))
    }
    
    func load<R: Resource>(type: Array<R>.Type, url: WaterlooURL,_ parameters: [String: String] = defaultParameters,_ completionHandler: @escaping ([R], Error?) -> ()) {
        get(urlString: url.url, parameters: parameters) {
            data, error in
            guard error == nil, let data = data as? [Any] else {
                DispatchQueue.main.async {
                    completionHandler([], error)
                }
                return
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                let resources: [R] = try! JSONDecoder().decode(type, from: jsonData)
                DispatchQueue.main.async {
                    completionHandler(resources, nil)
                }
            } catch (let error) {
                DispatchQueue.main.async {
                    completionHandler([], error)
                }
            }
        }
    }
    
    func load<R: Resource>(type: R.Type, url: WaterlooURL,_ parameters: [String: String] = defaultParameters,_ completionHandler: @escaping (R?, Error?) -> ()) {
        get(urlString: url.url, parameters: parameters) {
            data, error in
            guard error == nil, let data: Any = data else {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
                return
            }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                let resource: R = try! JSONDecoder().decode(type, from: jsonData)
                DispatchQueue.main.async {
                    completionHandler(resource, nil)
                }
            } catch (let error) {
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            }
            
        }
    }
    
    
    func subjects(completionHandler: @escaping ([Subject], Error?) -> ()) {
        let url: WaterlooURL = WaterlooURL(url: endpoint(uri: subjectsUri))
        load(type: [Subject].self, url: url) { (subjects, error) in
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler([], error)
                }
                return
            }
            DispatchQueue.main.async {
                completionHandler(subjects, error)
            }
        }
    }
    
    
    func faculties(completionHandler: @escaping ([Faculty], Error?) -> ()) {
        let url: WaterlooURL = WaterlooURL(url: endpoint(uri: facultiesUri))
        load(type: [Faculty].self, url: url) { (faculties, error) in
            guard error == nil else {
                DispatchQueue.main.async {
                    completionHandler([], error)
                }
                return
            }
            DispatchQueue.main.async {
                completionHandler(faculties, error)
            }
        }
    }
    

    func courseDetails(for subjectName: String, courseNumber: String, completionHandler: @escaping (CourseDetails?, Error?) -> ()) {
        let url = endpoint(uri: courseDetailsUri(subjectName: subjectName, courseNumber: courseNumber))
        let parameters = Client.defaultParameters
        get(urlString: url, parameters: parameters) {
            data, error in
            if let error = error {
                DispatchQueue.main.async {
                   completionHandler(nil, error)
               }
            } else if let data: Any = data {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let courseDetails: CourseDetails = try! JSONDecoder().decode(CourseDetails.self, from: jsonData)
                    DispatchQueue.main.async {
                        completionHandler(courseDetails, nil)
                    }
                } catch (let error) {
                    DispatchQueue.main.async {
                        completionHandler(nil, error)
                    }
                }
            }
        }
    }

    
    func courses(for subjectName: String, completionHandler: @escaping ([Course], Error?) -> ()) {
        let url = endpoint(uri: coursesUri(subjectName: subjectName))
        let parameters = Client.defaultParameters
        get(urlString: url, parameters: parameters) {
            data, error in
            if let error = error {
                DispatchQueue.main.async {
                   completionHandler([], error)
               }
            } else if let data = data as? [Any] {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let courses: [Course] = try! JSONDecoder().decode([Course].self, from: jsonData)
                    DispatchQueue.main.async {
                        completionHandler(courses, nil)
                    }
                } catch (let error) {
                    DispatchQueue.main.async {
                        completionHandler([], error)
                    }
                }
            }
        }
    }
    
    
    private func get(urlString: String, parameters: [String : String], completionHandler: @escaping (Any?, Error?) -> ()) {
        
        AF.request(urlString, method: .get, parameters: parameters).responseJSON { (response) in
            debugPrint(response)
            switch (response.result) {
            case .success(let jsonResult):
                if let data = (jsonResult as! [String: Any])["data"] {
                    do {
                        DispatchQueue.main.async {
                            completionHandler(data, nil)
                        }
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completionHandler(nil, error)
                }
            }
        }
    }
        
}
