//
//  HelpView.swift
//  MindCraft
//
//  Created by Anshul Garg on 24/11/20.
//

import SwiftUI

struct HelpView: View {
    @State var showNGO = false
    @State var showPsychologists = false
    @State var showPsychiatrists = false
    @State var learnMore = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Image("Blob")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.951870576, blue: 0.7592989788, alpha: 1)))
                        .offset(x: 50, y: -50)
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                }
                
                Spacer()
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Image("helpPeep")
                        .resizable()
                        .offset(x: 50)
                        .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.all)
                        .offset(y: 70)
                }
                
                Spacer()
            }
            
            VStack {
                HStack {
                    Text("We love to help you.⭐️")
                        .font(.system(size: 30, weight: .regular, design: .default))
                        .foregroundColor(Color.black)
                        .frame(alignment: .leading)
                        .padding(.top, 40)
                        .padding(.horizontal, 16)
                    
                    Spacer()
                }
                
                Spacer()
            }
            
            VStack{
                ListButton(title: "Talk to NGOs")
                    .onTapGesture {
                        self.showNGO.toggle()
                    }
                    .sheet(isPresented: $showNGO, content: {
                        HelpDetailView(url: "https://blog.giveindia.org/mental-health/10-ngos-helping-the-mentally-challenged-lead-a-normal-life-in-india/")
                    })
                
                
                ListButton(title: "Psychologists")
                    .onTapGesture {
                        self.showPsychologists.toggle()
                    }
                    .sheet(isPresented: $showPsychologists, content: {
                        HelpDetailView(url: "https://www.practo.com/delhi/psychologist")
                    })
                
                ListButton(title: "Psychiatrist")
                    .onTapGesture {
                        self.showPsychiatrists.toggle()
                    }
                    .sheet(isPresented: $showPsychiatrists, content: {
                        HelpDetailView(url: "https://www.practo.com/delhi/psychiatrist")
                    })
                
                ListButton(title: "Know your disease")
                    .onTapGesture {
                        self.learnMore.toggle()
                    }
                    .sheet(isPresented: $learnMore, content: {
                        HelpDetailView(url: "https://www.who.int/news-room/fact-sheets/detail/mental-disorders")
                    })
                
            }.offset(y: 90)
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}

struct ListButton: View {
    var title : String
//    var image: String
    
    var body: some View {
        ZStack{
            Color("card1")
            
            VStack() {
                HStack {
                    Text(title)
                        .font(.system(size: 20, weight: .medium))
                        .frame(alignment: .leading)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    Image("arrow")
                        .foregroundColor(.white)
                        .frame(width: 20, height: 20, alignment: .center)
                    
                }
                .padding(.horizontal, 12)
                
                
                
//                Image(image)
//                    .offset(y: 12)
                
            }
            
        }.frame(width: size.width - 20, height: 80, alignment: .center)
        .cornerRadius(18)
        .padding(.horizontal, 8)
    }
}

