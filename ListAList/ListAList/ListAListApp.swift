//
//  ListAListApp.swift
//  ListAList
//
//  Created by Zefanya Sharon on 04/04/22.
//

import SwiftUI

@main
struct ListAListApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var listViewModel : ListViewModel = ListViewModel()

    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
