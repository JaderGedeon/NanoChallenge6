//
//  AddItemView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 25/08/21.
//

import SwiftUI

struct AddListItemView: View {
    
    @State var item = ListItem(check: false, image: nil, name: "", description: "", quantity: 6, measurement: .unit)
    
    @State var showItemForm: Bool = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 13){
            
            CheckBoxView(marked: item.check)
            
            TextField("Novo item", text: $item.name)
                .font(.headline.bold())
                .padding(.top, 10)
            

            Button(action: { showItemForm.toggle() }, label: {
                Image(systemName: "info.circle")
                    .foregroundColor(Color("primary"))
                    .font(.title)
            })
            .padding(.top, 8)
            .sheet(isPresented: $showItemForm, content: {
                ItemView()
            })
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color("CorzinhaManeira2"))
        .cornerRadius(10)
        .padding(.vertical, 1)
        .padding(.horizontal)
    }
    

    
}

struct AddItemView1_Previews: PreviewProvider {
    static var previews: some View {
        AddListItemView()
    }
    
}
