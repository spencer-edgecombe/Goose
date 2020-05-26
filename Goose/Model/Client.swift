//
//  Client.swift
//  UWCourses
//
//  Created by Spencer Edgecombe on 2020-03-31.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import Alamofire

class Client {
    
    private let key = "00b09dabadf4ce42fd5b10ce729d244d"
    private let apiUrl = "https://api.uwaterloo.ca/v2"
    private let subjectsUri = "/codes/subjects.json"
    private let groupsUri = "/codes/groups.json"

    var defaultParameters: [String: String] {
        return ["key" : key]
    }
    
    static let shared: Client = {
        return Client()
    }()
    
    func endpoint(uri: String) -> String {
        return "\(apiUrl)\(uri)"
    }
    
    func coursesUri(subjectName: String) -> String {
        return "/courses/\(subjectName).json"
    }
    
    
    func subjects(completionHandler: @escaping ([Subject], Error?) -> ()) {
        let url = endpoint(uri: subjectsUri)
        let parameters = defaultParameters
        get(urlString: url, parameters: parameters) {
            data, error in
            if let error = error {
                DispatchQueue.main.async {
                   completionHandler([], error)
               }
            } else if let data = data as? [Any] {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let subjects: [Subject] = try! JSONDecoder().decode([Subject].self, from: jsonData)
                    DispatchQueue.main.async {
                        completionHandler(subjects, nil)
                    }
                } catch (let error) {
                    DispatchQueue.main.async {
                        completionHandler([], error)
                    }
                }
            }
        }
    }
    
    
    func groups(completionHandler: @escaping ([Group], Error?) -> ()) {
        let url = endpoint(uri: groupsUri)
        let parameters = defaultParameters
        get(urlString: url, parameters: parameters) {
            data, error in
            if let error = error {
                DispatchQueue.main.async {
                   completionHandler([], error)
               }
            } else if let data = data as? [Any] {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    let groups: [Group] = try! JSONDecoder().decode([Group].self, from: jsonData)
                    DispatchQueue.main.async {
                        completionHandler(groups, nil)
                    }
                } catch (let error) {
                    DispatchQueue.main.async {
                        completionHandler([], error)
                    }
                }
            }
        }
    }
    
    func courses(for subjectName: String, completionHandler: @escaping ([Course], Error?) -> ()) {
        let url = endpoint(uri: coursesUri(subjectName: subjectName))
        let parameters = defaultParameters
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
                    } catch (let error) {
                        DispatchQueue.main.async {
                            completionHandler(nil, error)
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
