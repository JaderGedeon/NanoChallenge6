//
//  ItemFormView.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 30/08/21.
//

import SwiftUI

struct ItemFormView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var gerenciadorLista: ListManager
    
    var lista: Lista
    
    @State var item: Item = Item(nome: "")
    
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
                    adicionarItem()
                }
            )
        }
    }
    
    func adicionarItem() {
        print(item.nome)
        gerenciadorLista.salvarItem(item: item, lista: lista)
        gerenciadorLista.pegarListas()
//        gerenciadorLista.pegarTodosItens()
        presentationMode.wrappedValue.dismiss()
    }
}

//struct ItemFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemFormView(item: Item(nome: ""))
//    }
//}
