//
//  ItemView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 24/08/21.
//

import SwiftUI

struct ItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var itemName: String = ""
    @State private var itemDescription: String = ""
    @State private var itemQuantity: Int = 1
    @State private var selectedMeasure = Measure.unidade
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
                Button("Add") {
                    print("adding item")
                }
            }
            
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 183, height: 183, alignment: .center)
                .foregroundColor(Color("GrayBackgroundColor"))
                .padding()
            
            TextField("Nome", text: $itemName)
                .padding(.all, 5)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("GrayBackgroundColor"))
            
            TextEditor(text: $itemDescription)
                .background(Color.blue)
                
                Stepper(onIncrement: { itemQuantity += 1 },
                                onDecrement: { itemQuantity -= 1 }) {
                            Text("\(itemQuantity)")
                }.padding()
                
                Picker("Medida", selection: $selectedMeasure) {
                    Text("Unidade").tag(Measure.unidade)
                    Text("Litro").tag(Measure.litro)
                    Text("Quilo").tag(Measure.quilo)
                    Text("Grama").tag(Measure.grama)
                }.padding()  
            
        }
        .padding()
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

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
