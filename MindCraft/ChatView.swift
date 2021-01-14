//
//  ChatView.swift
//  MindCraft
//
//  Created by Anshul Garg on 24/11/20.
//

import SwiftUI

struct ChatView: View {
    @State var messageText : String = ""
    
    @State var messagesData = messages
    
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Image("GreenBlob")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(#colorLiteral(red: 0.8941176471, green: 0.9529411765, blue: 1, alpha: 1)))
                        .frame(width: 400, height: 300, alignment: .center)
                        .edgesIgnoringSafeArea(.all)
                        .offset(y: -100)
                    
                    Text("Let's talk yay!")
                        .font(.system(size: 26, weight: .regular, design: .default))
                        .foregroundColor(Color.black)
                        .frame(alignment: .leading)
                        .padding(.horizontal, 16)
                        .offset(y: -60)
                    
                    Text("Thursday 20:21")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(Color.gray)
                        .frame(alignment: .leading)
                        .padding(.horizontal, 16)
                }
                    
                
                Spacer()
            }
            
            VStack{
                
                Spacer()
                
                VStack {
                    ForEach(messagesData, id: \.message){message in
                        if message.sender{
                            HStack {
                                Text(message.message)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 15, weight: .medium))
                                    .padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
                                    .background(Color.gray.opacity(0.2))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .frame(alignment : .center)
                        
                                
                                Spacer()
                            }
                        }
                        
                        else{
                            HStack {
                                Spacer()
                                
                                Text(message.message)
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 15, weight: .medium))
                                    .padding(EdgeInsets(top: 10, leading: 12, bottom: 10, trailing: 12))
                                    .background(Color.blue.opacity(1.0))
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .frame(alignment : .center)
                        
                                
                                
                            }
                        }
                    }
                }.padding(.horizontal, 8)
                
                Spacer()
                
                HStack {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .frame(width: 34, height: 28, alignment: .center)
                        .foregroundColor(.gray)
                        .onTapGesture {
                            messagesData.append(Message(message: "Hello, sab bdiya?", sender: true))
                            messageText = ""
                        }
                    
                    TextField("Type a message", text: $messageText)
                        .keyboardType(.default)
                        .padding(8)
                        .font(Font.system(size: 15, weight: .medium, design: .rounded))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1.5))
                        .onTapGesture {
                            
                    }
                    
                    Image(systemName: "paperplane.circle")
                        .resizable()
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundColor(.blue)
                        .onTapGesture {
                            messagesData.append(Message(message: messageText, sender: false))
                            messageText = ""
                        }
                }
            }.padding(.horizontal)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

struct Message {
    var message : String
    var sender : Bool
}

var messages = [Message(message: "Howdy!", sender: true), Message(message: "So how are you doing today?", sender: true), Message(message: "Nothing much! It’s been a tough day. Glad could talk to someone :)", sender: false)]
