//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by 안지희 on 12/24/24.
//

import Foundation

class NewItemViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    
    
    init(){}
    
    func save(){
        
    }
}
