//
//  NotifsView.swift
//  Habify
//
//  Created by thiam mame diarra on 15/03/2024.
//

import SwiftUI

struct NotifsView: View {
    @State private var push = true
    @State private var inapp = false
    @State private var message = true
    @State private var remind = false
    @State private var sound = true
    @State private var vibration = true
    
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Text("General settings")
                    .font(.title2)
                    .foregroundColor(Color("AltColorText"))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 40)
                
                
                NavigationLink(destination: NotifsCustomView(morningViewModel: CustomPickerNotifsViewModel(), afternoonViewModel: CustomPickerNotifsViewModel(), nightViewModel: CustomPickerNotifsViewModel())) {
                    HStack{
                        Image(systemName: "bell.badge")
                            .foregroundColor(.white)
                            .frame(width: 49, height: 49)
                            .clipShape(Circle())
                            .background(
                                Circle()
                                    .fill(Color("MainGreen"))
                                    .frame(width: 39, height: 39)
                            )
                        Text("Custom my notifications")
                            .padding(10)
                            .font(.system(size:18))
                            .foregroundColor(Color("MainIconColor"))
                            .bold()
                    }
                    .frame(width: 319, height: 61)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                }

                HStack{
                    Text("Push notifications")
                        .foregroundColor(Color("MainIconColor"))
                        .font(.system(size:16))
                        .bold()
                    Spacer()
                    Toggle("", isOn: $push)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: Color("MainGreen")))
                        .padding()
                }
                .padding(.leading, 15)
                .frame(width: 319, height: 61)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                
                HStack{
                    Text("In-app notifications")
                        .font(.system(size:16))
                        .foregroundColor(Color("MainIconColor"))
                        .bold()
                    Spacer()
                    Toggle("", isOn: $inapp)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: Color("MainGreen")))
                        .padding()
                }
                .padding(.leading, 15)
                .frame(width: 319, height: 61)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                
                Text("Message settings")
                    .font(.title2)
                    .foregroundColor(Color("AltColorText"))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 40)
                
                HStack{
                    Text("Message")
                        .foregroundColor(Color("MainIconColor"))
                        .font(.system(size:16))
                        .bold()
                    Spacer()
                    Toggle("", isOn: $message)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: Color("MainGreen")))
                        .padding()
                }
                .padding(.leading, 15)
                .frame(width: 319, height: 61)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                
                HStack{
                    Text("Reminders")
                        .foregroundColor(Color("MainIconColor"))
                        .font(.system(size:16))
                        .bold()
                    Spacer()
                    Toggle("", isOn: $remind)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: Color("MainGreen")))
                        .padding()
                }
                .padding(.leading, 15)
                .frame(width: 319, height: 61)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                
                Text("Sound settings")
                    .font(.title2)
                    .foregroundColor(Color("AltColorText"))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 40)
                
                HStack{
                    Text("Sound")
                        .foregroundColor(Color("MainIconColor"))
                        .font(.system(size:16))
                        .bold()
                    Spacer()
                    Toggle("", isOn: $sound)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: Color("MainGreen")))
                        .padding()
                }
                .padding(.leading, 15)
                .frame(width: 319, height: 61)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                
                HStack{
                    Text("Vibration")
                        .foregroundColor(Color("MainIconColor"))
                        .font(.system(size:16))
                        .bold()
                    Spacer()
                    Toggle("", isOn: $vibration)
                        .labelsHidden()
                        .toggleStyle(SwitchToggleStyle(tint: Color("MainGreen")))
                        .padding()
                }
                .padding(.leading, 15)
                .frame(width: 319, height: 61)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                
                
                
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "arrow.backward.circle.fill")
                                .resizable()
                                .foregroundColor(Color("MainIconColor"))
                                .frame(width: 39, height: 39)
                                .aspectRatio(contentMode: .fit)
                        }
                    }

                    ToolbarItem(placement: .principal) {
                        Text("Notifications")
                            .font(.largeTitle)
                            .foregroundColor(Color("MainIconColor"))
                            .bold()
                    }
                    
                    
                }
                .navigationBarBackButtonHidden(true)
                
            }
        }
    }
}

struct NotifsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NotifsView()
        }
    }
}
