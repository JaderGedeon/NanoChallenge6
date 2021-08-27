//
//  CheckboxView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 27/08/21.
//

import SwiftUI

struct CheckBoxView: View {
    
    @State var marked: Bool
    
    var body: some View {
        
        Button(action: {
            marked.toggle()
        }) {
            
            Image(systemName: (marked ? "checkmark.square.fill" : "square"))
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 46, height: 46, alignment: .top)
                .foregroundColor(Color("primary"))
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct CheckboxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(marked: true)
    }
}
