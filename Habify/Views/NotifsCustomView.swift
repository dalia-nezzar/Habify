//
//  NotifsCustomView.swift
//  Habify
//
//  Created by thiam mame diarra on 15/03/2024.
//

import SwiftUI

struct NotifsCustomView: View {
    @EnvironmentObject var morningViewModel: CustomPickerNotifsViewModel
    @EnvironmentObject var afternoonViewModel: CustomPickerNotifsViewModel
    @EnvironmentObject var nightViewModel: CustomPickerNotifsViewModel
    @State private var morningHour = "7:00 AM"
    @State private var eveningHour = "10:00 PM"
    @State private var afternoonHour = "1:00 PM"
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            ZStack {
                Color("AppBackground")
                    .edgesIgnoringSafeArea(.all)

                VStack {

                    Text("Click to change the hour")
                        .foregroundColor(Color("AltColorText"))
                        .padding(15)
                    VStack (spacing:10){
                        CustomPickerNotifs(viewModel: CustomPickerNotifsViewModel(), icon: "sunrise.fill", isSelected: true, action: {
                            self.morningViewModel.selectedHour = morningHour
                            self.morningViewModel.isSheetPresented = true
                            if let components = NotificationManager.shared.convertTimeStringToComponents(time: morningHour) {
                                    NotificationManager.shared.scheduleNotification(hour: components.hour, minute: components.minute, second: components.second, body: "This is your morning notification")
                                }
                        }, hour: $morningHour)
                        CustomPickerNotifs(viewModel: CustomPickerNotifsViewModel(), icon: "moon.fill", isSelected: false, action: {
                            self.afternoonViewModel.selectedHour = eveningHour
                            self.afternoonViewModel.isSheetPresented = true
                            if let components = NotificationManager.shared.convertTimeStringToComponents(time: morningHour) {
                                    NotificationManager.shared.scheduleNotification(hour: components.hour, minute: components.minute, second: components.second, body: "This is your afternoon notification")
                                }
                        }, hour: $eveningHour)
                        CustomPickerNotifs(viewModel: CustomPickerNotifsViewModel(), icon: "sun.max.fill", isSelected: false, action: {
                            self.nightViewModel.selectedHour = afternoonHour
                            self.nightViewModel.isSheetPresented = true
                            if let components = NotificationManager.shared.convertTimeStringToComponents(time: morningHour) {
                                    NotificationManager.shared.scheduleNotification(hour: components.hour, minute: components.minute, second: components.second, body: "This is your night notification")
                                }
                        }, hour: $afternoonHour)
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
            NotifsCustomView()
                .environmentObject(CustomPickerNotifsViewModel())
        }
    }
}

