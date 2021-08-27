//
//  ListItemView.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 27/08/21.
//

import SwiftUI

struct ListItemView: View {
    var item: ListItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 13){
            
            CheckBoxView(marked: item.check)
            
            VStack(alignment: .leading) {
                
                Text(item.name)
                    .fontWeight(.bold)
                
                Text("\(item.quantity) \(item.measurement.rawValue) \(item.description)")
                    .foregroundColor(Color("textColor"))
                
            }
            .padding(.top, 3)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(Color("rowBackgroundColor"))
        .cornerRadius(10)
        .padding(.vertical, 1)
        .padding(.horizontal)
    }
}

//struct ListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListItemView(item: <#ListItem#>)
//    }
//}
