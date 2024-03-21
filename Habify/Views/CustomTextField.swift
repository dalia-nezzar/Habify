//
//  CustomTextField.swift
//  Habify
//
//  Created by nezzar dalia on 21/03/2024.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String
    
    @State var characterLimit: Int = 80
    @State var typedCharacters: Int = 0



    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(Color("AltColorText"))
                        .padding(.leading, 15)
                        .font(.caption)
                        .padding(.top, 30)
                        .italic()
                }

                TextEditor(text: $text)
                    .scrollContentBackground(.hidden)
                    .padding(.leading, 10)
                    .padding(.top, 20)
                    .background(Color.clear)
                    .onChange(of: text) { result in
                        typedCharacters = text.count
                        text = String(text.prefix(characterLimit))
                    }
                    .overlay(
                        Text("\(typedCharacters) / \(characterLimit)")
                                    .foregroundColor(Color("MainBlueColor"))
                                    .font(.caption2)
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 4)
                                    .padding(.trailing, 15)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("BackgroundCustomPicker"))
                                            .padding(.trailing, 15)
                                    ),
                        alignment: .bottomTrailing
                    )
                
            }
            
            Spacer()

        }
        .frame(width: 270, height: 248)
        .background(
            RoundedRectangle(cornerRadius: 17)
                .fill(Color("TextFieldColor"))
        )
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        @State var sampleText = ""
        CustomTextField(text: $sampleText, placeholder: "Type your feedback here...")
            .previewLayout(.fixed(width: 270, height: 248))
    }
}
