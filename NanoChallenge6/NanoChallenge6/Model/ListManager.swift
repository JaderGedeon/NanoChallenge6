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
    
    private var recordList1 = [CKRecord]()
    private var downloadedList = [ListRecord]()
    
    @Published var allLists: [ListRecord]
    @Published var individualList = [ListRecord(name: "individual", description: "")]
    @Published var sharedList = [ListRecord(name: "compartilhada", description: "")]
    
    init() {
        // ruim, essa classe não deveria ser responsável por criar uma instância de ListRecord
        self.allLists = [ListRecord]()
        
        self.downloadedList = parse(downloadList())
    }

    func fetchList() {
        CKManager.shared.fetchList { [self] (list) in
            self.recordList1 = list
            self.parseListRecords()
//            updateListView()
            print("FETCHING")
        }
    }
    
    func fetchListByName(name: String) -> ListRecord {
        return allLists.first(where: { $0.name == name }) ?? ListRecord(name: "Lista", description: "")
    }
    
    private func downloadList() -> [CKRecord] {
        let recordList = [CKRecord]()
        CKManager.shared.fetchList { (list) in
            self.recordList1 = list
        }
        return recordList
    }
    
    func addNewList(newList: ListRecord) {
        cloudKitManager.saveList(list: newList)
        allLists.append(newList)
        print("adi")
    }
    
    private func parse(_ downloadedList: [CKRecord]) -> [ListRecord] {
        var lists = [ListRecord]()
        for record in downloadedList {
            let description = record.value(forKey: "description") ?? ""
            let list = ListRecord(name: record.value(forKey: "name") as! String, description: description as! String)
            lists.append(list)
        }
        return lists
    }
    
    private func parseListRecords() {
        for i in 0..<recordList1.count {
            let description = recordList1[i].value(forKey: "description") ?? ""
            var list = ListRecord(name: recordList1[i].value(forKey: "name") as! String, description: description as! String)
            var item = ListItem(check: false, name: "macarrao", description: "dona benta", quantity: 1, measurement: UnitMeasurement.unit)
            list.items?.append(item)
            // verificar se algum record foi adicionado
            if !allLists.contains(list) {
                print("adicionou um novo")
                allLists.append(list)
            }
        }
    }
    
    func getList(index: Int) -> ListRecord {
        if index < allLists.count {
            return allLists[index]
        }
        return ListRecord(name: "", description: "", items: nil)
    }
    
    func resetLists() {
        recordList1.removeAll()
        allLists.removeAll()
    }
    
    func getLists() -> [ListRecord] {
        return allLists
    }
    
    func printListName() {
        for list in allLists {
            print("nome \(list.name)")
        }
    }
    
    static func == (lhs: ListManager, rhs: ListManager) -> Bool {
        return lhs.allLists == rhs.allLists && lhs.individualList == rhs.individualList && lhs.sharedList == rhs.sharedList
    }
}
