//
//  Lists.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 26/08/21.
//

import CloudKit
import SwiftUI

class ListManager: ObservableObject {
    var cloudKitManager = CKManager.shared
    var listsRecords = [CKRecord]()
    @Published var allLists: [ListRecord] = [ListRecord]()
    
    init() {
        CKManager.shared.fetchListsOther { ( list ) in
            self.listsRecords = list
            self.parseListRecords()
        }
    }
    
    func getLists() -> [ListRecord] {
        return allLists
    }
    
    func printListName() {
        for list in allLists {
            print("nome \(list.name)")
        }
    }
    
    private func parseListRecords() {
        for record in listsRecords {
            let list = ListRecord(name: record.value(forKey: "name") as! String, description: "")
            allLists.append(list)
        }
    }
    
}
