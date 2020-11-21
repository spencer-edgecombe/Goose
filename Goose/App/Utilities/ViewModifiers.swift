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
    
    func headingFont(isBold: Bool = true, color: Color = .primary) -> some View {
        self.modifier(HeadingModifier(isBold: isBold, color: color))
    }
    
    func subheadingFont(isBold: Bool = true, color: Color = .primary) -> some View {
        self.modifier(SubheadingModifier(isBold: isBold, color: color))
    }
    
    func labelFont(isBold: Bool = true, color: Color = .primary) -> some View {
        self.modifier(LabelModifier(isBold: isBold, color: color))
    }
    
    func bodyFont(isBold: Bool = true, color: Color = .primary) -> some View {
        self.modifier(BodyModifier(isBold: isBold, color: color))
    }
    
    func smallFont(isBold: Bool = true, color: Color = .primary) -> some View {
        self.modifier(SmallModifier(isBold: isBold, color: color))
    }
       
    func largeFont(isBold: Bool = true, color: Color = .primary) -> some View {
        self.modifier(LargeModifier(isBold: isBold, color: color))
    }
    
    func largeTitleFont(isBold: Bool = true, color: Color = .primary) -> some View {
        self.modifier(LargeModifier(isBold: isBold, color: color))
    }
    
    func xLargeFont(isBold: Bool = true, color: Color = .primary) -> some View {
        self.modifier(XLargeModifier(isBold: isBold, color: color))
    }
    
    func xxLargeFont(isBold: Bool = true, color: Color = .primary) -> some View {
        self.modifier(XXLargeModifier(isBold: isBold, color: color))
    }
    
    func customFont(size: CGFloat, weight: Font.Weight = Font.boldWeight, color: Color = .primary) -> some View {
        self.font(.system(size: size, weight: weight, design: .rounded))
            .foregroundColor(color)
    }
    
    func xxxLargeFont(isBold: Bool = true, color: Color = .primary) -> some View {
        self.modifier(XXXLargeModifier(isBold: isBold, color: color))
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

struct LargeTitleModifier: ViewModifier {
    
    var isBold: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        content.font(isBold ? Font.appLarge.weight(Font.boldWeight) : Font.appLargeTitle.weight(Font.regularWeight))
            .foregroundColor(color)
    }
}

struct XLargeModifier: ViewModifier {
    
    var isBold: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        content.font(isBold ? Font.appXLarge.weight(Font.boldWeight) : Font.appXLarge.weight(Font.regularWeight))
            .foregroundColor(color)
    }
}

struct XXLargeModifier: ViewModifier {
    
    var isBold: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        content.font(isBold ? Font.appXXLarge.weight(Font.boldWeight) : Font.appXXLarge.weight(Font.regularWeight))
            .foregroundColor(color)
    }
}

struct XXXLargeModifier: ViewModifier {
    
    var isBold: Bool
    var color: Color
    
    func body(content: Content) -> some View {
        content.font(isBold ? Font.appXXXLarge.weight(Font.boldWeight) : Font.appXXXLarge.weight(Font.regularWeight))
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
