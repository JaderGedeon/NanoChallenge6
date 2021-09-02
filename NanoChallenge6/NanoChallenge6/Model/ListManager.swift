//
//  Lists.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 26/08/21.
//

import CloudKit
import SwiftUI

class ListManager: ObservableObject, Equatable {

    var cloudKitManager = CKManager.shared

    @Published var allLists: [ListRecord]
    @Published var individualList = [ListRecord(name: "individual", description: "")]
    @Published var sharedList = [ListRecord(name: "compartilhada", description: "")]
    
    init() {
        // ruim, essa classe não deveria ser responsável por criar uma instância de ListRecord
        self.allLists = [ListRecord]()
    }

    func fetchLists() {
        cloudKitManager.fetchList { [self] (lists) in
            for list in lists {
                let ckList = ListRecord(id: list.recordID, name: list.value(forKey: "name") as! String, description: list.value(forKey: "description") as? String ?? "")
                
                if !allLists.contains(ckList) {
                    allLists.append(ckList)
                }
            }
        }
    }
    
    func addNewList(newList: ListRecord) {
        cloudKitManager.saveList(list: newList) { (listaCriada) in
            var list = ListRecord(name: newList.name, description: newList.description)
            list.id = listaCriada.recordID
            self.allLists.append(list)
        }
    }
    
    
    func deleteList(list: ListRecord) {
        if let id = list.id {
            cloudKitManager.deleteList(recordID: id)
        }
    }
    
    // MARK: Items manager
    func fetchListItems() {
        print("fetching items")
        for i in 0..<allLists.count {
            cloudKitManager.fetchItems(listParent: allLists[i].id!) { [self] (listItems) in
                for record in listItems {
                    let item = ListItem(check: false, name: record.value(forKey: "name") as! String, description: record.value(forKey: "description") as! String, quantity: record.value(forKey: "quantity") as! Int, measurement: UnitMeasurement.init(rawValue: record.value(forKey: "unit") as! String) ?? .unit)
                    
                    allLists[i].items.append(item)

                }
            }
        }
    }
    
    

    
    static func == (lhs: ListManager, rhs: ListManager) -> Bool {
        return lhs.allLists == rhs.allLists && lhs.individualList == rhs.individualList && lhs.sharedList == rhs.sharedList
    }
}
