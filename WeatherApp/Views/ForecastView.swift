//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                ForecastTile(data: WeatherMetricModel(image: "sunny_cloudy", title: "Tommorow", value: "20°"), background: AppColors.transparent)
                HStack(alignment: .center, spacing: 30) {
                    ForEach(WeatherMetricModel.mockData) { data in
                        VStack {
                            Image(data.image)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: 50, maxHeight: 50)
                                .padding(.bottom, 8)
                            Text(data.value)
                                .semiBoldFont(size: 14)
                        }
                        .padding(.bottom, 30)
                    }
                }
            }
            .background(AppColors.primary60)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
            
            ForEach(WeatherMetricModel.forecastData) {
                ForecastTile(data: $0)
            }.padding(.horizontal)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Next 7 Days")
                    .regularFont(size: 20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .foregroundColor(AppColors.text)
        .toolbarBackground(AppColors.orange, for: .navigationBar)
        .orangeBackgound()
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                ForecastView()
            }
        }
    }
}
