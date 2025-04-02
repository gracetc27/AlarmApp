//
//  AlarmListTests.swift
//  AlarmAppTests
//
//  Created by Grace couch on 02/04/2025.
//

import Testing
@testable import AlarmApp

struct AlarmListTests {

    @Test func addActionTest() async throws {
        let viewModel = AlarmListViewModel()
        #expect(viewModel.isActive == false)
        #expect(viewModel.currentAlarm == nil)


        let expectedIsActive = true
        let expectedCurrentAlarm: Alarm? = nil

        viewModel.addAction()

        #expect(viewModel.isActive == expectedIsActive)
        #expect(viewModel.currentAlarm == expectedCurrentAlarm)

    }

    @Test func editActionTest() async throws {
        let viewModel = AlarmListViewModel()
        #expect(viewModel.isActive == false)
        #expect(viewModel.currentAlarm == nil)
        let alarmToEdit = Alarm.DefaultAlarm()

        let expectedIsActive = true
        let expectedCurrentAlarm: Alarm? = alarmToEdit

        viewModel.editAction(alarm: alarmToEdit)

        #expect(viewModel.isActive == expectedIsActive)
        #expect(viewModel.currentAlarm == expectedCurrentAlarm)
    }

}
