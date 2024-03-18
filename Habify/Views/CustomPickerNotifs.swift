
//
//  CustomPickerNotifs.swift
//  Habify
//
//  Created by thiam mame diarra on 15/03/2024.
//

import SwiftUI
import Foundation

struct CustomPickerNotifs: View {
    @ObservedObject var viewModel: CustomPickerNotifsViewModel
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    @Binding var hour: String

    var body: some View {
        Button(action: {
            viewModel.selectedHour = hour
            self.viewModel.isSheetPresented = true
        }){
            HStack {
                Image(systemName: icon)
                    .resizable()
                    .foregroundColor(icon == "sunrise.fill" ? Color("filterMorning") : icon == "moon.fill" ? Color("filterNight") : icon == "sun.max.fill" ? Color("filterAfternoon") : isSelected ? Color("MainGreen") : Color("BackgroundCustomPicker"))
                    .if(icon == "sunrise.fill") { content in
                        content
                        .aspectRatio(contentMode: .fit) }
                    .frame(width: 50, height: 50)
                    .padding(15)
                    .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                Spacer()
                Text(hour)
                    .bold()
                    .padding(15)
                    .font(.system(size:22))
                    .foregroundColor(icon == "sunrise.fill" ? Color("hourMorning") : icon == "moon.fill" ? Color("hourNight") : icon == "sun.max.fill" ? Color("hourAfternoon") : isSelected ? Color("MainGreen") : Color("BackgroundCustomPicker"))
                    .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
            }
            .padding(.horizontal)
            .frame(width: 300, height: 100)
            .background(icon == "sunrise.fill" ? Color("habitMorning") : icon == "moon.fill" ? Color("habitNight") : icon == "sun.max.fill" ? Color("habitAfternoon"): isSelected ? Color("MainGreen") : Color("BackgroundCustomPicker"))
            .cornerRadius(6)
            .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
        }
        .sheet(isPresented: $viewModel.isSheetPresented) {
            NavigationView {
                VStack { // Utilisez une vue VStack à la place de Form
                    Section(header: Text("Change Hour")) {
                        DatePicker("", selection: $viewModel.selectedDate, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                            .onAppear {
                                let formatter = DateFormatter()
                                formatter.dateFormat = "h:mm a"
                                if let date = formatter.date(from: viewModel.selectedHour) {
                                    viewModel.selectedDate = date
                                }
                            }
                    }
                    .font(.headline)

                    Button(action: {
                        viewModel.updateHour(for: $hour)
                        viewModel.isSheetPresented = false
                    }) {
                        Text("Edit the hour")
                            .frame(width: 180, height: 50)
                            .background(Color("MainGreen"))
                            .foregroundColor(.white)
                            .cornerRadius(33)
                            .bold()
                    }
                    .padding()
                }
                .navigationBarTitle("Change Hour", displayMode: .inline)
            }
        }


    }
}






