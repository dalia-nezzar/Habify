import SwiftUI
import Charts



struct StatisticsView: View {
    @EnvironmentObject var habitsViewModel: HabitsViewModel
    @State private var selectedDayIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("AppColorBackground")
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    Color("AppColorBackground")
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        /*HStack {
                         Text("Select a day") // Affiche le numéro du jour
                         .padding(20)
                         .font(.system(size:18))
                         .foregroundColor(Color("MainIconColor"))
                         .bold()
                         Spacer()
                         Menu {
                         Picker("Select a date", selection: $selectedDayIndex) {
                         ForEach(Array(habitsViewModel.stats[0].dailyStats.enumerated()), id: \.offset) { index, dailyStat in
                         Text(dailyStat.date.formatted(date: .long, time: .omitted))
                         .tag(index)
                         }
                         }
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
                         .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)*/
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 5){
                                VStack(alignment: .leading, spacing: 0){
                                    Text("My Habits")
                                        .bold()
                                        .font(.system(size:20))
                                    Text("for today")
                                        .font(.system(size:20))
                                }
                                Text("\(habitsViewModel.totalHabitsDone()) out of \(habitsViewModel.totalHabits()) completed")
                                    .font(.system(size:13))
                            }
                            .padding(20)
                            Spacer()
                            
                            VStack {
                                Text(String(format: "%.0f%%", habitsViewModel.percentageOfHabitsDoneToday()))
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
                        .background(Color("WhiteRows"))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(color: Color.black.opacity(0.10), radius: 16, x: 0, y: 0)
                        
                        HStack {
                            ForEach(Period.allCases.filter { $0 != .all }, id: \.self) { period in
                                VStack {
                                    Image(systemName: period.iconPeriod)
                                        .resizable()
                                        .foregroundColor(period.colorsFilter)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .shadow(color: Color.black.opacity(0.20), radius: 16, x: 0, y: 0)
                                    VStack(alignment: .leading) {
                                        Text(String(format: "%.0f%%", habitsViewModel.percentageOfHabitsDoneForPeriod(in: period)))
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
                                .background(period.colorsHabit)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                                .padding(.vertical)
                            }
                        }
                        .frame(width: 319, height: 111)
                        
                        HStack{
                            VStack(alignment: .leading) {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(Color("MainIconColor"))
                                Text("\(habitsViewModel.daysSinceInstallation()) days")
                                    .font(.system(size: 32))
                                    .bold()
                                    .foregroundColor(Color("MainIconColor"))
                                Text("of habifying")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("MainIconColor"))
                                    .bold()
                            }
                            .frame(width: 152, height: 143)
                            .background(Color("WhiteRows"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Image(systemName: "checklist.checked")
                                    .resizable()
                                    .frame(width: 45, height: 45)
                                    .foregroundColor(Color("MainIconColor"))
                                Text("\(habitsViewModel.totalHabitsDoneSinceInstallation())")
                                    .font(.system(size: 32))
                                    .bold()
                                    .foregroundColor(Color("MainIconColor"))
                                Text("habits done")
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("MainIconColor"))
                                    .bold()
                            }
                            .frame(width: 152, height: 143)
                            .background(Color("WhiteRows"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        .frame(width: 319)
                    }
                    
                    Text("5-Days Statistics")
                        .font(.title2)
                        .foregroundColor(Color("AltColorText"))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 40)
                        .padding(.top, 20)
                        .padding(.bottom, -20)
                    
                    
                    BarChartView(data: habitsViewModel.getLastFiveDaysStats())
                }
            }
            .onAppear {
                habitsViewModel.updateLastFiveDaysStats()
            }
            
        }
        
    }

}


struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
            .environmentObject(HabitsViewModel())
    }
}
