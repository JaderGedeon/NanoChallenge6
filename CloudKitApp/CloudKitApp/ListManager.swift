//
//  ListManager.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 30/08/21.
//

import CloudKit

class ListManager: ObservableObject {
    var cloudKitManager = CKManager.shared
    @Published var listas: [Lista]
    
    init() {
        listas = [Lista]()
    }
    
    func pegarListas() {
        cloudKitManager.fetchList { [self] (listasNuvem) in
            for i in 0..<listasNuvem.count {
                let nome = listasNuvem[i].value(forKey: "nome")
                let descricao = listasNuvem[i].value(forKey: "descricao")
                let listaDecodificada = Lista(id: listasNuvem[i].recordID, nome: nome as? String ?? "Lista sem nome", descricao: descricao as? String ?? "")
                
                if !listas.contains(listaDecodificada) {
                    listas.append(listaDecodificada)
                }
            }
        }
    }
    
    func pegarLista(index: Int) -> Lista {
        if index < listas.count {
            return listas[index]
        }
        return Lista(nome: "", descricao: "")
    }
    
    func salvarLista(lista: Lista) {
        cloudKitManager.saveList(list: lista)
        listas.append(lista)
    }
    
    func deletarLista(lista: Lista) {
        cloudKitManager.deleteList(recordID: lista.id!)
    }
    
    func pegarItens(lista: Lista) {
        cloudKitManager.fetchItems(listParent: lista.id!) { [self] (itensNuvem) in
            var itens = [Item]()
            for item in itensNuvem {
                let nome = item.value(forKey: "nome")
                let listaPai = item.value(forKey: "listaPai")
                let itemNovo = Item(nome: nome as? String ?? "Item sem nome", listaPai: listaPai as! String)
                itens.append(itemNovo)
            }
            
//            listas.first(where: { $0.id == lista.id } )?.itens = itens
        }
    }
    
    func salvarItem(item: Item, lista: Lista) {
        cloudKitManager.saveItem(item: item, listParentID: lista.id!)
    }
}
