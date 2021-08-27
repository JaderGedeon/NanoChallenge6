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
    func fetchList(completion: @escaping ( [CKRecord] ) -> () ) {
        
        let query = CKQuery(recordType: "Lists", predicate: NSPredicate(value: true))
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
    
    // MARK: teste save do CKRecord no CloudKit
    func saveList(list: ListRecord) {
        
        let listRecordObject = CKRecord(recordType: "Lists")
        listRecordObject["name"] = list.name
        
        container.save(listRecordObject, completionHandler: { (record, error) in } )

    }
    
    func deleteList(recordID : CKRecord.ID) {

        container.delete(withRecordID: recordID, completionHandler: { (record, error) in } )
        
    }
    
    func fetchItems(completion: @escaping ( [CKRecord] ) -> () ) {
        
        let query = CKQuery(recordType: "Item", predicate: NSPredicate(value: true))
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
    
    func saveItem(item: ListRecord) {
        
        let listRecordObject = CKRecord(recordType: "Item")
        listRecordObject["name"] = item.name
        
        container.save(listRecordObject, completionHandler: { (record, error) in } )

    }
    
    func deleteItem(recordID : CKRecord.ID) {

        container.delete(withRecordID: recordID, completionHandler: { (record, error) in } )
        
    }
}
