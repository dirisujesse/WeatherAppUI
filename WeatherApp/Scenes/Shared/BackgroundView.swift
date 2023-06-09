//
//  BackgroundView.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(stops: [.init(color: .appOrange, location: 0), .init(color: .burntOrange, location: 1)], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
