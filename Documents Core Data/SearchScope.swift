//
//  SearchScope.swift
//  Documents Core Data
//
//  Created by Brady Webb on 9/20/19.
//  Copyright © 2019 Brady Webb. All rights reserved.
//

import Foundation

enum SearchScope: String {
    case all
    case name
    case content
    
    static var titles: [String] {
        get {
            return [SearchScope.all.rawValue, SearchScope.name.rawValue, SearchScope.content.rawValue]
        }
    }
    
    static var scopes: [SearchScope] {
        get {
            return [SearchScope.all, SearchScope.name, SearchScope.content]
        }
    }
}
