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
    
    let container = CKContainer(identifier: "iCloud.testezinhobacanaeshow").publicCloudDatabase
    
    // MARK: teste fetch do container do CloudKit
    func fetchList(completion: @escaping ( [CKRecord] ) -> () ) {
        
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
    
    // MARK: teste save do CKRecord no CloudKit
    func saveList() {
        
        let oizinho = CKRecord.init(recordType: "Lists")
        oizinho.setObject("ListaDeMercado" as __CKRecordObjCValue, forKey: "name")
        
        container.save(oizinho, completionHandler: { (record, error) in
//
//            if error != nil {
//                print("There was an error \(error!)")
//            }
            
        })
    }
    
    func deleteList(recordID : CKRecord.ID) {

        container.delete(withRecordID: recordID, completionHandler: { (record, error) in } )
        
    }
    
    func modifyList() {
        
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
