//
//  AddView.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import SwiftUI

struct AddView: View {
    
    @State var newHabit: String = ""
    
    @State var period: Period = .morning
    
    @EnvironmentObject var habitsViewModel: HabitsViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                // Spacer()
                
                Image("AddPageIllustration")
                TextField("Enter your habit here", text: $newHabit)
                    .padding(.horizontal)
                    .frame(width:297, height:64)
                    .background(.white)
                    .foregroundColor(Color("MainBlueColor"))
                    .cornerRadius(33)
                    .shadow(color: .black.opacity(0.05), radius: 7, x:0, y:0)
                    .padding(16)
                
                Text("Select a period")
                    .font(.title2)
                    .foregroundColor(Color("AltColorText"))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 40)
                
                HStack(spacing: 5) {
                    ForEach(Period.allCases.filter({ $0 != .all }), id: \.self) { periodValue in
                        CustomPicker(icon: periodValue.iconPeriod, isSelected: period == periodValue, action: {
                            period = periodValue
                        })
                    }
                }
                
                
                Spacer()
                
                Button {
                    habitsViewModel.addHabit(title: newHabit, period: period)
                    presentationMode.wrappedValue.dismiss()
                } label : {
                    Text("Add it!")
                        .frame(width: 180, height: 50)
                        .background(Color("MainGreen"))
                        .foregroundColor(.white)
                        .cornerRadius(33)
                        .bold()

                }
                .padding(16)
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
                        Text("Add a habit")
                            .font(.largeTitle)
                            .foregroundColor(Color("MainIconColor"))
                            .bold()
                    }
                }
                .navigationBarBackButtonHidden(true)
                
                Spacer()
                
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
    }
}
