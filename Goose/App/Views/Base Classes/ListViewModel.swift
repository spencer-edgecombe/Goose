//
//  ListViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-08-27.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

class ListViewModel<R: Resource>: ViewModel<R> {
    var resources: [R]
    
    override init(_ url: WaterlooURL, _ isMock: Bool = false) {
        resources = []
        super.init(url, isMock)
    }
    
    override func doLoadContent() {
        super.doLoadContent()
        guard !isMock else {
            let resources = MockClient.load(resourceType: [R].self)
            if resources.isEmpty {
                self.didFinishLoadingContent(isSuccess: false, content: "")
            } else {
                self.didFinishLoadingContent(isSuccess: true, content: resources)
            }
            return
        }
        Client.shared.load(type: [R].self, url: url) { (resources, error) in
            if let error = error {
                self.didFinishLoadingContent(isSuccess: false, content: error.localizedDescription)
            } else {
                self.didFinishLoadingContent(isSuccess: true, content: resources)
            }
        }
    }
    
    override func didFinishLoadingContent(isSuccess: Bool, content: Any) {
        super.didFinishLoadingContent(isSuccess: isSuccess, content: content)
        if isSuccess, let resources: [R] = content as? [R] {
            resourcesDidLoadSuccessfully(resources: resources)
        } else {
            loadDidFail()
        }
    }
    
    func resourcesDidLoadSuccessfully(resources: [R]) {
        self.resources = resources
    }
    
    func loadDidFail() {
        
    }
}
