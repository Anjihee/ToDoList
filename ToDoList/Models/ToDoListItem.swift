//
//  ToDOListItem.swift
//  ToDoList
//
//  Created by 안지희 on 12/24/24.
//

import Foundation


struct ToDoListItem: Codable, Identifiable{
    let id: String
    let title:String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state: Bool){
        isDone = state
    }
    
}
