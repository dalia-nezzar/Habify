//
//  ProfileEditView.swift
//  Habify
//
//  Created by nezzar dalia on 18/03/2024.
//

import SwiftUI

struct ProfileEditView: View {
    
    @EnvironmentObject var user: User
    
    @Environment(\.presentationMode) var presentationMode

    
    @State var newName = ""

    var body: some View {
        ZStack {
            Color("AppColorBackground")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Image(user.profilePhoto)
                    .resizable()
                    .cornerRadius(300)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .padding(.horizontal)
                    .overlay(
                        Circle()
                            .stroke(Color("MainGreen"), lineWidth: 6)
                    )
                    .overlay(
                        Button {
                            // TODO: Open gallery and select image in png/jpg/jpeg
                        } label: {
                            Image(systemName: "square.and.pencil.circle.fill") // icône de crayon
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                                .foregroundColor(Color("MainGreen"))
                                .background(
                                    Circle()
                                        .fill(.white)
                                )
                                .padding(.bottom, 0)
                        },
                        alignment: .bottomTrailing
                    )
                
                Text("Edit my name")
                    .font(.title2)
                    .foregroundColor(Color("AltColorText"))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 40)
                    .padding(.top, 20)
                
                TextField("Enter your name here", text: $newName)
                    .padding(.horizontal)
                    .frame(width:297, height:64)
                    .background(.white)
                    .foregroundColor(Color("MainBlueColor"))
                    .cornerRadius(33)
                    .shadow(color: .black.opacity(0.05), radius: 7, x:0, y:0)
                
                Spacer()
                
                Button {
                    print(newName)
                    user.nameUser = newName
                    presentationMode.wrappedValue.dismiss()
                } label : {
                    Text("Edit")
                        .frame(width: 180, height: 50)
                        .background(Color("MainGreen"))
                        .foregroundColor(.white)
                        .cornerRadius(33)
                        .bold()
                        .padding(.bottom, 30)

                }
                
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
                        Text("Edit my profile")
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

struct ProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileEditView()
                .environmentObject(User())
        }
    }
}
