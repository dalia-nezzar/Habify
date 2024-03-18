//
//  MainView.swift
//  Habify
//
//  Created by nezzar dalia on 15/03/2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var user : User
    @EnvironmentObject var habitsViewModel : HabitsViewModel
    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                        .environment(\.symbolVariants, .none)
                }
            AddView()
                .tabItem {
                    Label("Overview", systemImage: "chart.bar")
                        .environment(\.symbolVariants, .none)
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "slider.horizontal.3")
                        .environment(\.symbolVariants, .none)
                }

        }
        .accentColor(Color("TabViewColor"))
        .ignoresSafeArea(edges: .bottom)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(HabitsViewModel())
            .environmentObject(User())
    }
}
