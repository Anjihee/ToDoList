//
//  HeaderView.swift
//  ToDoList
//
//  Created by 안지희 on 12/24/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title:String
    let subtitle:String
    let angle:Double
    let background:Color
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
                
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundStyle(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundStyle(Color.white)
                    .bold()
            }
            .padding(.top, 50)
        }
        .frame(width: UIScreen.main.bounds.width*3,
                height: 350)
         .offset(y:-120)
 
    }
}

#Preview {
    HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
}
