//
//  ContentView.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 28/08/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gerenciadorListas: ListManager
    
    @State private var listas = ["Almoço vegano", "Mercado mês", "Pizza"]
    @State private var showListForm = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(0..<gerenciadorListas.listas.count, id: \.self) { i in
                        NavigationLink(
                            destination: ListDetailView(lista: gerenciadorListas.pegarLista(index: i))) {
                            Text(gerenciadorListas.listas[i].nome)
                        }
                    }
                    .onDelete(perform: delete)
                }
                
                Button("Adicionar lista") {
                    showListForm.toggle()
                }
                
            }
            .sheet(isPresented: $showListForm, content: {
                ListFormView()
            })
            .navigationBarTitle("Listas ☁️", displayMode: .inline)
            .toolbar {
                EditButton()
            }
            .onAppear(perform: {
                gerenciadorListas.pegarListas()
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func delete(at offsets: IndexSet) {
        print("delete")
        gerenciadorListas.deletarLista(lista: gerenciadorListas.listas[offsets.first!])
        gerenciadorListas.listas.remove(atOffsets: offsets)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
