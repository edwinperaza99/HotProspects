//
//  Prospects.swift
//  HotProspects
//
//  Created by Edwin on 5/9/24.
//

import SwiftData
import Foundation

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    var dateAdded = Date.now
    
    init(name: String, emailAddress: String, isContacted: Bool, dateAdded: Foundation.Date = Date.now) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.dateAdded = dateAdded
    }
}
