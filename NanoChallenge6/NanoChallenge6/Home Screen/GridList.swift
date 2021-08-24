//
//  ListGrid.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 24/08/21.
//

import SwiftUI

struct GridList: View {
    @State private var showItemForm = false
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 135, maximum: 500)), count: 2)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 20){
                CardList(text: "Lista 1")
                CardList(text: "Lista 2")
                Button(action: addItem, label: {
                    CardButton()
                }).sheet(isPresented: $showItemForm, content: {
                    ItemView()
                })
            }
        }
    }
    
    func addItem() {
        print("add")
        showItemForm = true
    }
}

struct ListGrid_Previews: PreviewProvider {
    static var previews: some View {
        GridList()
    }
}
