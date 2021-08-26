//
//  HeaderView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 25/08/21.
//

import SwiftUI

struct ListHeaderView: View {
    
    @Binding var list: ListRecord
    
    var body: some View {
        
        VStack(alignment: .leading){
            TextField("Nova Lista", text: $list.name)
                .foregroundColor(Color("primary"))
                .padding(.horizontal)
                
                .font(.system(size: 28, weight: .bold))
            
            TextField("Descrição",text: $list.description)
                .padding(.horizontal)
                .padding(.vertical, 2)
                .padding(.bottom, 15)
                .foregroundColor(Color("textColor"))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

//struct ListHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListHeaderView(list: ListRecord(name: "Nova Lista", description: ""))
//    }
//}
