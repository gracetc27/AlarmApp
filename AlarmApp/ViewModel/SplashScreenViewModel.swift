//
//  SplashScreenViewModel.swift
//  AlarmApp
//
//  Created by Grace couch on 26/03/2025.
//
import SwiftUI


@Observable
class SplashScreenViewModel {
    var isActive = false
    private(set) var opacity = 0.7
    private(set) var fontSize = 12.0

    func animationAction() {
        opacity = 1.0
        fontSize = 36.0
    }
}
