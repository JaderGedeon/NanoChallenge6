//
//  CardGrid.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 26/08/21.
//

import SwiftUI

// collection de cards
struct CardGrid: View {
    var lists: [ListRecord]
    @EnvironmentObject var listManager: ListManager
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 135, maximum: 500)), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 20){
            ForEach(0..<lists.count, id: \.self) { i in
                NavigationLink(destination: ListView(list: listManager.getList(index: i))) {
                    CardList(list: lists[i])
                }
            }
            NavigationLink(destination: AddListView()) {
                CardButton()
            }
        }
    }
}
