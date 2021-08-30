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
    
    @Binding var list: ListRecord
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 1) {
                
                VStack{
                    ConfigurationHeader()
                    ListConfigurations(list: $list)
                }
                
                Section(header:
                    VStack(spacing: 0) {
                        Text("Editar compartilhamento")
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .padding()
                            .background(Color("sectionBackgroundColor"))
                            .foregroundColor(Color("CorDoBalacobaco"))
                        Divider()
                    }
                        
                ) {
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
        .navigationBarTitle("", displayMode: .inline)
        
    }
}

//struct ConfigurationView_Previews: PreviewProvider {
//
//    
//    static var previews: some View {
//        
//        ForEach(ColorScheme.allCases, id: \.self) {_ in
//            ConfigurationView(list: Binding<previewList>)
//        }
//    }
//}
//



