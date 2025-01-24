//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by 안지희 on 12/24/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    
    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        
        //get current user id
        guard let uId = Auth.auth().currentUser?.uid else{
            return
        }
        
        //create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone : false
        )
        
        //save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool{
        //예외처리 guard문
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        //"어제보다 이후인 날짜"인지 확인하기 위한 검증 절차
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
    }
}
