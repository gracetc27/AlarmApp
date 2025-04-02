//
//  ChooseAddEditAlarmTests.swift
//  AlarmAppTests
//
//  Created by Grace couch on 02/04/2025.
//

import Testing
@testable import AlarmApp

struct ChooseAddEditAlarmTests {

    @Test func initWithAlarmTest() async throws {
        let alarmToTest = Alarm.DefaultAlarm()

        let alarmViewModel = ChooseAddEditAlarmViewModel(alarmModel: alarmToTest)

        #expect(alarmViewModel.isNewAlarm == false)
        #expect(alarmViewModel.alarmModel == alarmToTest)
    }

    @Test func initWithoutAlarmTest() async throws {

        let alarmViewModel = ChooseAddEditAlarmViewModel(alarmModel: nil)
        let expectedAlarmTitle = "Climbing Session"
        let expectedAlarmSFSymbol = "dumbbell.fill"
        let expectedRepeats = false
        let expectedSound = SoundConstants.lagrima

        #expect(alarmViewModel.isNewAlarm == true)
        #expect(alarmViewModel.alarmModel.title == expectedAlarmTitle)
        #expect(alarmViewModel.alarmModel.activitySFSymbol == expectedAlarmSFSymbol)
        #expect(alarmViewModel.alarmModel.repeats == expectedRepeats)
        #expect(alarmViewModel.alarmModel.sounds == expectedSound)
    }

}
