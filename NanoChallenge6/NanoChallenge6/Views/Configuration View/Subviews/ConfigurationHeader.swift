//
//  ConfigurationHeader.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 28/08/21.
//

import SwiftUI

struct ConfigurationHeader: View {
    var body: some View {
        Text("Configurações")
            .font(.system(size: 28, weight: .semibold))
            .foregroundColor(Color("primary"))
            .padding(.vertical)
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ConfigurationHeader_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationHeader()
    }
}
