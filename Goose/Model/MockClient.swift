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
//                  let jsonResult = try JSONSerialization.data(with: data, options: .prettyPrinted)
//                  if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["person"] as? [Any] {
//                            // do stuff
//                  }
              } catch {
              }
        }
        return nil
    }
    
    
    static func groups() -> [Group]?{
        if let jsonData = MockClient.json(filename: "groups") {
            do {
                let groups: [Group] = try! JSONDecoder().decode([Group].self, from: jsonData)
                return groups
            } catch (let error) {
                return nil
            }
        }
        return nil
    }
    
    static func subjects() -> [Subject]?{
        if let jsonData = MockClient.json(filename: "subjects") {
            do {
                let subjects: [Subject] = try! JSONDecoder().decode([Subject].self, from: jsonData)
                return subjects
            } catch (let error) {
                return nil
            }
        }
        return nil
    }
    
}
