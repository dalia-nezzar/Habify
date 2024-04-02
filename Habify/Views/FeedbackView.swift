//
//  FeedbackView.swift
//  Habify
//
//  Created by nezzar dalia on 20/03/2024.
//

import SwiftUI

struct FeedbackView: View {
    @State private var rating = 1
    let maxRating=5
    
    @State private var message: String = ""
    
    @Environment(\.presentationMode) var presentationMode


    
    var body: some View {
        ZStack {
            Color("AppColorBackground")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    ForEach(Array(1...maxRating), id: \.self) { number in
                        StarView(isFilled: self.rating >= number)
                            .onTapGesture {
                                self.rating = number
                            }
                        
                    }
                }
                .frame(width: 301, height: 69)
                .background(Color("WhiteRows"))
                .cornerRadius(17)
                .shadow(color: Color.black.opacity(0.08), radius: 16, x: 0, y: 0)
                
                VStack(alignment: .leading, spacing: 15) {
                    VStack(alignment: .leading, spacing : 10) {
                        Text("Tell us! 😼")
                            .font(.title3)
                            .bold()
                        
                        Text("What could be improved? What did you like?")
                            .font(.caption)
                            .italic()
                            .foregroundColor(Color("AltColorText"))
                        
                        
                        ScrollView {
                            CustomTextField(text: $message, placeholder: "Write your message here...")
                        }
                    }
                    .padding(.vertical, 23)
                    
                    Spacer()
                }
                .frame(width: 301, height: 380)
                .background(Color("WhiteRows"))
                .cornerRadius(17)
                .shadow(color: Color.black.opacity(0.1), radius: 16, x: 0, y: 0)
                
                Spacer()
                
                
                Button(action: {
                    if !self.message.isEmpty {
                        let feedbackMessage = "Rating: \(self.rating)\n\nMessage: \(self.message)"
                        if let url = URL(string: "mailto:your-email-address@example.com?subject=Feedback&body=\(feedbackMessage.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
                            if UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            } else {
                                let alert = UIAlertController(title: "Error", message: "The Mail app is not available on this device.", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                UIApplication.shared.connectedScenes
                                    .filter {$0.activationState == .foregroundActive}
                                    .map {$0 as? UIWindowScene}
                                    .compactMap {$0}
                                    .first?.windows
                                    .filter {$0.isKeyWindow}
                                    .first?.rootViewController?.present(alert, animated: true, completion: nil)
                            }
                        }
                    } else {
                        let alert = UIAlertController(title: "Error", message: "Please enter a message.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        UIApplication.shared.connectedScenes
                            .filter {$0.activationState == .foregroundActive}
                            .map {$0 as? UIWindowScene}
                            .compactMap {$0}
                            .first?.windows
                            .filter {$0.isKeyWindow}
                            .first?.rootViewController?.present(alert, animated: true, completion: nil)
                    }
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Send my feedback")
                        .frame(width: 180, height: 50)
                        .background(Color("MainGreen"))
                        .foregroundColor(.white)
                        .cornerRadius(33)
                        .bold()
                        .padding(.bottom, 30)
                }
                
                

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
                                    Text("Send a Feedback")
                                        .font(.largeTitle)
                                        .foregroundColor(Color("MainIconColor"))
                                        .bold()
                                }
                            }
                            .navigationBarBackButtonHidden(true)
            
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedbackView()
        }
    }
}
