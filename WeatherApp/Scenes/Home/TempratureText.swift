//
//  TempratureText.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct TempratureText: View {
    let degrees: String
    let size: CGFloat
    
    init(degrees: String, size: CGFloat = 100) {
        self.degrees = degrees
        self.size = size
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 2) {
            Text(degrees)
                .boldFont(size:
                            size)
            Text("°C")
                .regularFont(size: 14)
        }
    }
}

struct InlineTempratureText: View {
    let degrees: String
    let size: CGFloat
    
    init(degrees: String, size: CGFloat = 14) {
        self.degrees = degrees
        self.size = size
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(degrees)°")
                .boldFont(size:
                            size)
        }
    }
}

struct TempratureText_Previews: PreviewProvider {
    static var previews: some View {
        TempratureText(degrees: "19")
            .orangeBackgound()
    }
}
