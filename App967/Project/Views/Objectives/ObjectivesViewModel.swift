//
//  ObjectivesViewModel.swift
//  App967
//
//  Created by IGOR on 23/10/2024.
//

import SwiftUI
import CoreData

final class ObjectivesViewModel: ObservableObject {
    
    @Published var actives: [String] = ["High", "Middle", "Low"]
    @Published var currentActive: String = "High"
    
    @Published var periods: [String] = ["Week", "Month"]
    @Published var currentPeriod: String = "Week"

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var taNet: String = ""
    @Published var taDate: Date = Date()
    @Published var taTime: Date = Date()
    @Published var taDescr: String = ""
    @Published var taName: String = ""

    @Published var tasks: [TaskModel] = []
    @Published var selectedTask: TaskModel?

    func addTask() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TaskModel", into: context) as! TaskModel

        loan.taNet = taNet
        loan.taDate = taDate
        loan.taTime = taTime
        loan.taDescr = taDescr
        loan.taName = taName

        CoreDataStack.shared.saveContext()
    }

    func fetchTasks() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TaskModel>(entityName: "TaskModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.tasks = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.tasks = []
        }
    }
}
