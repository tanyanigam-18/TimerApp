//
//  Extension.swift
//  TimerApp
//
//  Created by singsys on 28/12/23.
//

import SwiftUI

extension TimeInterval {
    func format(using units: NSCalendar.Unit) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? ""
    }
}

extension View {
    func timerButtonStyle(isValid: Bool = true) -> some View {
        self
            .font(.title2)
            .padding()
            .background(Color.pink.opacity(isValid ? 1.0 : 0.2))
            .foregroundColor(Color.black)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}
