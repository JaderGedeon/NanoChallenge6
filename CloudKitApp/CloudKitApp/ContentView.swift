//
//  ContentView.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 28/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var listas = ["Almoço vegano", "Mercado mês", "Pizza"]
    @State private var showListForm = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(listas, id: \.self) { lista in
                            Text(lista)
                    }
                    .onDelete(perform: delete)
                }
                
                Button("Adicionar lista") {
                    showListForm.toggle()
                }
                
            }
            .sheet(isPresented: $showListForm, content: {
                ListFormView(lista: Lista(nome: "", descricao: ""))
            })
            .navigationBarTitle("Listas ☁️", displayMode: .inline)
            .toolbar {
                EditButton()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
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
