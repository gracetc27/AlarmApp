//
//  ChooseAddEditAlarmViewModel.swift
//  AlarmApp
//
//  Created by Grace couch on 26/03/2025.
//

import SwiftUI

@Observable
class ChooseAddEditAlarmViewModel {
    var alarmModel: Alarm = .DefaultAlarm()
    var alarmViewType: AlarmViewType = .standard
    let currentAlarmIndex: Int? = nil
}

