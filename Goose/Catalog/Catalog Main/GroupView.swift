//
//  GroupView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-15.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct GroupView: View {
    
    var group: Group
    
    var groupViewHeight: CGFloat {
        return groupViewWidth.divide(by: CGFloat.phi.power(of: 0.5))
    }
    
    var groupViewWidth: CGFloat
    
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(Goose.groupColor(group: group.code)))
                .frame(width: self.groupViewWidth, height: self.groupViewHeight, alignment: .center)
                .modifier(ShadowModifier())
            VStack(alignment: .center, spacing: CGFloat.spacing.half){
                Image(systemName: Goose.groupIconName(group: self.group.code))
                    .foregroundColor(.background)
                    .font(.appLarge)
                    .padding(.top, CGFloat.spacing.half)
                Text(self.group.code.rawValue)
                    .font(.appHeading)
                    .foregroundColor(.background)
                    .padding(.top, CGFloat.spacing.half)
                
            }
        }
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView(group: Group(code: .ART, name: "Arts"), groupViewWidth: CGFloat(343).divide(by: CGFloat.phi))
    }
}
