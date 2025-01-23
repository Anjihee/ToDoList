//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 안지희 on 12/24/24.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
