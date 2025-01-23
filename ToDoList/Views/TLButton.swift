//
//  TLButton.swift
//  ToDoList
//
//  Created by 안지희 on 12/26/24.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let background:Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TLButton(title: "Value", background: .pink){
        
    }
    //action
}
