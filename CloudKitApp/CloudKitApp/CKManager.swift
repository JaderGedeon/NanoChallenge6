//
//  CKManager.swift
//  CloudKitApp
//
//  Created by Jader Rocha on 30/08/21.
//

import Foundation
import CloudKit

class CKManager {
    
    static var shared: CKManager = {
        
        let instance = CKManager()
        return instance
        
    }()
    
    private init() {}
    
    let container = CKContainer(identifier: "iCloud.CloudKitExampIe").publicCloudDatabase
    
    func buscarLista(completado: @escaping ([CKRecord]) -> ()) {
        
        let consulta = CKQuery(recordType: "Lista", predicate: NSPredicate(value: true))
        let operacao = CKQueryOperation(query: consulta)
        
        var registrosLista = [CKRecord]()
        
        operacao.recordFetchedBlock = { registro in
            registrosLista.append(registro)
        }
        
        operacao.queryCompletionBlock = { cursor, error in
            DispatchQueue.main.async {
                completado(registrosLista)
            }
        }
        
        container.add(operacao)
    }
    
    func salvarLista(lista: Lista, completado: @escaping (CKRecord) -> ()) {
        
        let registroLista = CKRecord(recordType: "Lista")
        
        registroLista["nome"] = lista.nome
        registroLista["descricao"] = lista.descricao

        container.save(registroLista, completionHandler: {( registro, error ) in
            completado(registro!)
        })
    }
    
    func deletarLista(id : CKRecord.ID) {
        
        container.delete(withRecordID: id, completionHandler: {( registro, error ) in })
        
    }
}
