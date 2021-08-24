//
//  HomeScreen.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 24/08/21.
//

import SwiftUI

enum Tab {
    case all, individual, shared
}

struct HomeScreen: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "AccentColor")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "SecondaryColor")!], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "AccentColor")!], for: .normal)
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "SecondaryColor")
        UISegmentedControl.appearance().isOpaque = true
    }
    
    @State var selectedTab: Tab = Tab.all
    
    var tabName: String {
        switch selectedTab {
        case .all:
            return "Todas"
        case .individual:
            return "Individuais"
        default:
            return "Compartilhadas"
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 25) {
            Picker("Tab", selection: $selectedTab) {
                Text("Todas")
                    .tag(Tab.all)
                Text("Individuais")
                    .tag(Tab.individual)
                Text("Compartilhadas")
                    .tag(Tab.shared)
            }.pickerStyle(SegmentedPickerStyle()).foregroundColor(Color("AccentColor"))
            
            GridList()
            Spacer()
        }.padding()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
