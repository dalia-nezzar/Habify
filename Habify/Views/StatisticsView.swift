//
//  StatisticsView.swift
//  Habify
//
//  Created by thiam mame diarra on 21/03/2024.
//
import SwiftUI

struct StatisticsView: View {
    @StateObject var viewModel = StatisticsViewModel()
    @State private var selectedDayIndex = 0
    var statistics = Statistics()
    
    var lastFiveDaysRange: Range<Int> {
        0..<viewModel.lastFiveDays.count
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("AppBackground")
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    Color("AppBackground")
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        HStack {
                            Text(" \(viewModel.lastFiveDays[selectedDayIndex])")
                                .padding(20)
                                .font(.system(size:18))
                                .foregroundColor(Color("MainIconColor"))
                                .bold()
                            Spacer()
                            Menu {
                                // TODO: faire le menu des jours
                            } label: {
                                Image(systemName: "arrow.down.circle.fill")
                                    .foregroundColor(.white)
                                    .frame(width: 49, height: 49)
                                    .clipShape(Circle())
                                    .background(
                                        Circle()
                                            .fill(LinearGradient(gradient: Gradient(colors: [Color("GradientColor"), Color("MainGreen")]), startPoint: .top, endPoint: .bottom))
                                            .frame(width: 39, height: 39)
                                    )
                            }
                            .padding()
                            .foregroundColor(.blue)
                        }
                        
                        .frame(width: 319, height: 61)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 5){
                                VStack(alignment: .leading, spacing: 0){
                                    Text("My Habits")
                                        .bold()
                                        .font(.system(size:20))
                                    Text("for \(viewModel.lastFiveDays[selectedDayIndex])")
                                        .font(.system(size:20))
                                }
                                
                                Text("\(viewModel.habitsCompletedToday) of \(viewModel.totalHabits) completed")
                                    .font(.system(size:13))
                                
                            }
                            .padding(20)
                            Spacer()
                            
                            VStack {
                                Text("\(viewModel.completionPercentage, specifier: "%.f")%")
                                    .font(.system(size:18))
                                    .bold()
                                    .frame(width: 319, height: 61)
                                    .foregroundColor(.white)
                                    .frame(width: 49, height: 49)
                                    .clipShape(Circle())
                                    .background(
                                        Circle()
                                            .fill(LinearGradient(gradient: Gradient(colors: [Color("GradientColor"), Color("MainGreen")]), startPoint: .top, endPoint: .bottom))
                                            .frame(width: 80, height: 76)
                                    )
                                    .padding(30)
                            }
                            
                        }
                        .frame(width: 319, height: 111)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                        
                        HStack {
                            VStack {
                                Image(systemName: "sunrise.fill")
                                    .resizable()
                                    .foregroundColor(Color("filterMorning"))
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .shadow(color: Color.black.opacity(0.20), radius: 16, x: 0, y: 0)
                                VStack(alignment: .leading) {
                                    Text("\(viewModel.morningCompletionPercentage, specifier: "%.f")%")
                                        .foregroundColor(Color("MainIconColor"))
                                        .font(.system(size: 18))
                                        .bold()
                                        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                                    Text("completed")
                                        .font(.system(size: 13))
                                        .foregroundColor(Color("MainIconColor"))
                                        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                                }
                            }
                            .frame(width: 103, height: 103)
                            .background(Color("habitMorning"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                            Spacer()
                            
                            VStack {
                                Image(systemName: "sun.max.fill")
                                    .resizable()
                                    .foregroundColor(Color("filterAfternoon"))
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .shadow(color: Color.black.opacity(0.20), radius: 16, x: 0, y: 0)
                                VStack(alignment: .leading) {
                                    Text("\(viewModel.afternoonCompletionPercentage, specifier: "%.f")%")
                                        .foregroundColor(Color("MainIconColor"))
                                        .font(.system(size: 18))
                                        .bold()
                                        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                                    Text("completed")
                                        .font(.system(size: 13))
                                        .foregroundColor(Color("MainIconColor"))
                                        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                                }
                            }
                            .frame(width: 103, height: 103)
                            .background(Color("habitAfternoon"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                            Spacer()
                            
                            VStack {
                                Image(systemName: "moon.stars.fill")
                                    .resizable()
                                    .foregroundColor(Color("filterNight"))
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40, height: 40)
                                    .shadow(color: Color.black.opacity(0.20), radius: 16, x: 0, y: 0)
                                VStack(alignment: .leading) {
                                    Text("\(viewModel.nightCompletionPercentage, specifier: "%.f")%")
                                        .foregroundColor(Color("MainIconColor"))
                                        .font(.system(size: 18))
                                        .bold()
                                        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                                    Text("completed")
                                        .font(.system(size: 13))
                                        .foregroundColor(Color("MainIconColor"))
                                        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                                }
                            }
                            .frame(width: 103, height: 103)
                            .background(Color("habitNight"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        .frame(width: 319, height: 111)
                        
                        HStack{
                            // days
                            VStack(alignment: .leading) {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(Color("MainIconColor"))
                                Text("\(statistics.currentDay) days")
                                    .font(.system(size: 32))
                                    .bold()
                                    .foregroundColor(Color("MainIconColor"))
                                Text("of habifying")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("MainIconColor"))
                                    .bold()
                            }
                            .frame(width: 152, height: 143)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                            Spacer()
                            
                            //habits done
                            VStack(alignment: .leading) {
                                Image(systemName: "checklist.checked")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(Color("MainIconColor"))
                                Text("\(statistics.habitsDone)")
                                    .font(.system(size: 32))
                                    .bold()
                                    .foregroundColor(Color("MainIconColor"))
                                Text("habits done")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("MainIconColor"))
                                    .bold()
                            }
                            .frame(width: 152, height: 143)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        .frame(width: 319)
                        Button(action: {
                            // Code to advance to the next day
                            viewModel.advanceToNextDay()
                        }) {
                            Text("Next Day")
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("GradientColor"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding()
                        Spacer()
                    }
                    
                }
                .onAppear {
                    viewModel.updateStatistics()
                }
            }
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
