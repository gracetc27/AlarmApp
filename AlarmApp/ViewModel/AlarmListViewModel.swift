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
    var currentIndex: Int? = nil

    func addAction() {
        currentIndex = nil
        isActive = true
    }
}

