//
//  SplashScreenTests.swift
//  SplashScreenTests
//
//  Created by Grace couch on 25/02/2025.
//

import Testing
@testable import AlarmApp

struct SplashScreenTests {

    @Test func animationActionTest() async throws {
        let viewModel = SplashScreenViewModel()
        #expect(viewModel.opacity == 0.7)
        #expect(viewModel.fontSize == 12.0)

        let expectedOpacity = 1.0
        let expectedFontSize = 36.0

        viewModel.animationAction()

        #expect(viewModel.opacity == expectedOpacity)
        #expect(viewModel.fontSize == expectedFontSize)
    }

}
