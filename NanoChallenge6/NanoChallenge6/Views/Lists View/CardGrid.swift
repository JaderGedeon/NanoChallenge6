//
//  CardGrid.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 26/08/21.
//

import SwiftUI

struct CardGrid: View {
    var lists: [ListRecord]
    var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 135, maximum: 500)), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 20){
            ForEach(0..<lists.count, id: \.self) { i in
                NavigationLink(destination: ListView()) {
                    CardList(list: lists[i])
                }
            }
            NavigationLink(destination: AddListView()) {
                CardButton()
            }
        }
    }
}
