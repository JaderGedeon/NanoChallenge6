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
}
