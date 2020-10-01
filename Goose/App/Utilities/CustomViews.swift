//
//  CustomViews.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-08-20.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    let title: String
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text(title)
                    .headingFont()
                    .padding(.leading)
            }
        }
    }
}

struct SubheaderView: View {
    let title: String
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text(title)
                    .subheadingFont(color: .secondary)
                    .padding(.leading)
            }
        }
    }
}

struct PaddedDivider: View {
    var body: some View {
        Divider()
            .padding()
    }
}

struct ExpandButton: View {
    
    @Binding var isExpanded: Bool
    var body: some View {
        HStack {
            Spacer()
            Button(isExpanded ? "See Less" : "See More") {
                isExpanded.toggle()
            }
            .padding(.trailing)
            .labelFont(isBold: false, color: .blue)
        }
    }
}

struct NoContentPlaceholder: View {
    var message: String
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(message)
                .subheadingFont(color: UIColor.tertiaryLabel.color)
                .padding()
            Spacer()
        }
    }
}

struct LoadingPlaceholder: View {
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            ProgressView("Loading")
                .progressViewStyle(CircularProgressViewStyle(tint: .primary))
                .labelFont(isBold: true, color: .primary)
                .padding()
            Spacer()
        }
    }
}

struct CenterButton: View {
    var title: String
    var action: () -> ()
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Button(title, action: action)
                .subheadingFont(color: .blue)
                .padding()
            Spacer()
        }
    }
}

struct RefreshButton<R: Resource>: View {
    let viewModel: ViewModel<R>
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            Button(action: {
                viewModel.loadContent()
            }, label: {
                VStack {
                    Image(systemName: "arrow.clockwise")
                        .subheadingFont(color: .blue)
                    Text("Refresh")
                        .subheadingFont(color: .blue)
                }
            })
            Spacer()
        }
    }
}

struct CustomViews_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VStack {
                RefreshButton(viewModel: ViewModel<Subject>(WaterlooURL(url: "")))
            }
            .navigationTitle("Custom Views")
        }
    }
}
