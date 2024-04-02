//
//  BarChartView.swift
//  Habify
//
//  Created by thiam mame diarra on 02/04/2024.
//

import SwiftUI
import Charts

struct BarChartView: View {
    let data: [(date: Date, habitsDone: Int)]
 
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .frame(width:360, height:200)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.1), radius: 7, x:0, y:0)
                
                Chart {
                            ForEach(data, id: \.date) { item in
                                BarMark(
                                    x: .value("Day", item.date, unit: .day),
                                    y: .value("Habits Done", item.habitsDone)
                                )
                                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("GradientColor"), Color("MainGreen")]), startPoint: .top, endPoint: .bottom))
                                .cornerRadius(15)
                            }

                        }
                        .chartXAxisLabel("Days")
                        .chartYAxisLabel("Finished habits")
                        .chartYAxis {
                            AxisMarks(position: .leading)
                        }
                        .chartXAxis {
                            AxisMarks(values: .automatic(desiredCount: 5))
                        }
                        .background(.clear)
                        .padding(40)
            }
        }
    }
}
