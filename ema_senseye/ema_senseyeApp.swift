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

    @State var activeTab = 0
    @StateObject var viewModel: SessionViewModel = SessionViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $activeTab, content: {
                LoadingView().tag(0)
                EntryView().tag(1).onAppear {
                    UIApplication.shared.isIdleTimerDisabled = true
                }
            }).onOpenURL { url in
                let patientId = URLComponents(url: url, resolvingAgainstBaseURL: true)?.host ?? "blank"
                viewModel.currentPatientId = patientId
                activeTab = 1
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            .edgesIgnoringSafeArea(.all)
            .environmentObject(viewModel)
        }
    }
    
}
