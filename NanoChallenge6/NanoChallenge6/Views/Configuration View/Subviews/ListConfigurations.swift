//
//  ListConfiguration.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 28/08/21.
//

import SwiftUI

struct ListConfigurations: View {
    
    @Binding var list: ListRecord
    @State var draftList: ListRecord
    
    init(list: Binding<ListRecord>) {
        self._list = list
        self._draftList = State(initialValue: list.wrappedValue)
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        VStack(spacing: 26.0){
            
            Image("Leite")
                .resizable()
                .frame(width: 183, height: 183, alignment: .center)
                .cornerRadius(15)
            
            TextField("Nome", text: $draftList.name)
                .padding(.all)
                .frame(width: .infinity, height: 40, alignment: .center)
                .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color("textFieldBackground")))
                .foregroundColor(Color("titleColor"))
            
            // text editor
            ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color("textFieldBackground"))
   
                TextEditor(text: $draftList.description)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 3)
                
                if draftList.description.isEmpty {
                    Text("Description")
                        .foregroundColor(Color(UIColor.placeholderText))
                        .padding(.horizontal, 14)
                        .padding(.vertical, 12)
                }
               
            }
            .frame(width: .infinity, height: 150, alignment: .center)
            
        }
        .padding()
        .onDisappear(perform: {
            self._list.wrappedValue = draftList
        })
    }
}
//
//struct ListConfiguration_Previews: PreviewProvider {
//    static var previews: some View {
//        ListConfigurations(list: ListRecord(name: "", description: ""))
//    }
//}
