//
//  HomeView.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import CoreLocation
import SwiftUI

@MainActor
struct HomeView: View {
    @EnvironmentObject private var viewModel: WeatherDetailsViewModel

    var body: some View {
        ZStack {
            if viewModel.isBusy && !viewModel.hasData {
                ProgressView()
                    .frame(width: 50, height: 50)
                    .scaleEffect(viewModel.isBusy ? 1 : 0)
                    .animation(.easeInOut, value: viewModel.isBusy)
            }
            if viewModel.hasData {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        HomeLocationHeader()
                        TempratureHighlight()
                        ForEach(viewModel.current.metricsList) {
                            WeatherMetricTile(data: $0)
                        }
                    }
                    .padding(.horizontal)
                    GeometryReader { _ in
                        Text("Hourly Forecast")
                            .padding()
                            .padding(.bottom, 10)
                            .regularFont(size: 15)
                    }
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            ForEach(viewModel.current.hourlyForecast) {
                                TempratureForecastPill(forecast: $0)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .scrollIndicators(.hidden)
                    .padding(.vertical, 20)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: ForecastView()) {
                    HStack {
                        Text("Weather Forecast")
                            .regularFont(size: 15)
                        Image(systemName: "chevron.right")
                            .regularFont(size: 15)
                    }
                    .scaleEffect(viewModel.hasData ? 1 : 0)
                    .animation(.interpolatingSpring(stiffness: 5, damping: 2).repeatCount(2, autoreverses: false), value: viewModel.hasData)
                }
            }
        }
        .toolbar {
            if (!viewModel.isBusy && !viewModel.hasData) {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        Task {
                            await viewModel.getCurrentLocationWeather(force: true)
                        }
                    } label: {
                        HStack {
                            Image(systemName: "repeat")
                                .regularFont(size: 15)
                            Text("Retry")
                                .regularFont(size: 15)
                            
                        }
                    }
                }
            }
        }
        .refreshable {
            Task {
                await viewModel.getCurrentLocationWeather(force: true)
            }
        }
        .toolbarBackground(AppColors.orange, for: .navigationBar)
        .orangeBackgound()
        .task {
            await viewModel.getCurrentLocationWeather()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(WeatherDetailsViewModel())
        }
    }
}

