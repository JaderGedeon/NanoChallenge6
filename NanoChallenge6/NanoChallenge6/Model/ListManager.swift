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
    
    private var listsRecords = [CKRecord]()
    
    @Published var allLists: [ListRecord]
    @Published var individualList = [ListRecord(name: "individual", description: "")]
    @Published var sharedList = [ListRecord(name: "compartilhada", description: "")]
    
    init() {
        // ruim, essa classe não deveria ser responsável por criar uma instância de ListRecord
        self.allLists = [ListRecord]()
        CKManager.shared.fetchList { (list) in
            self.listsRecords = list
            self.parseListRecords()
        }
    }
    
    private func parseListRecords() {
        // guardar só o que for único
        for record in listsRecords {
            let list = ListRecord(name: record.value(forKey: "name") as! String, description: "")
            allLists.append(list)
        }
    }
    
    func fetchList() {
//        CKManager.shared.fetchList { (list) in
//            self.listsRecords = list
//            self.parseListRecords()
//        }
    }
    
    func addNewList(newList: ListRecord) {
        cloudKitManager.saveList(list: newList)
    }
    
    func getLists() -> [ListRecord] {
        return allLists
    }
    
    func printListName() {
        for list in allLists {
            print("nome \(list.name)")
        }
    }
}
