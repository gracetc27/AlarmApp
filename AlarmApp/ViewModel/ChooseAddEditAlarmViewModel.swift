//
//  ChooseAddEditAlarmViewModel.swift
//  AlarmApp
//
//  Created by Grace couch on 26/03/2025.
//

import SwiftUI

@Observable
class ChooseAddEditAlarmViewModel {
    var alarmModel: Alarm
    var alarmViewType: AlarmViewType = .standard
    let isNewAlarm: Bool

    init(alarmModel : Alarm?) {
        if let alarmModel {
            self.alarmModel = alarmModel
            self.isNewAlarm = false
        } else {
            self.alarmModel = .DefaultAlarm()
            self.isNewAlarm = true
        }
    }
}

