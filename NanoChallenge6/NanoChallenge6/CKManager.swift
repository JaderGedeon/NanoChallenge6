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
    
    //iCloud.testezinhobacanaeshow
    //iCloud.Nano6
    let container = CKContainer(identifier: "iCloud.testezinhobacanaeshow").publicCloudDatabase
    
    // MARK: teste fetch do container do CloudKit
    func fetchList(completion: @escaping ( [CKRecord] ) -> () ) {
        
        let query = CKQuery(recordType: "Lists", predicate: NSPredicate(value: true))
        let operation = CKQueryOperation(query: query)
        
        var itemRecords: [CKRecord] = []
        
        operation.recordFetchedBlock = { record in
            itemRecords.append(record)
        }
        
        operation.queryCompletionBlock = { cursor, error in
            DispatchQueue.main.async {
                completion(itemRecords)
            }
        }
        
        container.add(operation)
    }
    
    // MARK: teste save do CKRecord no CloudKit
    func saveList(list: ListRecord) {
        
        let listRecordObject = CKRecord(recordType: "Lists")
        listRecordObject["name"] = list.name
        listRecordObject["description"] = list.description
        
        container.save(listRecordObject, completionHandler: { (record, error) in } )

    }
    
    func deleteList(recordID : CKRecord.ID) {

        container.delete(withRecordID: recordID, completionHandler: { (record, error) in } )
        
    }
    
    func fetchItems(listParent: CKRecord.ID, completion: @escaping ( [CKRecord] ) -> () ) {
        
        let reference = CKRecord.Reference(recordID: listParent, action: .none)
        let predicate = NSPredicate(format: "listParent == %@", reference)
        let query = CKQuery(recordType: "Item", predicate: predicate)
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
    
    func saveItem(item: ListItem, listParentID: CKRecord.ID) {
        
        let listRecordObject = CKRecord(recordType: "Item")
        
        listRecordObject["name"] = item.name
        listRecordObject["description"] = item.description
        listRecordObject["quantity"] = item.quantity
        listRecordObject["measurement"] = item.measurement.rawValue
        listRecordObject["check"] = item.check ? 1 : 0
        listRecordObject["listParent"] = CKRecord.Reference(recordID: listParentID, action: .deleteSelf)

        container.save(listRecordObject, completionHandler: { (record, error) in print(error ?? "de buenas") } )

    }
    
    func deleteItem(recordID : CKRecord.ID) {

        container.delete(withRecordID: recordID, completionHandler: { (record, error) in } )
        
    }
}
