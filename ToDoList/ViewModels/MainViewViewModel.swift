//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by 안지희 on 12/24/24.
//

import Foundation
import FirebaseAuth

class MainViewViewModel :ObservableObject{
    @Published var currentUserId:String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addIDTokenDidChangeListener{ [weak self] _, user in
            self?.currentUserId = user?.uid ?? ""
            
        }
    }
    
    public var isSignedIn:Bool{
        return Auth.auth().currentUser != nil
    }
}
