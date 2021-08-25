//
//  ConfigurationView.swift
//  NanoChallenge6
//
//  Created by Jader Rocha on 25/08/21.
//

import SwiftUI

struct ConfigurationView: View {
    
    
    
    var body: some View {
        
        List{
            
            LazyVStack{
            
            Text("Configurações")
                .fontWeight(.semibold)
                .foregroundColor(Color("CorzinhaManeira"))
                .padding(.vertical)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
            
                Image("Leite")
                    .resizable()
                    .frame(width: 183, height: 183, alignment: .center)
                    .cornerRadius(15)
                    .padding()
            
            Text("Lista 1")
                .fontWeight(.semibold)
                .foregroundColor(Color("CorzinhaManeira"))
                .padding()
                .font(.largeTitle)
            }
            Section(header: Text("Editar compartilhamento")) {
                Text("oi")
                    .foregroundColor(.green)
            }
            .textCase(nil)
            .foregroundColor(/*@START_MENU_TOKEN@*/Color("CorDoBalacobaco")/*@END_MENU_TOKEN@*/)
            .font(.system(size: 24))
            .padding(.vertical, 8)
        }
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
    }
}
