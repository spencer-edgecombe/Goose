//
//  State.swift
//  Goose
//
//  Created by Spencer Edgecombe on 2020-06-23.
//  Copyright © 2020 com.spenceredgecombe. All rights reserved.
//

import Foundation

enum LoadingState {
    case loading, success, failure(message: String)
}
