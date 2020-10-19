//
//  TitledView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-09-02.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct TitledView<Content>: View where Content: View {
    
    var title: String
    var titleColor: Color
    var content: () -> Content
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .leading) {
                Text(title)
                    .headingFont(color: titleColor)
                    .padding(.top, -.halfSpacing)
                    .padding(.leading)
                content()
            }
            .bottomPadding()
        }
    }
}

struct TitledView_Previews: PreviewProvider {
    static var previews: some View {
        TitledView(title: "Title", titleColor: .primary) {
            Text("Body")
        }
    }
}
