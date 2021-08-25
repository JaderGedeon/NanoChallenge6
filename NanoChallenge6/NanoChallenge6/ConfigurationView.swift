//
//  ConfigurationView.swift
//  NanoChallenge6
//
//  Created by Jader Rocha on 25/08/21.
//

import SwiftUI

struct ConfigurationView: View {
    
    @State private var emails: [String] = [
        "julianamachado218@gmail.com",
        "jadergedeon@gmail.com",
    ]
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 1) {
                
                VStack{
                    
                    ConfigurationHeader()
                    ListConfigurations()
                    
                }
                
                Section(header:
                            VStack(spacing: 0) {
                                Text("Editar compartilhamento")
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .padding()
                                    .background(Color("Cinzinha"))
                                    .foregroundColor(Color("CorDoBalacobaco"))
                                Divider()
                            }
                        
                ){
                    ForEach(emails, id: \.self) { (email: String) in
                        
                        VStack(alignment: .leading, spacing: 15) {
                            
                            Text(email)
                            Divider()
                            
                        }
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0))
                    }
                    
                    AddSharedUser()
                }
            }
        }
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
    }
}

struct ListConfigurations: View {
    
    init() {
        UITextView.appearance().backgroundColor = .clear
        }
    
    @State private var descriptionText = "Descrição"
    
    var body: some View {
        
        VStack(spacing: 26.0){
            
            Image("Leite")
                .resizable()
                .frame(width: 183, height: 183, alignment: .center)
                .cornerRadius(15)
            
            Text("Lista 1")
                .font(.system(size: 28, weight: .semibold))
                .foregroundColor(Color("CorzinhaManeira"))
            
            TextEditor(text: $descriptionText)
                .background(Color("Cinzinha"))
                .foregroundColor(Color("CorDoBalacobaco"))
                .frame(width: 100, height: 140 / 3, alignment: .center)
                .lineSpacing(10)
                .autocapitalization(.words)
                .disableAutocorrection(true)
                .padding()
        }
        .padding()
    }
}

struct ConfigurationHeader: View {
    
    var body: some View {
        
        Text("Configurações")
            .font(.system(size: 28, weight: .semibold))
            .foregroundColor(Color("CorzinhaManeira"))
            .padding(.vertical)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AddSharedUser: View {
    
    var body: some View {
        
        Button(action: { print("New User") } ) {
            VStack(alignment: .leading, spacing: 12) {
                GeometryReader { circle in
                    ZStack {
                        
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(Color("CinzaMaisEscuro"))
                        
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color("CorDoBalacobaco"))
                            .frame(
                                width: circle.size.width * 0.40,
                                height: circle.size.width * 0.40,
                                alignment: .center)
                    }
                }
                .frame(width: 32, height: 32, alignment: .center)
                
                Divider()
                
            }
            .padding(EdgeInsets(top: 12, leading: 20, bottom: 0, trailing: 0))
        }
    }
}
