//
//  AddListView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 25/08/21.
//

import SwiftUI

struct AddListView: View {
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor(named: "primary")
    }
    
    // mostrar lista recém criada
    var list = ListRecord(name: "Nova Lista", description: "Descrição")
    
    var body: some View {
        ScrollView {
            ListHeaderView(list: ListRecord(name: "Nova Lista", description: ""))
            AddListItemView()
            
        }// scroll
        .navigationBarTitle("", displayMode: .inline)
     
    } // body
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        AddListView()
    }
}
