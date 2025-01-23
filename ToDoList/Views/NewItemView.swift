//
//  NewItemView.swift
//  ToDoList
//
//  Created by 안지희 on 12/24/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            Form{
                //title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                //date
                DatePicker("Due Date", selection:$viewModel.dueDate).datePickerStyle(GraphicalDatePickerStyle())
                
                //button
                TLButton(title: "Save", background: .pink){
                    viewModel.save()
                }
            }
        }
    }
}

#Preview {
    NewItemView()
}
