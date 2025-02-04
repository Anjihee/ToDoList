//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by 안지희 on 12/24/24.
//

import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId:String
    
    init(userId:String){
        self.userId = userId
    }
    
    
    /// Delete to do litst item
    ///  --  Parameter id
    // 파이어베이스 디비에서 지우는 형태
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
