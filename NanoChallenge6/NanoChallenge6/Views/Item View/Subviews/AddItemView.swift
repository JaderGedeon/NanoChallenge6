//
//  AddItemView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 27/08/21.
//

import SwiftUI

struct AddItemView: View {
    
    var body: some View {
        
        Button(action: {
            print("New Item")
        }) {
            
            Image(systemName: "plus.square")
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 46, height: 46, alignment: .center)
                .foregroundColor(Color("primary"))
            
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color("rowBackgroundColor"))
        .cornerRadius(10)
        .padding(.vertical,1)
        .padding(.horizontal)
    }
}


struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
