//
//  WelcomeView.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var user: User
    @State private var nameEntered = false
    @State private var nameUser: String = ""

    
    var body: some View {
        ZStack {
            Image("WelcomeImageBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            if !nameEntered {
                VStack {
                    VStack(spacing: 0) {
                        Image("LogoImageHabit")
                        Text("habify.")
                            .foregroundColor(.white)
                            .font(Font.custom("Jua-Regular", size: 30))
                            .bold()
                            .shadow(color: .white, radius: 3.2, x:0, y:0)
                    }
                    .padding(.top, 50)
                    Spacer()
                    
                    Text("Welcome,")
                        .font(.system(size:40))
                        .foregroundColor(.white)
                        .bold()
                    
                    ZStack {
                        Rectangle()
                            .frame(width:297, height:64)
                            .foregroundColor(.white.opacity(0.9))
                            .cornerRadius(33)
                            .shadow(color: .black.opacity(0.5), radius: 7, x:0, y:0)
                        
                        HStack{
                            TextField("Enter your name here", text: $nameUser)
                                .foregroundColor(.black.opacity(0.5))
                                .frame(width:210, height:64)
                                .font(.system(size: 15))
                            
                            Button(action: {
                                user.nameUser = nameUser
                                self.nameEntered = true
                                print(self.nameUser)
                            }) {
                                Image(systemName: "arrow.forward.circle.fill")
                                    .resizable()
                                    .foregroundColor(Color("MainIconColor"))
                                    .frame(width: 30, height:30)
                            }
                            .disabled(nameUser.isEmpty)
                        }
                    }
                    Spacer()
                    Spacer()
                }
            } else {
                MainView()
                    .environmentObject(user)
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
            .environmentObject(User())
        
    }
}
