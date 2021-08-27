//
//  ListRecor.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 25/08/21.
//

import SwiftUI
import CloudKit

struct ListRecord: Equatable {
//    var id: CKRecord.ID
    var name: String
    var description: String
    
    var items: [ListItem]?
    
    static func == (lhs: ListRecord, rhs: ListRecord) -> Bool {
        return lhs.name == rhs.name && lhs.description == rhs.description
    }
}

enum UnitMeasurement: String {
    case unit = "Uni"
    case millilitre = "mL"
    case litre = "litros"
    case gram = "g"
    case kilogram = "Kg"
}

struct ListItem: Identifiable {
    var id = UUID()
    var check: Bool
    var image: Image?
    var name: String
    var description: String
    var quantity: Int
    var measurement: UnitMeasurement
}
