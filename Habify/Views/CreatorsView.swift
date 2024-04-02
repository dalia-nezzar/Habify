//
//  CreatorsView.swift
//  Habify
//
//  Created by thiam mame diarra on 15/03/2024.
//

import SwiftUI

struct CreatorsView : View{
    
    @Environment(\.presentationMode) var presentationMode

    
    var body: some View {
        ZStack {
            Color("AppColorBackground")
            .edgesIgnoringSafeArea(.all)
            VStack {
                SingleCreatorView(nom: "Dalia Nezzar", description: "Student, designer and developer of habify. ! Always loved coding always will.", image: "DaliaIcon", emailAddress: "nezzar.dalia@gmail.com", phoneNumber: "0769989618", linkedin: "https://fr.linkedin.com/in/dalia-nezzar-302984299", github: "https://github.com/dalia-nezzar")
                SingleCreatorView(nom: "Mame Diarra Thiam", description: "Student, designer and developer of habify!", image: "DiarraIcon", emailAddress: "diathiam2004@gmail.com", phoneNumber: "0769038683", linkedin: "https://fr.linkedin.com/in/mame-diarra-thiam-351a85281", github: "https://github.com/diarrathiamm")
                Spacer()
                Image("LogoInfo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 118, height: 48)
                Text("© 2024 - 2024 Habify - All Rights Reserved.")
                    .foregroundColor(Color("AltColorText"))
                    .frame(width: 300)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20))
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
                                    Text("The Team habify")
                                        .font(.largeTitle)
                                        .foregroundColor(Color("MainIconColor"))
                                        .bold()
                                }
                            }
                            .navigationBarBackButtonHidden(true)
        }
    }
    
}

struct CreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreatorsView()
        }
    }
}
