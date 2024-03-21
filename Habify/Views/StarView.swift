//
//  StarView.swift
//  Habify
//
//  Created by nezzar dalia on 20/03/2024.
//

import SwiftUI

struct StarView: View {
    
    var isFilled : Bool
    
    var body: some View {
        Image(systemName: isFilled ? "star.fill" : "star")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color("MainGreen"))
            .frame(width: 37)
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView(isFilled: true)
        StarView(isFilled: false)
    }
}
