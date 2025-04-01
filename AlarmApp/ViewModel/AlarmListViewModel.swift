//
//  AlarmListViewModel.swift
//  AlarmApp
//
//  Created by Grace couch on 26/03/2025.
//

import SwiftUI

@Observable
class AlarmListViewModel {
    var isActive = false
    var currentAlarm: Alarm? = nil

    func addAction() {
        currentAlarm = nil
        isActive = true
    }
}

