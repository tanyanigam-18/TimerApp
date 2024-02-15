//
//  ContentView.swift
//  TimerApp
//
//  Created by singsys on 01/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var isTimerRunning = false
    @State var interval = TimeInterval()
    @State var startTime = Date()
    @State var totalDuration: TimeInterval = 2 * 60
    @State var duration: TimeInterval = 2 * 60
    @State var progress = 1.0
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            if isTimerRunning {
                TimerView(progress: $progress, duration: $duration)
            }
            Spacer()
            HStack(spacing: 24) {
                Button {
                    startTime = Date()
                    startTimer()
                } label: {
                    Text("Start")
                    Image(systemName: "stopwatch")
                }
                .timerButtonStyle(isValid: !isTimerRunning)
                .disabled(isTimerRunning)
                
                Button {
                   stopTimer()
                } label: {
                    Text("Stop")
                    Image(systemName: "stop.circle")
                }
                .timerButtonStyle(isValid: isTimerRunning)
                .disabled(!isTimerRunning)
            }
        }
        .padding()
        .onReceive(timer) { time in
          if (isTimerRunning) {
            interval = Date().timeIntervalSince(startTime)
            duration = totalDuration - interval
            progress = (duration / totalDuration)
              if duration <= 0 {
                  stopTimer()
              }
          }
        }
    }
    
    // MARK: - Custom Functions
    
    func startTimer() {
        self.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        isTimerRunning.toggle()
    }
    func resetTimer() {
      totalDuration = 120
      duration = 120
      progress = 1.0
    }
    func stopTimer() {
        self.timer.upstream.connect().cancel()
        resetTimer()
        isTimerRunning.toggle()
    }
}

#Preview {
    ContentView()
}
