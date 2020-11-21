//
//  ResourceView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-08-27.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI
import Foundation

struct ResourceView<T: Resource, Content>: View where Content: View {
    
    @ObservedObject var viewModel: ViewModel<T>
    var failurePlaceholderMessage: String
    var successView: () -> Content

    init(viewModel: ViewModel<T>, failurePlaceholderMessage: String, @ViewBuilder successView:  @escaping () -> Content) {
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
                    .alert(isPresented: viewModel.$isAlertPresented) {
                        Alert(title: Text(R.string.localizable.titleAlert())
                              , message: Text(R.string.localizable.messageAlert())
                              , dismissButton: .default(Text(R.string.localizable.buttonLabelConfirm())))
                    }
                RefreshButton(viewModel: viewModel)
            } else {
                LoadingPlaceholder()
            }
        }
    }
}
