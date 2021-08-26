//
//  CKManager.swift
//  NanoChallenge6
//
//  Created by Jader Rocha on 26/08/21.
//

import Foundation
import CloudKit

class CKManager {
    
    static var shared: CKManager = {
        let instance = CKManager()
        return instance
    }()
    
    private init() {}
    
    let container = CKContainer(identifier: "iCloud.Nano6").publicCloudDatabase
    
    // MARK: teste fetch do container do CloudKit
    func fetchListsOther(completion: @escaping ( [CKRecord] ) -> () ) {
        
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Lists", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let operation = CKQueryOperation(query: query)
        
        var itemRecords: [CKRecord] = []

        operation.recordFetchedBlock = { record in
            itemRecords.append(record)
        }
        
        operation.queryCompletionBlock = { cursor, error in
            completion(itemRecords)
        }
        
        container.add(operation)
    }
}

//func fetchLists() {
//    print("fetching")
//
//    let query = CKQuery(recordType: "Lists", predicate: NSPredicate(value: true))
//
//    query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
//
//    container.perform(query, inZoneWith: nil) { (records, error) in
//        records?.forEach({ (record) in
//            guard error == nil else {
//                print(error?.localizedDescription as Any)
//                return
//            }
//
//            print(record.value(forKey: "name") ?? "nao")
//        })
//    }
//}
