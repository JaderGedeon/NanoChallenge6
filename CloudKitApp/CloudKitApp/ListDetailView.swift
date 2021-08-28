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
    
    var body: some View {
        VStack {
            List {
                ForEach(itens, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: delete)
            }
            Spacer()
            Button(action: { print("adicionar novo item") }, label: {
                Text("Adicionar item")
            })
            .navigationTitle(lista)
            .toolbar {
                EditButton()
            }
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
