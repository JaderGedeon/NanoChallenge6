//
//  ItemView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 24/08/21.
//

import SwiftUI

struct ItemDetailView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var selectedMeasure = Measure.unidade
    
    @Binding var item: ListItem
    
    init(item: Binding<ListItem>) {
        self._item = item
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
                
                TextField("Nome", text: $item.name)
                    .padding(.all)
                    .frame(width: .infinity, height: 40, alignment: .center)
                    .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color("textFieldBackground")))
                    .foregroundColor(Color("titleColor"))
                
                // text editor
                ZStack(alignment: .topLeading){
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(Color("textFieldBackground"))
       
                    TextEditor(text: $item.description)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 3)
                    
                    if item.description.isEmpty {
                        Text("Description")
                            .foregroundColor(Color(UIColor.placeholderText))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 12)
                    }
                   
                }
                .frame(width: .infinity, height: 150, alignment: .center)
                
                HStack(spacing: 30) {
                    Stepper(onIncrement: { item.quantity += 1 },
                            onDecrement: { item.quantity -= 1 }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color("textFieldBackground"))
                            Text("\(item.quantity)")
                                
                            
                        }.frame(width: 60, height: 33, alignment: .center)
                  
                    }
                    .frame(width: 150, height: 35, alignment: .center)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color("textFieldBackground"))
                        
                        Picker("Medida", selection: $selectedMeasure) {
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
                                    Button(action: { presentationMode.wrappedValue.dismiss() },
                                           label: {
                                            Text("Cancel")
                                                .font(.body)
                                                .foregroundColor(Color("primary"))}),
                                trailing:
                                    Button(action: { print("add") },
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
    
    func setNavigationBarAppearance() {
        UITextView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor(named: "primary")
    }
}

enum Measure: String, CaseIterable, Identifiable {
    case unidade
    case litro
    case mililitro
    case quilo
    case grama
    
    var id: String { self.rawValue }
}
