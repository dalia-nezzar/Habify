//
//  SettingsView.swift
//  Habify
//
//  Created by nezzar dalia on 15/03/2024.
//

import SwiftUI

struct SettingsView: View {
    
    
    @EnvironmentObject var user: User
    
    @State var darkMode = false

    var body: some View {
        NavigationView{
            ZStack{
                Color("AppBackground")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Text("Settings")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(Color("MainIconColor"))
                        
                        Spacer()
                        
                        Image("LogoImageHabit")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60)
                    }
                    .padding(20)
                    
                    NavigationLink(destination: ProfileEditView()) {
                        HStack(alignment: .center) {
                            Image(user.profilePhoto)
                                .resizable()
                                .clipShape(Circle())
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 81, height:81)
                                .padding(.horizontal)
                                .overlay(
                                    Circle()
                                        .stroke(Color("MainGreen"), lineWidth: 6)
                                )
                            
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(user.nameUser)
                                    .font(.title2)
                                    .bold()
                                    .foregroundColor(Color("MainIconColor"))
                                
                                Text("Edit personal profile")
                                    .font(.system(size : 15))
                                    .bold()
                                    .foregroundColor(Color("AltColorText"))
                                
                            }
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right.circle.fill")
                                .resizable()
                                .frame(width: 28, height:28)
                                .foregroundColor(Color("MainIconColor"))
                                .padding(.horizontal)
                            
                        }
                        .background(.clear)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    
                    VStack {
                        
                        Text("Appearance")
                            .font(.title2)
                            .foregroundColor(Color("AltColorText"))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 40)
                            .padding(.top, 20)
                        
                        HStack{
                            Image(systemName: "moon.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding(10)
                                .foregroundColor(Color("MainIconColor"))
                            
                            Text("Dark Mode")
                                .font(.system(size:16))
                                .bold()
                                .foregroundColor(Color("MainIconColor"))
                            
                            Spacer()
                            Toggle("", isOn: $darkMode)
                                .labelsHidden()
                                .toggleStyle(SwitchToggleStyle(tint: Color("MainGreen")))
                                .padding()
                        }
                        .padding(.leading, 15)
                        .frame(width: 319, height: 61)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                        .onTapGesture {
                            darkMode.toggle()
                        }
                        
                        
                        Text("Notifications")
                            .font(.title2)
                            .foregroundColor(Color("AltColorText"))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 40)
                            .padding(.top, 20)
                        
                        
                        NavigationLink(destination: NotifsView()) {
                            HStack{
                                Image(systemName: "bell.fill")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(10)
                                    .foregroundColor(.yellow)
                                
                                Text("Notifications")
                                    .font(.system(size:16))
                                    .bold()
                                    .foregroundColor(Color("MainIconColor"))
                                
                                Spacer()
                            }
                            .padding(.leading, 15)
                            .frame(width: 319, height: 61)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                        }
                        
                        
                        Text("Contact")
                            .font(.title2)
                            .foregroundColor(Color("AltColorText"))
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 40)
                            .padding(.top, 20)
                        
                        
                        NavigationLink(destination: CreatorsView()) {
                            HStack{
                                Image("LogoImageHabit")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30)
                                    .padding(10)
                                    .foregroundColor(.yellow)
                                
                                Text("The Team habify.")
                                    .font(.system(size:16))
                                    .bold()
                                    .foregroundColor(Color("MainIconColor"))
                                
                                Spacer()
                            }
                            .padding(.leading, 15)
                            .frame(width: 319, height: 61)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                        }
                        
                        
                        NavigationLink(destination: FeedbackView()) {
                            HStack{
                                Image(systemName: "hands.sparkles.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30)
                                    .padding(10)
                                    .foregroundColor(.red)
                                
                                Text("Leave a Feedback")
                                    .font(.system(size:16))
                                    .bold()
                                    .foregroundColor(Color("MainIconColor"))
                                
                                Spacer()
                            }
                            .padding(.leading, 15)
                            .frame(width: 319, height: 61)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                        }
                        
                        
                        
                        
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(User())
        
        
        
    }
}
