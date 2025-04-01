//
//  AlarmListView.swift
//  AlarmApp
//
//  Created by Grace couch on 07/03/2025.
//

import SwiftUI

struct AlarmListView: View {
    @Environment(LocalNotificationManager.self) var localNotificationManager

    @State private var alarmListVM = AlarmListViewModel()


    var body: some View {
        NavigationStack {
            List {
                ForEach(localNotificationManager.alarmViewModels.indices, id: \.self) { index in
                    AlarmRowButtonView(index: index, currentIndex: $alarmListVM.currentIndex, isActive: $alarmListVM.isActive)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle(LocalizedStringKey("Alarm List"))
            .sheet(isPresented: $alarmListVM.isActive) {
                ChooseAddEditAlarmView(currentAlarmIndex: alarmListVM.currentIndex)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        alarmListVM.addAction()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            localNotificationManager.removeRequest(id: localNotificationManager.alarmViewModels[index].id )
        }
    }
}

#Preview {
    AlarmListView()
        .environment(LocalNotificationManager())
}
