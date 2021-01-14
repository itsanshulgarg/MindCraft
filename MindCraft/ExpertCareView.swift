//
//  ExpertCareView.swift
//  MindCraft
//
//  Created by Anshul Garg on 13/01/21.
//

import SwiftUI

struct ExpertCareView: View {
    var body: some View {
        ZStack {
            
            Image("Ellipse20")
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .offset(x: 0, y: 20)
        
            
            VStack(alignment: .leading) {
                
                Text("Looking for available experts💡...")
                    .font(.system(size: 20, weight: .medium, design: .default))
                    .lineLimit(2)
                    .padding(.top, 20)
                Spacer()
                
                Text("I was so scared to give up depression, fearing that somehow the worst part of me was actually all of me. ")
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .lineLimit(6)
                    .padding(.horizontal, 50)
                
                Text("Elizabeth Wurtzel author")
                    .font(.system(size: 22, weight: .regular, design: .default))
                    .lineLimit(4)
                    .padding(.top, 24)
                    .multilineTextAlignment(.center)
                    .frame(alignment: .center)
                    .frame(width: UIScreen.main.bounds.width - 40, alignment: .center)
                
                Spacer()
            }
            
            LoadingView(loaderTime: "infinity")
                .offset(x: 0, y: -250)
            
        }.padding()
    }
}

struct ExpertCareView_Previews: PreviewProvider {
    static var previews: some View {
        ExpertCareView()
    }
}
