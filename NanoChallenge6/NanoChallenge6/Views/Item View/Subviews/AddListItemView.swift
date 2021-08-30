//
//  AddItemView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 25/08/21.
//

import SwiftUI

struct AddListItemView: View {
        
    @Binding var list: ListRecord
    
    @State var item = ListItem(check: false, image: nil, name: "", description: "", quantity: 1, measurement: .unit)
    
    var body: some View {
        HStack(spacing: 13){
            
            CheckBoxView(marked: item.check)
            
            TextField("Novo item", text: $item.name)
                .font(.headline.bold())

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color("rowBackgroundColor"))
        .cornerRadius(10)
        .padding(.vertical, 1)
        .padding(.horizontal)
    }

}
//
//struct AddItemView1_Previews: PreviewProvider {
//    static var previews: some View {
//        AddListItemView()
//    }
//    
//}
