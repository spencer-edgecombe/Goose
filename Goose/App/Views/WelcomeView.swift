//
//  WelcomeView.swift
//  
//
//  Created by Spencer Edgecombe on 2020-11-21.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                }
                .trailingPadding()
                .topPadding()
                .subheadingFont(color: UIColor.tertiaryLabel.color)
            }
            ScrollView {
                VStack {
                    Text(R.string.localizable.titleWelcome())
                        .customFont(size: FontSize.largeTitle, weight: .bold)
                        .padding(.spacing)
                    Image(systemName: "sparkles")
                        .xxLargeFont(isBold: false, color: .yellow)
                        .bottomPadding(.spacing)
                    Text(R.string.localizable.messageWelcomeAppDescription())
                        .multilineTextAlignment(.center)
                        .padding(.doubleSpacing)
                        .labelFont(isBold: false)
                    Text(R.string.localizable.headerPopoverWelcomeDataPolicy())
                        .headingFont()
                    Image(systemName: "lock.rectangle.stack.fill")
                        .xLargeFont(isBold: false, color: .blue)
                        .padding()
                    Text(R.string.localizable.messageWelcomeDataPolicy())
                        .horizontalPadding(.doubleSpacing)
                        .labelFont(isBold: false)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    @State static var isPresented: Bool = false
    static var previews: some View {
        WelcomeView(isPresented: $isPresented)
    }
}
