//
//  ItemFormView.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 30/08/21.
//

import SwiftUI

struct Item {
    var nome: String
}

struct ItemFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var item: Item
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Nome:")
                TextField("Nome", text: $item.nome)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
            }
            .padding()
            .navigationTitle("Novo item")
            .navigationBarItems(
                leading: Button(action: { presentationMode.wrappedValue.dismiss() }, label: {
                Text("Cancelar").font(.body)
            }),
                trailing: Button("Adicionar") {
                    print("adicionar")
                }
            )
        }
    }
}

struct ItemFormView_Previews: PreviewProvider {
    static var previews: some View {
        ItemFormView(item: Item(nome: ""))
    }
}
