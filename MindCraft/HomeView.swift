//
//  HomeView.swift
//  MindCraft
//
//  Created by Anshul Garg on 21/11/20.
//

import SwiftUI

struct HomeView: View {
    @State var showChat = false
    @State var helpCard = false
    @State var colorTherapy = false
    @State var expertCare = false
    
    var body: some View {
        VStack{
            ZStack{
                VStack {
                    HStack {
                        Image("Ellipse17")
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                        
                        Spacer()
                    }.edgesIgnoringSafeArea(.all)
                    
                    Spacer()
                }
                
                VStack {
                    Image("Ellipse18")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: size.width - 30)
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                        .offset(x: -50.0, y: -20)
                    
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                        Text("Hello Anshul!")
                            .font(.system(size: 20, weight: .medium, design: .default))
                            .foregroundColor(Color("secondary"))
                            .frame(alignment: .leading)
                            .padding(.top, 70)
                            .padding(.leading, 16)
                    
                    Text("Take a deep breath. \n I'm here for you.")
                        .font(.system(size: 34, weight: .regular, design: .default))
                        .foregroundColor(Color.black)
                        .frame(alignment: .leading)
                        .padding(.top, 20)
                        .padding(.horizontal, 16)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            CardButton(title: "Let's Chat!", image: "chatCard")
                                .onTapGesture {
                                    messages = [Message(message: "Howdy!", sender: true), Message(message: "So how are you doing today?", sender: true), Message(message: "Nothing much! It’s been a tough day. Glad could talk to someone :)", sender: false)]

                                    showChat.toggle()
                                }
                                .sheet(isPresented: $showChat, content: {
                                    ChatView()
                                })
                            
                            CardButton(title: "Expert Care*", image: "music")
                                .onTapGesture {
                                    expertCare.toggle()
                                }
                                .sheet(isPresented: $expertCare, content: {
                                    ExpertCareView()
                                })
                        }
                        
                        Spacer()
                            .frame(height : 24)
                        
                        HStack {
                            CardButton(title: "Therapy", image: "forFun")
                                .onTapGesture {
                                    colorTherapy.toggle()
                                }
                                .sheet(isPresented: $colorTherapy, content: {
                                    ColorTheoryView()
                                })
                            
                            CardButton(title: "Self Care", image: "meditate")
                                .onTapGesture {
                                    helpCard.toggle()
                                }
                                .sheet(isPresented: $helpCard, content: {
                                    HelpView()
                                })
                        }
                        
                    }.padding(.horizontal, 8)
                    .frame(maxWidth: .infinity)
                    
                
                    Spacer()
                }.frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

var size = UIScreen.main.bounds.size

struct CardButton: View {
    var title : String
    var image: String
    
    var body: some View {
        ZStack{
            Color("card1")
            
            VStack() {
                Spacer()
                
                Image(image)
                    .offset(y: 12)
                
            }
            
            VStack {
                HStack(alignment: .top) {
                    Text(title)
                        .font(.system(size: 18, weight: .medium))
                        .frame(alignment: .leading)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image("arrow")
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20, alignment: .top)
                    
                }.padding(.top)
                .padding(.horizontal, 12)
                
                Spacer()
            }
            
        }.frame(width: size.width/2 - 30, height: 150, alignment: .center)
        .cornerRadius(18)
        .padding(.horizontal, 8)
    }
}
