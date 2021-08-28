//
//  ContentView.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 28/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var listas = ["Almoço vegano", "Mercado mês", "Pizza"]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(listas, id: \.self) { lista in
                        NavigationLink(
                            destination: ListDetailView(lista: lista)) {
                            Text(lista)
                        }

                    }
                    .onDelete(perform: delete)
                }
                .listStyle(InsetListStyle())
                
                Spacer()
                Button(action: {print("adicionar nova lista")}, label: {
                    Text("Adicionar lista")
                })
            }
            .navigationTitle("Listas ☁️")
            .toolbar {
                EditButton()
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        print("delete")
        listas.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
