//
//  ContentView.swift
//  Habify
//
//  Created by nezzar dalia on 13/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var period: Period = .all
    
    @State private var isAllSelected = true
    
    @State private var filterState: Bool? = nil
    
    @EnvironmentObject var habitsViewModel : HabitsViewModel
    
    @EnvironmentObject var user: User

    
   var body: some View {
        NavigationView {
           ZStack {
               Color("AppColorBackground")
                   .edgesIgnoringSafeArea(.all)
                   VStack {
                       VStack(alignment: .leading) {
                           Text("Hi,")
                               .font(.title3)
                               .foregroundStyle(Color(.gray))
                               .bold()
                           Text(user.nameUser)
                               .font(.title)
                               .bold()
                               .foregroundColor(Color("MainIconColor"))
                       }
                       .frame(maxWidth: .infinity, alignment: .leading)
                       .padding()
                       
                       HStack(spacing: 5) {
                           CustomPickerHome(icon: Period.all.iconPeriod, isSelected: isAllSelected, action: {
                               isAllSelected = true
                               period = .all
                           })
                           ForEach(Period.allCases.filter({ $0 != .all }), id: \.self) { periodValue in
                               CustomPickerHome(icon: periodValue.iconPeriod, isSelected: period == periodValue, action: {
                                   isAllSelected = false
                                   period = periodValue
                               })
                           }
                       }
                       
                       Picker("Filter", selection: $filterState) {
                           Text("All").tag(Optional<Bool>.none)
                           Text("Done").tag(Optional<Bool>(true))
                           Text("Unfinished").tag(Optional<Bool>(false))
                       }
                       .pickerStyle(SegmentedPickerStyle())
                       .frame(width: 300)
                       .padding()
                  
                       ScrollView {
                           ForEach(habitsViewModel.habits) { habit in
                               if (habit.period == period || period == .all) && (filterState == nil || (habit.state == filterState)) {
                                   RowView(habits: habit)
                                       .onTapGesture {
                                           habitsViewModel.updateItem(habit:habit)
                                       }
                                   
                               }
                           }
                       }
                       .shadow(color: Color.black.opacity(0.20), radius: 16, x: 0, y: 0)


                       Spacer()
                       .toolbar {
                           ToolbarItem(placement: .navigationBarTrailing) {
                               NavigationLink(destination: AddView()) {
                                   Image(systemName: "plus.circle.fill")
                                       .resizable()
                                       .frame(width: 39, height: 39)
                                       .aspectRatio(contentMode: .fit)
                                       .foregroundColor(Color("MainIconColor"))
                               }
                           }
                       }
                       
                   }
           }
       }
   }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HabitsViewModel())
            .environmentObject(User())
        
    }
}
