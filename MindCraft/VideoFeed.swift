//
//  VideoFeed.swift
//  MindCraft
//
//  Created by Anshul Garg on 13/01/21.
//

import SwiftUI
import AVKit

struct VideoFeed: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            HStack {
                Text("Dive into Others' world ✨")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .foregroundColor(Color.black)
                    .frame(alignment: .leading)
                    .padding(.top, 30)
                    .padding(.horizontal, 16)
                
                Spacer()
            }
            
            
            Spacer()
                .frame(height: 16, alignment: .center)
            
            VideoCardView(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/ETC_BOI_OCD.mp4?alt=media&token=d1df9c2a-addb-467e-813e-48c915153b9e", caption: "Simar Singh, Student at GTBIT👨🏼‍🎓 \nHe shared experience about OCD✨\nAlso importance about seeking professional help", name: "Simar")
            
            VideoCardView(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/Akansha%20Singh_Recovery.mp4?alt=media&token=26580f25-0586-4249-b31f-ea48ca00ae72", caption: "Akansha Singh, student at Mata Sundari Clg \nShared experience about #panic attacks🌼", name: "Akansha")
            
            VideoCardView(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/Sakshi_GargiClg.mp4?alt=media&token=3b12f56d-e038-4ed3-809d-b89502fac6d8", caption: "Sakshi Yadav,student at Gargi College, DU \nTalked about how childhood traumas affected her mental health🌻", name: "Sakshi")
           
            
            VideoCardView(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/Rachita_Depression.mp4?alt=media&token=da905212-2909-4f21-b21e-3e84f79ca55c", caption: "Rachita Oberoi, student at Sri Venkateshwara College, DU\nSharing her experience while fighting depression🌸", name: "Rachita")
            
            
            VideoCardView(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/Apoorv_Anxiety.mp4?alt=media&token=c2dcdf65-7aed-4207-b7b1-8ea9e99c518d", caption: "Apoorv Gupta, student at GTBIT \nShared experience about his #anxiety disorder😃\nLet's see how he tackled it.🧐", name: "Apoorv")
            
            
            VideoCardView(link: "https://firebasestorage.googleapis.com/v0/b/mindcraft-21d36.appspot.com/o/Tejas_Depression.mp4?alt=media&token=5aaf9b9d-1434-44e5-aad4-b5a6b4a9ad70", caption: "Tejasvir Singh, student at GTBIT \nShared experience about #depression💙", name: "Tejas")
            
        }
    }
}

struct VideoFeed_Previews: PreviewProvider {
    static var previews: some View {
        VideoFeed()
    }
}

struct VideoCardView: View {
    var link : String
    var caption : String
    var name : String
    @State var like = false
    @State private var isSharePresented: Bool = false
    @State var showChat = false
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                VideoPlayer(player: AVPlayer(url:  URL(string: link)!))
                    .frame(height: 300, alignment: .center)
            }.cornerRadius(15)
            .shadow(color: Color.black.opacity(0.23), radius: 8, x: 0, y: 8)
            .shadow(color: Color.black.opacity(0.23), radius: 1, x: 0, y: 1)
                
            HStack {
                
                Text(String("Talk with \(name) →"))
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .medium, design: .default))
                    .padding(EdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6))
                    .lineLimit(1)
                    .background(Color(#colorLiteral(red: 0.1176470588, green: 0.3411764706, blue: 0.4745098039, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .onTapGesture {
                        messages = [Message(message: "Howdy! I am \(name)", sender: true), Message(message: "So how are you doing today?", sender: true)]
                        self.showChat.toggle()
                    }
                    .sheet(isPresented: $showChat, content: {
                        ChatView()
                    })
                
                Spacer()
                
                Image(systemName: like ? "heart.fill"  : "suit.heart")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .foregroundColor(like ? .red : .black)
                    .onTapGesture {
                        self.like.toggle()
                    }
               
                
                Image(systemName: "paperplane")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 25)
                    .foregroundColor(.black)
                    .padding(.horizontal, 6)
                    .padding(.trailing, 4)
                    .onTapGesture {
                        self.isSharePresented = true
                    }
                    .sheet(isPresented: $isSharePresented, onDismiss: {
                        print("Dismiss")
                    }, content: {
                        ActivityViewController(activityItems: [URL(string: link)!])
                    })
                
                
            }.padding(.top, 8)
            .frame(height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Text(caption)
                .font(.system(size: 14, weight: .medium, design: .default))
                .foregroundColor(Color("secondary"))
                .frame(alignment: .leading)
                .lineLimit(3)
                .padding(.top, 12)
                .padding(.leading, 4)
            
            
            
            Spacer()
                .frame(height: 50)
        }.padding(.horizontal)
    }
}
