//
//  AcknowledgementView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-11-16.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct AcknowledgementView: View {
    var body: some View {
        List {
            Section(header: ListSectionHeader(text: R.string.localizable.headerListAcknowledgementsAppIcon())) {
                HStack {
                    Text(R.string.localizable.headerDetailAcknowledgementsCreatedBy())
                        .labelFont(isBold: false)
                    Spacer()
                    Link(R.string.localizable.messageAcknowledgementsFreepik(), destination: URL(string: "https://www.flaticon.com/authors/freepik")!)
                        .labelFont(isBold: false, color: .blue)
                }
                HStack {
                    Text(R.string.localizable.headerDetailAcknowledgementsFoundFrom())
                        .labelFont(isBold: false)
                    Spacer()
                    Link(R.string.localizable.messageAcknowledgementsFlaticon(), destination: URL(string: "https://www.flaticon.com/")!)
                        .labelFont(isBold: false, color: .blue)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
            .navigationTitle(R.string.localizable.titleAcknowledgements())
    }
}

struct AcknowledgementView_Previews: PreviewProvider {
    static var previews: some View {
        AcknowledgementView()
    }
}
