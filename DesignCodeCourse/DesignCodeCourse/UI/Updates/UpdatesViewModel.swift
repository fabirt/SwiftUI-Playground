//
//  UpdatesViewModel.swift
//  DesignCodeCourse
//
//  Created by Fabi Diartt on 9/04/21.
//

import Foundation

class UpdatesViewModel: ObservableObject {
    @Published var updates: [UpdateItem] = updatesData
    
    func addUpdate() {
        updates.append(UpdateItem(
                        title: "New Update",
                        imageName: "Card1",
                        body: "New update added",
                        date: Date()
        ))
    }
    
    func removeUpdate(at index: Int) {
        let removedItem = updates.remove(at: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.updates.insert(removedItem, at: index)
        }
    }
    
    func moveUpdate(from: IndexSet, to: Int) {
        updates.move(fromOffsets: from, toOffset: to)
    }
}
