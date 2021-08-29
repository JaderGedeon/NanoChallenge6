//
//  ListView.swift
//  NanoChallenge6
//
//  Created by Jader Rocha on 24/08/21.
//

import SwiftUI
import CloudKit

struct ListView: View {
    @State private var showingItemDetailView = false
    @State private var showingConfigurationView = false
    
    @Binding var list: ListRecord
    
    init(list: Binding<ListRecord>) {
        self._list = list
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
                        showingItemDetailView.toggle()
                    }
                    .sheet(isPresented: $showingItemDetailView) {
                        ItemDetailView(item: $ListItemData[0])
                    }
                    
                }
                AddListItemView()
            }
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(trailing:
            NavigationLink(destination: ConfigurationView(list: $list)) {
                Image(systemName: "ellipsis.circle")
                    .font(.system(size: CGFloat(20)))
            }
        )
    }
    
    func setNavigationAppearance() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor(named: "primary")
    }
    
}
//
//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(list: ListRecord(name: "Md", description: ""))
//    }
//}
