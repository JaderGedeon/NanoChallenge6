//
//  ListDetailView.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 28/08/21.
//

import SwiftUI

struct ListDetailView: View {
    var lista: String
    @State var itens = ["Arroz", "Lentilha", "Abobrinha", "Alface"]
    @State private var showItemForm = false
    
    var body: some View {
        VStack {
            List {
                ForEach(itens, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: delete)
            }
            Spacer()
            Button("Adicionar item") {
                showItemForm.toggle()
            }
        }
        .sheet(isPresented: $showItemForm, content: {
            ItemFormView(item: Item(nome: ""))
        })
        .navigationTitle(lista)
        .toolbar {
            EditButton()
        }
    }
    
    func delete(at offsets: IndexSet) {
        itens.remove(atOffsets: offsets)
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(lista: "Mercado")
    }
}
