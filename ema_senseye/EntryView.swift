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
    @Binding var cameFromUrl:URL
    
    //init() {
        //self.senseyeSDK = senseyeSDK
    //   }

       var body: some View {
        
           var senseyeSDK = SenseyeSDK(userId: cameFromUrl.path(), taskIds: [.firstCalibration], databaseLocation: "ema_wellness")
              senseyeSDK.senseyeTabView()
                  }
}
