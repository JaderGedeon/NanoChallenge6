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

struct HomeScreen: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "primary")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "secondary")!], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(named: "primary")!], for: .normal)
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "secondary")
        UISegmentedControl.appearance().isOpaque = true
        populateList()
        fetchLists()
    }
    
    @State private var showItemForm = false
    
    var columns: [GridItem] = Array(repeating: .init(.flexible(minimum: 135, maximum: 500)), count: 2)
    
    var lists = [ListRecord]()
    
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
                    LazyVGrid(columns: columns, alignment: .center, spacing: 20){
                        ForEach(0..<lists.count) { list in
                            NavigationLink(destination: ListView()) {
                                CardList(text: "lista")
                            }
                        }
                        NavigationLink(destination: AddListView()) {
                            CardButton()
                        }
                    }
                }
                Spacer()
            }.padding()
            .navigationBarHidden(true)
        }
        
        
        
    }
    
    func addItem() {
        print("add")
        showItemForm = true
    }
    
    mutating func populateList() {
        var list = ListRecord(name: "lista 1", description: "")
        lists.append(list)
        list = ListRecord(name: "lista 2", description: "")
        lists.append(list)
    }
    
    func fetchLists() {
        print("fetching")
        let publicDatabase = CKContainer(identifier: "iCloud.Nano6").publicCloudDatabase
        let query = CKQuery(recordType: "Lists", predicate: NSPredicate(value: true))
        query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            records?.forEach({ (record) in
                guard error == nil else {
                    print(error?.localizedDescription as Any)
                    return
                }
                
                print(record.value(forKey: "name") ?? "nao")
            })
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
