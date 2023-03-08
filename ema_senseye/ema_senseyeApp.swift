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
    //var senseyeSDK: SenseyeSDK = SenseyeSDK(userId: "john2", taskIds: [.firstCalibration], databaseLocation: "ema_wellness")
    //var senseyeSDK = SenseyeSDK()
    @State var launchURL:URL = URL(fileURLWithPath: "https://exampleplacehoder.com")
    let initialBrightness = UIScreen.main.brightness

    var body: some Scene {
           WindowGroup {
               //EntryView(senseyeSDK: senseyeSDK).onOpenURL(perform: {url in print(url.absoluteString)})}.onChange(of: scenePhase) { newScene in
               EntryView(cameFromUrl: $launchURL).onOpenURL(perform: {url in launchURL = url})}.onChange(of: scenePhase) { newScene in
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
