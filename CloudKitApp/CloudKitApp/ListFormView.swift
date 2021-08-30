//
//  ListFormView.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 30/08/21.
//

import SwiftUI

struct ListFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var gerenciadorLista: ListManager
    
    @State var lista = Lista(nome: "", descricao: "")
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Nome da lista:")
                TextField("Lista de mercado", text: $lista.nome)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Text("Descrição")
                TextField("Uma lista bem bacana", text: $lista.descricao)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
            }
            
            .padding()
            .navigationTitle("Nova lista")
            .navigationBarItems(leading: Button(action: { presentationMode.wrappedValue.dismiss() }, label: {
                Text("Cancelar").font(.body)
            }), trailing: Button("Adicionar") {
                salvarLista()
            })
        }
    }
    
    func salvarLista() {
        print("nome da lista: \(lista.nome)")
        gerenciadorLista.salvarLista(lista: lista)
        presentationMode.wrappedValue.dismiss()
    }
}

struct ListFormView_Previews: PreviewProvider {
    static var previews: some View {
        ListFormView(lista: Lista(nome: "mercado", descricao: "compra do mes"))
    }
}
