//
//  ListView.swift
//  NanoChallenge6
//
//  Created by Jader Rocha on 24/08/21.
//

import SwiftUI
import CloudKit

struct ListView: View {
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
                    HStack(alignment: .top, spacing: 13){
                        
                        CheckBoxView(marked: item.check)
                        
                        VStack(alignment: .leading) {
                            
                            Text(item.name)
                                .fontWeight(.bold)
                            
                            Text("\(item.quantity) \(item.measurement.rawValue) \(item.description)")
                                .foregroundColor(Color("textColor"))
                            
                        }
                        .padding(.top, 3)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(Color("rowBackgroundColor"))
                    .cornerRadius(10)
                    .padding(.vertical, 1)
                    .padding(.horizontal)
                }
                AddItemView()
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

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        ForEach(ColorScheme.allCases, id: \.self) {
//            ListView(list: Bi).preferredColorScheme($0)
//        }
//    }
//}





