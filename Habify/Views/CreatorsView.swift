//
//  CreatorsView.swift
//  Habify
//
//  Created by thiam mame diarra on 15/03/2024.
//

import SwiftUI

struct CreatorsView : View{
    
    var body: some View {
        ZStack {
            Color("AppBackground")
            .edgesIgnoringSafeArea(.all)
            VStack {
                SingleCreatorView(nom: "Dalia Nezzar", description: "Student, designer and developer of habify. ! Always loved coding always will.", image: "DaliaIcon")
                SingleCreatorView(nom: "Mame Diarra Thiam", description: "Student, designer and developer of habify!", image: "DiarraIcon")
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
        }
    }
    
}

struct CreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorsView()
    }
}
