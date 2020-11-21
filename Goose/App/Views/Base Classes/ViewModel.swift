//
//  ViewModel.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-08-27.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

class ViewModel<R: Resource>: ObservableObject {
    
    @Published private(set) var loadingState: LoadingState
    
    @State private(set) var isAlertPresented: Bool
    
    private(set) var url: WaterlooURL
    
    let isMock: Bool

    init(_ url: WaterlooURL, _ isMock: Bool = false) {
        self.url = url
        self.isMock = isMock
        loadingState = .loading
        isAlertPresented = true
        loadContent()
    }
    
    final func loadContent() {
        willLoadContent()
        doLoadContent()
    }
    
    func willLoadContent() {
        loadingState = .loading
    }
    
    func doLoadContent() {
        guard !isMock else {
            return
        }
    }
    
    func didFinishLoadingContent(isSuccess: Bool, content: Any) {
        if isSuccess {
            loadingState = .success
        } else if let message: String = content as? String {
            loadingState = .failure(message: message)
        }
    }
    
}
