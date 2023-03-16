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
    //     @Binding var cameFromUrl:URL
    //    @Binding var urlLoaded:Bool
    
    //    var body: some View {
    //        if self.urlLoaded
    //        {
    //            var link = cameFromUrl.absoluteString
    //            let PatientId = link.replacingOccurrences(of: "emasenseye://", with: "")
    //            var senseyeSDK = SenseyeSDK(userId: PatientId, taskIds: [.firstCalibration], databaseLocation: "ema_wellness")
    //            senseyeSDK.senseyeTabView()
    //            //Text("Came from \(link2)")//
    var senseyeSDK: SenseyeSDK
     init(senseyeSDK: SenseyeSDK) {
         self.senseyeSDK = senseyeSDK
     }

     var body: some View {
         senseyeSDK.senseyeTabView()
     }
    
}
