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

var records = [CKRecord]()

struct ListsView: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "primary")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "secondary")!], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "primary")!], for: .normal)
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "secondary")
        UISegmentedControl.appearance().isOpaque = true
        populateList()
        CKManager.shared.fetchList { ( list ) in records = list  }
    }
    
    @State private var showItemForm = false
    var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 135, maximum: 500)), count: 2)

    var lists = [ListRecord(name: "individual", description: ""), ListRecord(name: "compartilhada", description: "")]
    var individualList = [ListRecord(name: "individual", description: "")]
    var sharedList = [ListRecord(name: "compartilhada", description: "")]
    
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
                        CardGrid(lists: lists)
                    case .individual:
                        CardGrid(lists: individualList)
                    default:
                        CardGrid(lists: sharedList)
                    }

                }
                Button(action: addList) {
                    Text("aaaaaaa")
                }
            }.padding()
            .navigationBarHidden(true)
        }
    }
    
    func addList() {
        print("add")
        showItemForm = true
        print(records)
        CKManager.shared.saveList()
    }
    
    mutating func populateList() {
        var list = ListRecord(name: "lista 1", description: "")
        lists.append(list)
        list = ListRecord(name: "lista 2", description: "")
        lists.append(list)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
    }
}
