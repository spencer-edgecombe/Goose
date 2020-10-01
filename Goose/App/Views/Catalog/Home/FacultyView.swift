//
//  FacultyView.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-05-15.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import SwiftUI

struct FacultyView: View {
    
    var faculty: Faculty
        
    var body: some View {
            Group {
                ZStack(alignment: .top) {
                    Faculty.color(faculty: faculty.code)
                    VStack(alignment: .trailing, spacing: CGFloat.spacing) {
                        HStack(alignment: .top) {
                            Image(systemName: Faculty.iconName(faculty: faculty.code))
                                .headingFont(color: .white)
                                .frame(width: .spacing, height: .spacing, alignment: .center)
                                .padding(.halfSpacing)
                            Spacer()
                        }
                        HStack(alignment: .bottom) {
                            Text(faculty.code.rawValue)
                                .labelFont(color: .white)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    .padding()
                }
            }
            .cornerRadius(.spacing)
            .padding(.bottom, .halfSpacing)
            .shadow()
    }
}

struct FacultyView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogHome(true)
    }
}
