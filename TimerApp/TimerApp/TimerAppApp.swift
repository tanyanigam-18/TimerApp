//
//  TimerAppApp.swift
//  TimerApp
//
//  Created by singsys on 28/12/23.
//

import SwiftUI

@main
struct TimerAppApp: App {
    var body: some Scene {
        WindowGroup {
            TimerView(progress: .constant(0.4), duration: .constant(100))
        }
    }
}
