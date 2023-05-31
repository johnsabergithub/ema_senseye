//
//  EntryView.swift
//  ema_senseye
//
//  Created by John Saber on 3/2/23.
//

import Foundation

import SwiftUI
import senseye_ios_sdk

struct EntryView: View {
    
    @EnvironmentObject var viewModel: SessionViewModel

    var body: some View {
        if (viewModel.currentPatientId != "blank") {
            SenseyeSDK(userId: viewModel.currentPatientId, taskIds: [.firstCalibration], shouldCollectSurveyInfo: false, requiresAuth: false, databaseLocation: "ema_wellness", shouldUseFirebaseLogging: false).senseyeTabView()
        } else {
            Text("Need a valid patient ID...\(viewModel.currentPatientId)")
        }
    }
    
}
