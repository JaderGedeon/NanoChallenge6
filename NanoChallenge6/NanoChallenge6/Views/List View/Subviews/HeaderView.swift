//
//  HeaderView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 27/08/21.
//

import SwiftUI

struct HeaderView: View {
    
    var list: ListRecord
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text(list.name)
                .foregroundColor(Color("primary"))
                .padding(.horizontal)
                //                .padding(.top)
                .font(.system(size: 28, weight: .bold))
            
            if list.description != "" {
                Text(list.description)
                    .padding(.horizontal)
                    .padding(.vertical, 2)
                    .padding(.bottom, 15)
                    .foregroundColor(Color("text"))
            }

            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(list: ListRecord(name: "fdasdd", description: "fasdf"))
    }
}
