//
//  SettingsView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-11-16.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel = SettingsViewModel()
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: AcknowledgementView()) {
                    Text(R.string.localizable.titleAcknowledgements())
                        .labelFont(isBold: false, color: .primary)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(R.string.localizable.titleSettings())
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
