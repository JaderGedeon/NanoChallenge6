//
//  ListView.swift
//  NanoChallenge6
//
//  Created by Jader Rocha on 24/08/21.
//

import SwiftUI
import CloudKit

struct ListView: View {
    @State private var showingDetailView = false
    
    var list: ListRecord
    
    init(list: ListRecord) {
        self.list = list
        setNavigationAppearance()
    }
    
    @State var ListItemData = [
        ListItem(check: true, image: nil, name: "Guaraná 2L", description: "", quantity: 6, measurement: .litre),
        ListItem(check: false, image: nil, name: "Farinha", description: ", integral da Dona Benta, pacote azul Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ultricies sem eget tellus varius, eu malesuada neque auctor. Duis quis placerat eros. Duis posuere hendrerit urna in facilisis.", quantity: 10, measurement: .kilogram)
    ]
    
    var body: some View {
        ScrollView {
            
            HeaderView(list: list)
            
            LazyVStack() {
                
                ForEach(ListItemData) { item in
                    ListItemView(item: item).onTapGesture {
                        showingDetailView.toggle()
                    }.sheet(isPresented: $showingDetailView) {
                        ItemDetailView(item: $ListItemData[0])
                    }
                    
                }
                AddListItemView()
            }
            
        }
        .navigationBarTitle("", displayMode: .inline)
        
    }
    
    func setNavigationAppearance() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor(named: "primary")
    }
    
}
