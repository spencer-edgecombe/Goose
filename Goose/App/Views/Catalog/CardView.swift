//
//  CardView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-10-19.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct CardView<Content>: View where Content: View {
    var title: String
    var titleColor: Color
    var isLink: Bool
    var content: () -> Content
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                Spacer()
                if isLink {
                    Image(systemName: "chevron.right")
                }
            }
            .bottomPadding(.halfSpacing)
            .bodyFont(isBold: true, color: titleColor)
            content()
        }
        .padding()
        .background(UIColor.secondarySystemGroupedBackground.color)
        .cornerRadius(12)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            UIColor.systemGroupedBackground.color
                .edgesIgnoringSafeArea(.all)
            VStack {
                CardView(title: "Example", titleColor: .blue, isLink: false) {
                    Text("Yas")
                }
                CardView(title: "Example with link", titleColor: .blue, isLink: true) {
                    Text("Yas")
                }
            }
        }
    }
}
