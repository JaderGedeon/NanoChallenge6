//
//  SwiftUIView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 28/08/21.
//

import SwiftUI

struct AddSharedUser: View {
    
    var body: some View {
        
        Button(action: { print("New User") } ) {
            VStack(alignment: .leading, spacing: 12) {
                GeometryReader { circle in
                    ZStack {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .foregroundColor(Color("systemContainer"))
                        
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(Color("systemText"))
                            .frame(
                                width: circle.size.width * 0.40,
                                height: circle.size.width * 0.40,
                                alignment: .center)
                    }
                }
                .frame(width: 32, height: 32, alignment: .center)
                
                Divider()
                    .background(Color("systemDivider"))
                
            }
            .padding(EdgeInsets(top: 12, leading: 20, bottom: 0, trailing: 0))
        }
    }
}

struct AddSharedUser_Previews: PreviewProvider {
    static var previews: some View {
        AddSharedUser()
    }
}
