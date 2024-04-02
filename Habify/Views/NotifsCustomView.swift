//
//  NotifsCustomView.swift
//  Habify
//
//  Created by thiam mame diarra on 15/03/2024.
//

import SwiftUI

struct NotifsCustomView: View {
    @StateObject var morningViewModel: CustomPickerNotifsViewModel
    @StateObject var afternoonViewModel: CustomPickerNotifsViewModel
    @StateObject var nightViewModel: CustomPickerNotifsViewModel
    @State private var morningHour = "7:00 AM"
    @State private var eveningHour = "10:00 PM"
    @State private var afternoonHour = "1:00 PM"

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color("AppColorBackground")
                .edgesIgnoringSafeArea(.all)

            VStack {

                Text("Click to change the hour")
                    .foregroundColor(Color("AltColorText"))
                    .padding(15)
                VStack (spacing:10){
                    CustomPickerNotifs(viewModel: morningViewModel, icon: "sunrise.fill", isSelected: false, action: {
                        self.morningViewModel.selectedHour = morningHour
                        self.morningViewModel.isSheetPresented = true
                        if let components = NotifsViewModel.shared.convertTimeStringToComponents(time: morningHour) {
                            NotifsViewModel.shared.scheduleNotification(hour: components.hour, minute: components.minute, second: components.second, body: "This is your morning notification")
                            }
                    }, hour: $morningHour)
                    CustomPickerNotifs(viewModel: afternoonViewModel, icon: "moon.fill", isSelected: false, action: {
                        self.afternoonViewModel.selectedHour = afternoonHour
                        self.afternoonViewModel.isSheetPresented = true
                        if let components = NotifsViewModel.shared.convertTimeStringToComponents(time: afternoonHour) {
                            NotifsViewModel.shared.scheduleNotification(hour: components.hour, minute: components.minute, second: components.second, body: "This is your afternoon notification")
                            }
                    }, hour: $afternoonHour)
                    CustomPickerNotifs(viewModel: nightViewModel, icon: "sun.max.fill", isSelected: false, action: {
                        self.nightViewModel.selectedHour = eveningHour
                        self.nightViewModel.isSheetPresented = true
                        if let components = NotifsViewModel.shared.convertTimeStringToComponents(time: eveningHour) {
                            NotifsViewModel.shared.scheduleNotification(hour: components.hour, minute: components.minute, second: components.second, body: "This is your night notification")
                            }
                    }, hour: $eveningHour)
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
                    Text("Custom Notifs")
                        .font(.largeTitle)
                        .foregroundColor(Color("MainIconColor"))
                        .bold()
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct NotifsCustomView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NotifsCustomView(morningViewModel: CustomPickerNotifsViewModel(), afternoonViewModel: CustomPickerNotifsViewModel(), nightViewModel: CustomPickerNotifsViewModel())
        }
    }
}

