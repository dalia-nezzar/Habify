//
//  MainView.swift
//  Habify
//
//  Created by nezzar dalia on 15/03/2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var habitsViewModel: HabitsViewModel
    @EnvironmentObject var user : User
    @EnvironmentObject var themeManager : ThemeManager

    
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                    
                        .environment(\.symbolVariants, .none)
                }
            StatisticsView()
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
        .environment(\.colorScheme, themeManager.colorScheme)
        .ignoresSafeArea(edges: .bottom)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(User())
            .environmentObject(HabitsViewModel())
            .environmentObject(ThemeManager())
    }
}

