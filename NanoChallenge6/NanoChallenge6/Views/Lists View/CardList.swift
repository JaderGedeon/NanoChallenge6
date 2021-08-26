//
//  CardList.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 24/08/21.
//

import SwiftUI

struct CardList: View {
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill()
                .foregroundColor(Color("primary"))
                .frame(minWidth: 0, idealWidth: 135, maxWidth: .infinity, minHeight: 0, idealHeight: 190, maxHeight: .infinity, alignment: .center)
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill()
                    .foregroundColor(Color("secondary"))
                    .frame(minWidth: 0, idealWidth: 60, maxWidth: 135, minHeight: 0, idealHeight: 110, maxHeight: 190, alignment: .center)
                Text(text)
                    .padding()
                    
            }
            .foregroundColor(Color("secondary"))
            .padding()
        }
        .padding()
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList(text: "oi")
    }
}
