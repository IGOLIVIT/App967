//
//  HomeViewModel.swift
//  App967
//
//  Created by IGOR on 22/10/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @Published var actives: [String] = ["High", "Middle", "Low"]
    @Published var currentActive: String = "High"
    
    @Published var periods: [String] = ["Week", "Month"]
    @Published var currentPeriod: String = "Week"

    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var stSocName: String = ""
    @Published var stTotSub: String = ""
    @Published var stYAct: String = ""
    @Published var stSubFW: String = ""
    @Published var stWDisp: String = ""
    @Published var stLikesFW: String = ""
    @Published var stComFW: String = ""
    @Published var stSubFM: String = ""
    @Published var stMDisp: String = ""
    @Published var stLikesFM: String = ""
    @Published var stComFM: String = ""

    @Published var statistics: [StatModel] = []
    @Published var selectedStat: StatModel?

    func addStat() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "StatModel", into: context) as! StatModel

        loan.stSocName = stSocName
        loan.stTotSub = stTotSub
        loan.stYAct = stYAct
        loan.stSubFW = stSubFW
        loan.stWDisp = stWDisp
        loan.stLikesFW = stLikesFW
        loan.stComFW = stComFW
        loan.stSubFM = stSubFM
        loan.stMDisp = stMDisp
        loan.stLikesFM = stLikesFM
        loan.stComFM = stComFM

        CoreDataStack.shared.saveContext()
    }

    func fetchStat() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<StatModel>(entityName: "StatModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.statistics = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.statistics = []
        }
    }
}

