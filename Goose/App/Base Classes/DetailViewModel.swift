//
//  ListViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-08-27.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

class DetailViewModel<R: Resource>: ViewModel<R> {
    private(set) var resource: R
    
    init(_ url: WaterlooURL, resource: R, _ isMock: Bool) {
        self.resource = resource
        super.init(url, isMock)
    }
    
    struct DetailEntry: Hashable {
        let title: String
        let description: String
        init (_ title: String, _ description: String) {
            self.title = title
            self.description = description
        }
    }
    
    final override func doLoadContent() {
        super.doLoadContent()
        guard !isMock else {
            if let resource: R = MockClient.load(resourceType: R.self) {
                self.didFinishLoadingContent(isSuccess: true, content: resource)
            } else {
                self.didFinishLoadingContent(isSuccess: false, content: "")
            }
            return
        }
        Client.shared.load(type: R.self, url: url) { (resource, error) in
            if let error = error {
                self.didFinishLoadingContent(isSuccess: false, content: error.localizedDescription)
            } else if let resource = resource {
                self.didFinishLoadingContent(isSuccess: true, content: resource)
            } else {
                self.didFinishLoadingContent(isSuccess: false, content: "Resource was nil")
            }
        }
    }
    
    final override func didFinishLoadingContent(isSuccess: Bool, content: Any) {
        super.didFinishLoadingContent(isSuccess: isSuccess, content: content)
        if isSuccess, let resource: R = content as? R {
            resourcesDidLoadSuccessfully(resource: resource)
        } else {
            loadDidFail()
        }
    }
    
    func resourcesDidLoadSuccessfully(resource: R) {
        self.resource = resource
    }
    
    func loadDidFail() {
        
    }
}
