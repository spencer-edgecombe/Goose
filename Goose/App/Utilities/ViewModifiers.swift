//
//  AppViews.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-07-24.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func shadow() -> some View {
        self.modifier(ShadowModifier())
    }
//    
//    func headingFont(isBold: Bool = true, color: Color = .primary) -> some View {
//        self.modifier(HeadingModifier(isBold: isBold, color: color))
//    }
//    
//    func subheadingFont(isBold: Bool = true, color: Color = .primary) -> some View {
//        self.modifier(SubheadingModifier(isBold: isBold, color: color))
//    }
//    
//    func labelFont(isBold: Bool = true, color: Color = .primary) -> some View {
//        self.modifier(LabelModifier(isBold: isBold, color: color))
//    }
//    
//    func bodyFont(isBold: Bool = true, color: Color = .primary) -> some View {
//        self.modifier(BodyModifier(isBold: isBold, color: color))
//    }
//    
//    func smallFont(isBold: Bool = true, color: Color = .primary) -> some View {
//        self.modifier(SmallModifier(isBold: isBold, color: color))
//    }
//       
//    func largeFont(isBold: Bool = true, color: Color = .primary) -> some View {
//        self.modifier(LargeModifier(isBold: isBold, color: color))
//    }
//    
//    func extraLargeFont(isBold: Bool = true, color: Color = .primary) -> some View {
//        self.modifier(ExtraLargeModifier(isBold: isBold, color: color))
//    }
//    
    func navigationBarTintColor(_ backgroundColor: Color) -> some View {
        self.modifier(NavigationBarBackgroundModifier(backgroundColor: backgroundColor))
    }
    
    func navigationBarForegroundColor(_ foregroundColor: Color) -> some View {
        self.modifier(NavigationBarForegroundModifier(foregroundColor: foregroundColor))
    }
    
    func horizontalPadding(_ spacing: CGFloat = .spacing) -> some View {
        self.modifier(HorizontalPaddingModifier(spacing: spacing))
    }
    
    func verticalPadding(_ spacing: CGFloat = .spacing) -> some View {
        self.modifier(VerticalPaddingModifier(spacing: spacing))
    }
    
    func bottomPadding(_ spacing: CGFloat = .spacing) -> some View {
        self.padding(.bottom, spacing)
    }
    
    func topPadding(_ spacing: CGFloat = .spacing) -> some View {
        self.padding(.top, spacing)
    }
    
    func leadingPadding(_ spacing: CGFloat = .spacing) -> some View {
        self.padding(.leading, spacing)
    }
    
    func trailingPadding(_ spacing: CGFloat = .spacing) -> some View {
        self.padding(.trailing, spacing)
    }
    
    func padding(horizontal: CGFloat, vertical: CGFloat) -> some View {
        self.horizontalPadding(horizontal)
        .verticalPadding(vertical)
    }
}

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}

struct HeadingModifier: ViewModifier {
   
    var isBold: Bool
    var color: Color

    func body(content: Content) -> some View {
        content.font(isBold ? Font.appHeading.weight(Font.boldWeight) : Font.appHeading.weight(Font.regularWeight))
            .foregroundColor(color)
    }
}

struct SubheadingModifier: ViewModifier {
   
    var isBold: Bool
    var color: Color

    func body(content: Content) -> some View {
        content.font(isBold ? Font.appSubheading.weight(Font.boldWeight) : Font.appSubheading.weight(Font.regularWeight))
        .foregroundColor(color)

    }
}

struct LabelModifier: ViewModifier {
   
    var isBold: Bool
    var color: Color

    func body(content: Content) -> some View {
        content.font(isBold ? Font.appLabel.weight(Font.boldWeight) : Font.appLabel.weight(Font.regularWeight))
            .foregroundColor(color)
    }
}

struct BodyModifier: ViewModifier {
   
    var isBold: Bool
    var color: Color

    func body(content: Content) -> some View {
        content.font(isBold ? Font.appBody.weight(Font.boldWeight) : Font.appBody.weight(Font.regularWeight))
            .foregroundColor(color)
    }
}

struct SmallModifier: ViewModifier {
   
    var isBold: Bool
    var color: Color

    func body(content: Content) -> some View {
        content.font(isBold ? Font.appSmall.weight(Font.boldWeight) : Font.appSmall.weight(Font.regularWeight))
            .foregroundColor(color)
    }
}

struct LargeModifier: ViewModifier {
    
    var isBold: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        content.font(isBold ? Font.appLarge.weight(Font.boldWeight) : Font.appLarge.weight(Font.regularWeight))
            .foregroundColor(color)
    }
}

struct ExtraLargeModifier: ViewModifier {
    
    var isBold: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        content.font(isBold ? Font.appXLarge.weight(Font.boldWeight) : Font.appXLarge.weight(Font.regularWeight))
            .foregroundColor(color)
    }
}

struct HorizontalPaddingModifier: ViewModifier {
    var spacing: CGFloat
    func body(content: Content) -> some View {
        content
            .padding([.leading, .trailing], spacing)
    }
}

struct VerticalPaddingModifier: ViewModifier {
    var spacing: CGFloat
    func body(content: Content) -> some View {
        content
            .padding([.top, .bottom], spacing)
    }
}

struct AppViews_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


struct NavigationBarBackgroundModifier: ViewModifier {
        
    var backgroundColor: Color
    
    init( backgroundColor: Color) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes[.font] = UIFont.appLabel
        coloredAppearance.largeTitleTextAttributes[.font] = UIFont.appLargeTitle
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white

    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    backgroundColor
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

struct NavigationBarForegroundModifier: ViewModifier {
        
    var foregroundColor: Color
    
    init( foregroundColor: Color) {
        self.foregroundColor = foregroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.titleTextAttributes[.foregroundColor] = UIColor(foregroundColor)
        coloredAppearance.largeTitleTextAttributes[.foregroundColor] = UIColor(foregroundColor)
        coloredAppearance.titleTextAttributes[.font] = UIFont.appLabel
        coloredAppearance.largeTitleTextAttributes[.font] = UIFont.appLargeTitle
        UINavigationBar.appearance().standardAppearance = coloredAppearance
    }
    
    func body(content: Content) -> some View {
        content
    }
}


