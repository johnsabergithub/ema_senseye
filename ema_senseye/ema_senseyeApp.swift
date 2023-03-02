//
//  ema_senseyeApp.swift
//  ema_senseye
//
//  Created by John Saber on 3/2/23.
//

import SwiftUI
import senseye_ios_sdk
@main
struct ema_senseyeApp: App {
    @Environment(\.scenePhase) var scenePhase
        var senseyeSDK: SenseyeSDK = SenseyeSDK(userId: "ema", taskIds: [.firstCalibration], databaseLocation: "ema_wellness")
        let initialBrightness = UIScreen.main.brightness

    var body: some Scene {
           WindowGroup {
               EntryView(senseyeSDK: senseyeSDK)
           }
           .onChange(of: scenePhase) { newScene in
               if newScene == .active {
                   DispatchQueue.main.async {
                       UIScreen.main.brightness = 1.0
                       UIApplication.shared.isIdleTimerDisabled = true
                   }
               } else {
                   DispatchQueue.main.async {
                       UIScreen.main.brightness = initialBrightness
                       UIApplication.shared.isIdleTimerDisabled = false
                   }
               }
           }
    }
}
