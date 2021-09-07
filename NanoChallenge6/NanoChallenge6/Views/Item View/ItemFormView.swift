//
//  ItemFormView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 02/09/21.
//

import SwiftUI

struct ItemFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var newItem: ListItem
    
    @EnvironmentObject var listManager: ListManager
    @Binding var list: ListRecord
    
    init(list: Binding<ListRecord>) {
        self._list = list
        self._newItem = State(initialValue: ListItem(check: false, name: "", description: "", quantity: 1, measurement: .unit))
        setNavigationBarAppearance()
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("Leite")
                    .resizable()
                    .frame(width: 183, height: 183, alignment: .center)
                    .cornerRadius(15)
                    .padding()
                
                TextField("Nome", text: $newItem.name)
                    .padding(.all)
                    .frame(width: .infinity, height: 40, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color("textFieldBackground")))
                    .foregroundColor(Color("titleColor"))
                
                // text editor
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color("textFieldBackground"))
       
                    TextEditor(text: $newItem.description)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 3)
                    
                    if newItem.description.isEmpty {
                        Text("Description")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 12)
                    }
                   
                }
                .frame(width: .infinity, height: 150, alignment: .center)
                
                HStack(spacing: 30) {
                    Stepper(onIncrement: { newItem.quantity += 1 },
                            onDecrement: { newItem.quantity -= 1 }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color("textFieldBackground"))
                            Text("\(newItem.quantity)")
                                
                            
                        }.frame(width: 60, height: 33, alignment: .center)
                  
                    }
                    .frame(width: 150, height: 35, alignment: .center)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color("textFieldBackground"))
                        
                        Picker("Medida", selection: $newItem.measurement) {
                            Text("Unidade").tag(Measure.unidade)
                            Text("Litro").tag(Measure.litro)
                            Text("Quilo").tag(Measure.quilo)
                            Text("Grama").tag(Measure.grama)
                        }
                        .frame(width: 170, height: 80, alignment: .center)
                        .clipped()
                        .background(Color(UIColor.clear))
                    }.frame(width: 170, height: 80, alignment: .center)
       
                }
                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: { cancel() },
                                           label: {
                                            Text("Cancel")
                                                .font(.body)
                                                .foregroundColor(Color("primary"))}),
                                trailing:
                                    Button(action: { addItem()
                                             },
                                           label: {
                                            Text("Add")
                                                .bold()
                                                .foregroundColor(Color("primary"))
            }))
            .padding(.leading, 30)
            .padding(.trailing, 30)
            .foregroundColor(Color("titleColor"))
        }
    }
    
    func cancel() {
        presentationMode.wrappedValue.dismiss()
    }
    
     func addItem() {
        listManager.add(item: newItem, to: list)
        print("add \(newItem.name)")
        presentationMode.wrappedValue.dismiss()
    }
    
    func setNavigationBarAppearance() {
        UITextView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor(named: "primary")
    }
}
