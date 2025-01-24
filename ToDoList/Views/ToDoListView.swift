//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by 안지희 on 12/24/24.
//

import FirebaseFirestore
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var items: [ToDoListItem]
    private let userId: String
    
    
    init(userId:String) {
        self.userId = userId
        // users/<id>/todos/<entries>
        
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListItemView(item: item)
                    //옆으로 밀면 딜리트 버튼 나옴
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .background(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button{
                    //action
                    viewModel.showingNewItemView = true
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId:"13SFCDfUUTXGGEdPyH1iZZtBXZJ2")
}
