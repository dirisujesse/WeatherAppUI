//
//  BackgroundStyles.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct OrangeBackground: ViewModifier {
    
    func body(content: Content) -> some View {
        ZStack {
            BackgroundView()
            content
        }
    }
}

extension View {
    func orangeBackgound() -> some View {
        self.modifier(OrangeBackground())
    }
}
