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
                    
                    print("item added")
                    allLists[i].items.append(item)

                }
            }
        }
    }
    
//    func add(items: [ListItem], to list: ListRecord) {
//        if let list = allLists.first(where: { list.id == $0.id }) {
//            for item in items {
//                print("saving item")
//                cloudKitManager.saveItem(item: item, listParentID: list.id!) { record in
//
//                }
//            }
//        }
//    }
    
    func add(item: ListItem, to list: ListRecord) {
        cloudKitManager.saveItem(item: item, listParentID: list.id!) { record in
            var newItem = ListItem(check: item.check, name: item.name, description: item.description, quantity: item.quantity, measurement: item.measurement)
            newItem.ckId = record.recordID
            
            DispatchQueue.main.async {
                if let index = self.allLists.firstIndex(where: { $0.id == list.id}) {
                    self.allLists[index].items.append(newItem)
                }
            }
        }
    }
    
    func fetchItems(from list: ListRecord) {
        guard let index = allLists.firstIndex(where: {$0.id == list.id} ) else { print("didn't find"); return }
        
        cloudKitManager.fetchItems(listParent: list.id!) { [self] (ckItems) in
            print("no items")
            for item in ckItems {
                print(item)
                
                let ckItem = ListItem(check: false, name: item.value(forKey: "name") as! String, description: item.value(forKey: "description") as! String, quantity: item.value(forKey: "quantity") as! Int, measurement: UnitMeasurement.init(rawValue: item.value(forKey: "unit") as! String) ?? .unit)
                self.allLists[index].items.append(ckItem)
            }
        }

    }

    
    static func == (lhs: ListManager, rhs: ListManager) -> Bool {
        return lhs.allLists == rhs.allLists && lhs.individualList == rhs.individualList && lhs.sharedList == rhs.sharedList
    }
}
