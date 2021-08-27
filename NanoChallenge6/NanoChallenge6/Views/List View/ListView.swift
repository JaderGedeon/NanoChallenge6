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
  // AQUI Ó

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        ForEach(ColorScheme.allCases, id: \.self) {
            ListView().preferredColorScheme($0)
        }
    }
}

struct HeaderView: View {
    
    var title: String
    var subtitle: String
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text(title)
                .foregroundColor(Color("primary"))
                .padding(.horizontal)
                //                .padding(.top)
                .font(.system(size: 28, weight: .bold))
            
            Text(subtitle)
                .padding(.horizontal)
                .padding(.vertical, 2)
                .padding(.bottom, 15)
                .foregroundColor(Color("textColor"))
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CheckBoxView: View {
    
    @State var marked: Bool
    
    var body: some View {
        
        Button(action: {
            marked.toggle()
            
//            let item = ListItem(check: false,
//                     name: "Laruva",
//                     description: "Laranja e Uva",
//                     quantity: 300,
//                     measurement: .gram)
//
//            CKManager.shared.saveItem(item: item, listParentID: recordList[0].recordID)
            CKManager.shared.fetchItems(listParent: recordList[0].recordID)
        }) {
            
            Image(systemName: (marked ? "checkmark.square.fill" : "square"))
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 46, height: 46, alignment: .top)
                .foregroundColor(Color("primary"))
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}


private var recordList = [CKRecord]()

struct AddItemView: View {
    
    var body: some View {
        
        Button(action: {
            
            CKManager.shared.fetchList { list in
                recordList = list
                
                for record in recordList {
                    print(record.value(forKey: "name") as? String ?? "Unknown")
                    print(record.recordID)
                }
            }
        }) {
            
            Image(systemName: "plus.square")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 46, height: 46, alignment: .center)
                .foregroundColor(Color("primary"))
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color("rowBackgroundColor"))
        .cornerRadius(10)
        .padding(.vertical,1)
        .padding(.horizontal)
    }
}
