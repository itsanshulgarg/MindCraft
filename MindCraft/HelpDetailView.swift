//
//  HelpDetailView.swift
//  MindCraft
//
//  Created by Anshul Garg on 24/11/20.
//

import SwiftUI

struct HelpDetailView: View {
    let url: String?
    
    var body: some View {
        VStack {
            ZStack {
                Text("")
                    .frame(height: 40, alignment: .center)
                    .frame(maxWidth: .infinity)
                    .background(Color(#colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9725490196, alpha: 1)))
                
                Color(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1))
                    .frame(width: 50, height: 4)
                    .cornerRadius(3)
            }
            WebView(urlString: url)
        }
    }
}

struct HelpDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HelpDetailView(url: "https://www.google.com")
    }
}
