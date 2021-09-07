//
//  ListItem.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 01/09/21.
//

import CloudKit
import SwiftUI

struct ListItem: Identifiable {
    var id = UUID()
    var ckId : CKRecord.ID?
    var check: Bool
    var image: Image?
    var name: String
    var description: String
    var quantity: Int
    var measurement: UnitMeasurement
}

enum UnitMeasurement: String {
    case unit = "Uni"
    case millilitre = "mL"
    case litre = "litros"
    case gram = "g"
    case kilogram = "Kg"
}
