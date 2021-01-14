//
//  ProfileView.swift
//  MindCraft
//
//  Created by Anshul Garg on 22/11/20.
//

import SwiftUI

struct ProfileView: View {
    @State var showJournal : Bool = false
    @State var takeTest : Bool = false
    @State var showingAlert : Bool = false
    
    var body: some View {
        ZStack {
            
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
            
            VStack{
                HStack {
                    Text("Manage your profile ")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundColor(Color.black)
                        .frame(alignment: .leading)
                        .padding(.bottom, 20)
                    
                    Spacer()
                }
                
                ProfileButton(name: "My Journal", iconName: "book")
                    .onTapGesture {
                    self.showJournal.toggle()
                }
                
                Divider()
                
                ProfileButton(name: "Take a test", iconName: "questionmark.circle")
                    .onTapGesture {
                        self.showingAlert.toggle()
                }.alert(isPresented: $showingAlert) {
                    Alert(title: Text("Important message"), message: Text("It is recommended to consult doctor for psychometric test."), dismissButton: .default(Text("Got it!")){self.takeTest.toggle()})
                }
                    .sheet(isPresented: $takeTest, content: {
                        HelpDetailView(url: "https://screening.mhanational.org/screening-tools")
                    })
                
                Divider()
                
                Group {
                    ProfileButton(name: "Settings", iconName: "gear")
                    
                    Divider()
                    
                    ProfileButton(name: "About", iconName: "info.circle")
                    
                    Divider()
                    
                    ProfileButton(name: "Terms & Conditions", iconName: "info.circle")
                    
                    Divider()
                    
                    ProfileButton(name: "Privacy Policy", iconName: "info.circle")
                    
                    Divider()
                }
                
                
                
                Spacer()
            }.padding(.horizontal)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileButton: View {
    var name : String
    var iconName : String
    
    var body: some View {
        HStack {
            Text(name)
                .font(.system(size: 22, weight: .medium, design: .rounded))
            
            Spacer()
            
            Image(systemName: iconName)
                .resizable()
                .foregroundColor(Color.gray)
                .frame(width:24, height: 24, alignment: .center)
        }.contentShape(Rectangle())
       
    }
}
