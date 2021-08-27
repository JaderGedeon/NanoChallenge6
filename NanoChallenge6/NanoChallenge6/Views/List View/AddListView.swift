//
//  AddListView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 25/08/21.
//

import SwiftUI

struct AddListView: View {
    @EnvironmentObject var listManager: ListManager
    
    init() {
        setNavigationBarAppearance()
    }
    
    // mostrar lista recém criada
    @State var list = ListRecord(name: "", description: "")
    
    var body: some View {
        ScrollView {
            ListFormHeaderView(list: $list)
            AddListItemView()
            
        }// scroll
        .navigationBarTitle("", displayMode: .inline)
        .onDisappear(perform: {
            listManager.addNewList(newList: list)
            listManager.fetchList()
        })
     
    } // body
    
    func setNavigationBarAppearance() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor(named: "primary")
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView()
    }
}
