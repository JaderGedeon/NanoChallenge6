//
//  ListRecor.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 25/08/21.
//

import SwiftUI
import CloudKit

struct ListRecord: Equatable {
    var id: CKRecord.ID?
    var name: String
    var description: String
    
    var items: [ListItem]
    
    init(name: String, description: String) {
        items = [ListItem]()
        self.name = name
        self.description = description
    }
    
    init(id: CKRecord.ID, name: String, description: String) {
        self.id = id
        self.name = name
        self.description = description
        
        items = [ListItem]()
    }
    
    static func == (lhs: ListRecord, rhs: ListRecord) -> Bool {
        return lhs.id == rhs.id
    }
}




