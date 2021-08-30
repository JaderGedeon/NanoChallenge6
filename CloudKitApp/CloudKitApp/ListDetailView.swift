//
//  ListDetailView.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 28/08/21.
//

import SwiftUI

struct ListDetailView: View {
    var lista: Lista
    @State var itens = ["Arroz", "Lentilha", "Abobrinha", "Alface"]
    @State private var showItemForm = false
    
    @EnvironmentObject var gerenciadorLista: ListManager
    
    var body: some View {
        VStack {
            List {
                ForEach(lista.itens, id: \.self) { item in
                    Text(item.nome)
                }
                .onDelete(perform: delete)
            }
            Spacer()
            Button("Adicionar item") {
                showItemForm.toggle()
            }
        }
        .sheet(isPresented: $showItemForm, content: {
            ItemFormView(lista: lista)
        })
        .navigationTitle(lista.nome)
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
        ListDetailView(lista: Lista(nome: "Mercado", descricao: "lista de mercado"))
    }
}
