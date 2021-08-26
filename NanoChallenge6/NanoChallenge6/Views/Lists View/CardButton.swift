//
//  CardButton.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 24/08/21.
//

import SwiftUI

struct CardButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill()
                .foregroundColor(Color("secondary"))
                .frame(minWidth: 0, idealWidth: 135, maxWidth: .infinity, minHeight: 0, idealHeight: 190, maxHeight: .infinity, alignment: .center)
                Text("+")
                    .bold()
                    .font(.system(size: 60))
                    .padding()
                    .foregroundColor(Color("primary"))
        }
        .padding()
    }
}

struct CardButton_Previews: PreviewProvider {
    static var previews: some View {
        CardButton()
    }
}
