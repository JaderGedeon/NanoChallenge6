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
                var nome = lista.value(forKey: "nome")
                var descricao = lista.value(forKey: "descricao")
                
                var listaNova = Lista(nome: nome as! String, descricao: descricao as? String ?? "Descrição")
                listaNova.id = lista.recordID
                
                if !listas.contains(listaNova) {
                    listas.append(listaNova)
                }
            }
        }
    }
    
    func adicionarLista(lista: Lista) {
        cloudKitManager.salvarLista(lista: lista)
    }
    
    func deletarLista(lista: Lista) {
        cloudKitManager.deletarLista(id: lista.id!)
    }
}
