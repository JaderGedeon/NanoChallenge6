//
//  GerenciadorLista.swift
//  CloudKitApp
//
//  Created by Beatriz Sato on 30/08/21.
//

import Foundation

class GerenciadorLista: ObservableObject {
    var cloudKitManager = CKManager.shared
    @Published var listas: [Lista]
    
    init() {
        listas = [Lista]()
    }
    
    func pegarListas() {
        cloudKitManager.buscarLista { [self] listasNuvem in
            for lista in listasNuvem {
                let nome = lista.value(forKey: "nome")
                let descricao = lista.value(forKey: "descricao")
                
                var listaNova = Lista(nome: nome as! String, descricao: descricao as? String ?? "Descrição")
                listaNova.id = lista.recordID
                
                if !listas.contains(listaNova) {
                    listas.append(listaNova)
                    print("appending \(listaNova.nome)")
                }
            }
        }
    }
    
    func adicionarLista(lista: Lista) {
        var listaAdicionada = Lista(id: nil, nome: lista.nome, descricao: lista.descricao)
        cloudKitManager.salvarLista(lista: lista) { [self] registro in
            listaAdicionada.id = registro.recordID
            listas.append(listaAdicionada)
        }
    }
    
    func deletarLista(lista: Lista) {
        if let id = lista.id {
            cloudKitManager.deletarLista(id: id)
        }
    }
}
