//
//  SubjectButton.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-03-20.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct SubjectButton: View {
    let buttonWidth: CGFloat = 101.0
    let buttonHeight: CGFloat = 62.0
    let buttonCornerRadius: CGFloat = 20.0
    
    var subject:Subject?
    
    var body: some View {
        HStack {
            Button(action: {
                
            }) {
                Text(subject.name)
                    .font(.system(size: 18, weight: .heavy, design: .rounded))
                    .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
                    .background(Color(AppColors.lightOrange))
                    .foregroundColor(Color.white)
                    .cornerRadius(20.0)
            }
        }
    }
}

struct SubjectButton_Previews: PreviewProvider {
    static var previews: some View {
        SubjectButton(subject: AppMockContent.mockSubject1)
    }
}
