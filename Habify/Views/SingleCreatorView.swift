//
//  CreatorsView.swift
//  Habify
//
//  Created by thiam mame diarra on 15/03/2024.
//

import SwiftUI

struct SingleCreatorView : View{
    
    let nom : String
    let description : String
    let image : String
    
    
    let emailAddress : String
    let phoneNumber : String
    
    let linkedin : String
    let github : String
    
    var body: some View {
        VStack {
                HStack{
                    // photo
                    Image (image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 114, height: 114)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color("MainGreen"), lineWidth: 10)
                        )
                    VStack{
                        Text(nom)
                            .bold()
                            .font(.system(size: 28))
                            .frame( alignment: .leading)

                            
                        Text(description)
                            .frame(width: 160, alignment: .leading)
                            .foregroundColor(Color("AltColorText"))
                            .font(.system(size: 14))
                            .bold()
                        
                    }
                    .padding(10)
                }
                HStack(spacing: 20){
                    Button(action: {
                        if let url = URL(string: "tel://\(phoneNumber)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image(systemName: "phone.and.waveform.fill")
                            .foregroundColor(.white)
                            .frame(width: 49, height: 49)
                            .clipShape(Circle())
                            .background(
                                Circle()
                                    .fill(Color("MainGreen"))
                                    .frame(width: 49, height: 49)
                            )
                    }
                    
                    
                    Button(action: {
                        if let url = URL(string: "mailto:\(emailAddress)") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.white)
                            .frame(width: 49, height: 49)
                            .clipShape(Circle())
                            .background(
                                Circle()
                                    .fill(Color("MainGreen"))
                                    .frame(width: 49, height: 49)
                            )
                    }
                    
                    
                    Button(action: {
                        if let url = URL(string: linkedin) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image("LinkedIn")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 29, height: 29)
                            .padding(10)
                            .clipShape(Circle())
                            .background(
                                Circle()
                                    .fill(Color("MainGreen"))
                                    .frame(width: 49, height: 49)
                            )
                    }
                    
                    Button(action: {
                        if let url = URL(string: github) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image("Github")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 29, height: 29)
                            .padding(10)
                            .clipShape(Circle())
                            .background(
                                Circle()
                                    .fill(Color("MainGreen"))
                                    .frame(width: 49, height: 49)
                            )
                    }
                }
                .padding(5)
            }
            .frame(width: 340, height: 222)
            .background(Color("WhiteRows"))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.20), radius: 16, x: 0, y: 0)
            .padding(20)
        
    }
}

struct SingleCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            SingleCreatorView(nom: "Dalia nezzar", description: "Student, designer and developer of habify. ! Always loved coding always will.", image: "DaliaIcon", emailAddress: "nezzar.dalia@gmail.com", phoneNumber: "0769989618", linkedin: "google.fr", github: "https://github.com/dalia-nezzar")
        }
    }
}
