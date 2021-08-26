//
//  ListView.swift
//  NanoChallenge6
//
//  Created by Jader Rocha on 24/08/21.
//

import SwiftUI
import CloudKit

struct ListView: View {
    var items = [CKRecord]()
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor(named: "primary")
    }
    
    @State var ListItemData = [
        ListItem(check: true, image: nil, name: "Guaraná 2L", description: "", quantity: 6, measurement: .litre),
        ListItem(check: false, image: nil, name: "Farinha", description: ", integral da Dona Benta, pacote azul Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ultricies sem eget tellus varius, eu malesuada neque auctor. Duis quis placerat eros. Duis posuere hendrerit urna in facilisis.", quantity: 10, measurement: .kilogram)
    ]
    
    var body: some View {
        ScrollView {
            
            HeaderView(title: "Lista 1",
                       subtitle: "Lista do rolê de sexta")
            
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
}

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

struct AddItemView: View {
    
    var body: some View {
        
        Button(action: {
            print("New Item")
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



enum UnitMeasurement: String {
    case unit = "Uni"
    case millilitre = "mL"
    case litre = "litros"
    case gram = "g"
    case kilogram = "Kg"
}

struct ListItem: Identifiable {
    
    var id = UUID()
    var check: Bool
    var image: Image?
    var name: String
    var description: String
    var quantity: Int
    var measurement: UnitMeasurement
    
}