//
//  TimerView.swift
//  TimerApp
//
//  Created by singsys on 28/12/23.
//

import SwiftUI

struct TimerView: View {
    // MARK: - Variables Declaration
    
    @Binding var progress: Double
    @Binding var duration: TimeInterval

    var body: some View {
        ZStack {
           Circle()
                .stroke(lineWidth: 20)
                .opacity(0.08)
                .foregroundColor(Color.black)
                .frame(width: 250, height: 250)
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(270.0))
                .foregroundColor(Color.black)
                .frame(width: 250, height: 250)
            Text(duration.format(using: [.minute, .second]))
              .font(.title2.bold())
              .foregroundColor(Color.blue)
              .contentTransition(.numericText())
        }
    }
}

#Preview {
    TimerView(progress: .constant(0.4), duration: .constant(100))
}
