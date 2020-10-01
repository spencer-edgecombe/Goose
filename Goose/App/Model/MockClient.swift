//
//  MockClient.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-14.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation

class MockClient {
    
    static func json(filename: String) -> Data? {
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    return data
              } catch {
              }
        }
        return nil
    }
    
    static func load<R: Resource>(resourceType: R.Type) -> R? {
        if resourceType == CourseDetails.self, let courseDetails: R = courseDetails as? R {
            return courseDetails
        }
        return nil
    }
    
    static func load<R: Resource>(resourceType: Array<R>.Type) -> [R] {
        if resourceType == [Subject].self, let subjects: [R] = subjects as? [R] {
            return subjects
        }
        
        if resourceType == [Course].self, let courses: [R] = courses as? [R] {
            return courses
        }
        
        if resourceType == [Faculty].self, let faculties: [R] = faculties as? [R] {
            return faculties
        }
        
        return []
    }
    
    static var faculties: [Faculty]? {
        if let jsonData = MockClient.json(filename: "groups") {
            do {
                let faculties: [Faculty] = try! JSONDecoder().decode([Faculty].self, from: jsonData)
                return faculties
            }
        }
        return nil
    }
    static var courses: [Course]? {
        if let jsonData = MockClient.json(filename: "courses") {
            do {
                let courses: [Course] = try! JSONDecoder().decode([Course].self, from: jsonData)
                return courses
            }
        }
        return nil
    }
    
    static var subjects: [Subject]? {
        if let jsonData = MockClient.json(filename: "subjects") {
            do {
                let subjects: [Subject] = try! JSONDecoder().decode([Subject].self, from: jsonData)
                return subjects
            }
        }
        return nil
    }
    
    static var courseDetails: CourseDetails? {
        if let jsonData = MockClient.json(filename: "course_details") {
            do {
                let courseDetails: CourseDetails = try! JSONDecoder().decode(CourseDetails.self, from: jsonData)
                return courseDetails
            }
        }
        return nil
    }
    
}
