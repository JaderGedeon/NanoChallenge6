//
//  Lista.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 30/08/21.
//

import CloudKit

struct Lista: Equatable, Hashable {
    static func == (lhs: Lista, rhs: Lista) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: CKRecord.ID?
    var nome: String
    var descricao: String
    var itens = [Item]()
}

struct Item: Hashable {
    var nome: String
    var listaPai: CKRecord.Reference?
}
