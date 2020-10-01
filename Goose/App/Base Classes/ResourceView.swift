//
//  ResourceView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-08-27.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct ResourceView<R: Resource, Content>: View where Content: View {
    
    @ObservedObject var viewModel: ViewModel<R>
    var failurePlaceholderMessage: String
    var successView: () -> Content
    
    init(viewModel: ViewModel<R>, failurePlaceholderMessage: String, failureAlertMessage: String, @ViewBuilder successView:  @escaping () -> Content) {
        self.viewModel = viewModel
        self.failurePlaceholderMessage = failurePlaceholderMessage
        self.successView = successView
    }
    
    var body: some View {
        Group {
            if case LoadingState.success = viewModel.loadingState {
                successView()
            } else if case LoadingState.failure = viewModel.loadingState {
                NoContentPlaceholder(message: failurePlaceholderMessage)
                    .alert(isPresented: viewModel.$isAlertPresented, content: {
                        Alert(title: Text("Oops")
                              , message: Text("Something went wrong")
                              , dismissButton: .default(Text("Okay")))
                    })
                RefreshButton(viewModel: viewModel)
            } else {
                LoadingPlaceholder()
            }
        }
    }
}
