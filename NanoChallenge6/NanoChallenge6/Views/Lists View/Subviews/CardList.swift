//
//  CardList.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 24/08/21.
//

import SwiftUI


struct CardList: View {
    var list: ListRecord
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill()
                .foregroundColor(Color("primary"))
                .frame(minWidth: 0, idealWidth: 135, maxWidth: .infinity, minHeight: 0, idealHeight: 190, maxHeight: .infinity, alignment: .center)
            VStack {
                Image("Leite1")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 0, idealWidth: 60, maxWidth: 135, minHeight: 0, idealHeight: 110, maxHeight: 190, alignment: .center)

                Text(list.name)
                    .font(.system(size: 20))
                    .bold()
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
        CardList(list: ListRecord(name: "1", description: ""))
    }
}
