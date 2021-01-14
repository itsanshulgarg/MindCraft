//
//  FeedView.swift
//  MindCraft
//
//  Created by Anshul Garg on 22/11/20.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @State var showVideos = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Image("Ellipse19")
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 40, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(x: 30, y: 0)
                
                }.edgesIgnoringSafeArea(.all)
                
                Spacer()
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                
                HStack {
                    Text("What's new! ☀️")
                        .font(.system(size: 34, weight: .regular, design: .default))
                        .foregroundColor(Color.black)
                        .frame(alignment: .leading)
                        .padding(.top, 30)
                        .padding(.horizontal, 16)
                    
                    Spacer()
                }
                
                HStack(alignment: .center) {
                    Text("Recommended articles")
                        .font(.system(size: 16, weight: .black, design: .default))
                        .foregroundColor(Color.black)
                        .frame(alignment: .leading)

                    Spacer()
                    
                    Text(String("Explore →"))
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .padding(EdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6))
                        .lineLimit(1)
                        .background(Color(#colorLiteral(red: 0.1176470588, green: 0.3411764706, blue: 0.4745098039, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .onTapGesture {
                            self.showVideos.toggle()
                        }
                        .sheet(isPresented: $showVideos, content: {
                            VideoFeed()
                        })
                    
                }.padding(.top, 20)
                .padding(.horizontal)
                
                RecommendCard(color: "Orange", title: "“When you let it flow - you make space”", image: "humanThinking", subtitle: "", subscribe: false)
                
                Spacer()
                    .frame(height: 16, alignment: .center)
                
                RecommendCard(color: "card4", title: "How have you felt lately?", image: "humanPointing", subtitle: "Monitor sleep to make it better.", subscribe: true)
                
                Spacer()
                    .frame(height: 16, alignment: .center)
                
                HStack(alignment: .center) {
                    Text("Podcasts to try")
                        .font(.system(size: 22, weight: .black, design: .default))
                        .foregroundColor(Color.black)
                        .frame(alignment: .leading)

                    Spacer()
                    
                    Text(String("Explore →"))
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .padding(EdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6))
                        .lineLimit(1)
                        .background(Color(#colorLiteral(red: 0.1176470588, green: 0.3411764706, blue: 0.4745098039, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .onTapGesture {
                            self.showVideos.toggle()
                        }
                        .sheet(isPresented: $showVideos, content: {
                            VideoFeed()
                        })
                    
                }.padding(.top, 20)
                .padding(.horizontal)
               
                HStack {
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        HStack(spacing: 20) {
                            PodcastCard(name: "THE NOD", imageName: "theNod", link: "https://podcasts.apple.com/us/podcast/the-nod/id1250583865")
                            PodcastCard(name: "Throwing Shade", imageName: "shade", link: "https://podcasts.apple.com/in/podcast/throwingshade/id1174690531")
                            PodcastCard(name: "Happy Hour", imageName: "mentalllness", link: "https://podcasts.apple.com/in/podcast/mental-illness-happy-hour/id427377900")
                            PodcastCard(name: "The Happiness Lab", imageName: "labHappy", link: "https://podcasts.apple.com/in/podcast/the-happiness-lab-with-dr-laurie-santos/id1474245040")
                            
                        }
                        
                    }).frame(height: 130, alignment: .center)
                }.padding(.horizontal, 20)
                
            }
        }
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}



struct RecommendCard: View {
    var color : String
    var title : String
    var image : String
    var subtitle : String
    var subscribe : Bool
    
    var body: some View {
        ZStack{
            Color(color)
                .frame(height: 250)
                .cornerRadius(20)
            
            
            VStack {
                Spacer()
                
                Image(image)
                    .frame(width: 100, height: 100, alignment: .center)
                    .offset(x: 30, y: -65)
            }
            
            HStack {
                VStack {
                    Text(title)
                        .frame(width: 150)
                        .font(.system(size: 22, weight: .bold, design: .default))
                    
                    Text(subtitle)
                        .frame(width: 150, alignment: .leading)
                        .font(.system(size: 22, weight: .light, design: .default))
                        .padding(.top, 8)
                    
                } .offset(x: 0, y: -20)
                Spacer()
            }.padding(.horizontal)
            
            
            VStack {
                HStack {
                    Spacer()
                    
                    Image(systemName:  subscribe ? "checkmark" : "plus")
                        .resizable()
                        .frame(width: 25, height: 24, alignment: .center)
                        .foregroundColor(subscribe ? Color("blue") : Color.white)
                }
                
                Spacer()
            }.padding()
            
            
        }.padding(.horizontal)
        .frame(height: 250)
    }
}


struct PodcastCard: View {
    var name: String
    var imageName: String
    var link : String
    
    @State var openLink = false
    
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
                .frame(width: 200, height: 100, alignment: .center)
            
            HStack {
                Text(name)
                    .font(.system(size: 18, weight: .bold, design: .default))
                
                Spacer()
                
                Image(imageName)
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .center)
                
                
            }.padding(.horizontal)
            
        }.frame(width: 230, height: 100, alignment: .center)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.blue))
        .onTapGesture {
            self.openLink.toggle()
        }
        .sheet(isPresented: $openLink, content: {
            HelpDetailView(url: link)
        })
    }
}
