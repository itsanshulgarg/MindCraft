//
//  ColorTheoryView.swift
//  MindCraft
//
//  Created by Anshul Garg on 13/01/21.
//

import SwiftUI
import AVKit

struct ColorTheoryView: View {
    var body: some View {
        ZStack {
            VStack {
                Image("Ellipse19")
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x: 30, y: 0)
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Image("GreenBlob")
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    
                    Spacer()
                }
                
                
            }
            
            ScrollView(.vertical) {
                VStack(spacing: 40){
                    HStack {
                        Text("Color Therapy🌈")
                            .font(.system(size: 28, weight: .heavy, design: .default))
                            .foregroundColor(Color.black)
                            .frame(alignment: .leading)
                            .padding(.top)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                    }.padding(.bottom, -16)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing : 30) {
                            ColorImageCard(image: "ct1")
                            ColorImageCard(image: "ct2")
                            ColorImageCard(image: "ct3")
                            ColorImageCard(image: "ct4")
                            ColorImageCard(image: "ct5")
                            ColorImageCard(image: "ct6")
                        }
                        .padding([.horizontal, .bottom])
                    }.frame(height: 270, alignment: .center)
                    
                    HStack {
                        Text("Meditation")
                            .font(.system(size: 28, weight: .heavy, design: .default))
                            .foregroundColor(Color.black)
                            .frame(alignment: .leading)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                    }.padding(.bottom, -16)
                   
                    ScrollView(.horizontal) {
                        HStack(spacing : 30) {
                            MediatationVideoCard(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/Meditation4.mp4?alt=media&token=e659fafa-d648-45ac-9e7c-53f82158c6a6")
                            
                            MediatationVideoCard(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/Meditation5.mp4?alt=media&token=8a687772-58df-4bf2-a224-c1a2e82732d8")
                            
                            MediatationVideoCard(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/Meditation1.mp4?alt=media&token=4de5a463-3c76-4925-88f9-3f210dd5965d")
                            
                            MediatationVideoCard(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/Meditation2.mp4?alt=media&token=afa095fa-44ee-407a-8bb9-f792c782624e")
                            
                            MediatationVideoCard(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/Meditation3.mp4?alt=media&token=b07a96e0-7f64-454a-9572-22954b30e927")
                            
                            
                        }
                        .padding([.horizontal, .bottom])
                    }.frame(height: 270, alignment: .center)
                    
                }
            }
        }
    }
}

struct ColorTheoryView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTheoryView()
    }
}

struct ColorImageCard: View {
    var image : String
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1))
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width - 80, height: 250, alignment: .center)
            
            
        }
        .frame(width: UIScreen.main.bounds.width - 80, height: 250, alignment: .center)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0.0, y: 5)
        .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0.0, y: 1)
    }
}

struct MediatationVideoCard: View {
    var link : String
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1))
            
            VideoPlayer(player: AVPlayer(url:  URL(string: link)!))
                .frame(width: UIScreen.main.bounds.width - 80, height: 250, alignment: .center)
            
        }
        .frame(width: UIScreen.main.bounds.width - 80, height: 250, alignment: .center)
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0.0, y: 5)
        .shadow(color: Color.black.opacity(0.2), radius: 1, x: 0.0, y: 1)
    }
}
