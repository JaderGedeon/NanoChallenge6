//
//  Lista.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 30/08/21.
//

import CloudKit

struct Lista: Hashable {
    var id: CKRecord.ID?
    var nome: String
    var descricao: String
}
