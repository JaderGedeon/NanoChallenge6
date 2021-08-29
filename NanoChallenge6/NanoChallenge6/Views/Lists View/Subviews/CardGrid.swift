//
//  CardGrid.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 26/08/21.
//

import SwiftUI

// collection de cards
struct CardGrid: View {
    @EnvironmentObject var listManager: ListManager
    var listType: String
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 135, maximum: 500)), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 20){
            switch listType {
            case "shared":
                ForEach(0..<listManager.sharedList.count, id: \.self) { i in
                    NavigationLink(destination: ListView(list: $listManager.sharedList[i])) {
                        CardList(list: listManager.sharedList[i])
                    }
                }
            case "individual":
                ForEach(0..<listManager.individualList.count, id: \.self) { i in
                    NavigationLink(destination: ListView(list: $listManager.individualList[i])) {
                        CardList(list: listManager.individualList[i])
                    }
                }
            default:
                ForEach(0..<listManager.allLists.count, id: \.self) { i in
                    NavigationLink(destination: ListView(list: $listManager.allLists[i])) {
                        CardList(list: listManager.allLists[i])
                    }
                }
            }

            NavigationLink(destination: AddListView()) {
                CardButton()
            }
        }
    }
}
