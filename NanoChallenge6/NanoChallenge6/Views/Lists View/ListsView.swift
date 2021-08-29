//
//  HomeScreen.swift
//  NanoChallenge6
//
//  Created by Beatriz Sato on 24/08/21.
//

import SwiftUI
import CloudKit

enum Tab {
    case all, individual, shared
}

struct ListsView: View {
    init() {
        setSegmentedControlAppearance()
    }
    
    @EnvironmentObject var listManager: ListManager
    
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
        NavigationView {
            VStack(alignment: .center, spacing: 25) {
                Picker("Tab", selection: $selectedTab) {
                    Text("Todas")
                        .tag(Tab.all)
                    Text("Individuais")
                        .tag(Tab.individual)
                    Text("Compartilhadas")
                        .tag(Tab.shared)
                }.pickerStyle(SegmentedPickerStyle()).foregroundColor(Color("primary"))

                ScrollView {
                    // apresenta o conjunto específico de lista de cada tab
                    switch selectedTab {
                    case .all:
                        CardGrid(listType: "all")
                    case .individual:
                        CardGrid(listType: "individual")
                    default:
                        CardGrid(listType: "shared")
                    }

                }
            }.padding()
            .navigationBarHidden(true)
//            .navigationBarTitle("", displayMode: .inline)
        }
        .onAppear(perform: {
            listManager.fetchList()
        })
    }

    func setSegmentedControlAppearance() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "primary")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "secondary")!], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "primary")!], for: .normal)
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "secondary")
        UISegmentedControl.appearance().isOpaque = true
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
            .environmentObject(ListManager())
    }
}
