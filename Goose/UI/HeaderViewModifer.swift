//
//  HeaderViewModifer.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-15.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

struct HeaderViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.appSubheading)
        .foregroundColor(.primary)
        .padding(.leading)
    }
}
