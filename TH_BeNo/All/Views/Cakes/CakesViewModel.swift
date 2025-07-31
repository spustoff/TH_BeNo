//
//  CakesViewModel.swift
//  TH_BeNo
//
//  Created by IGOR on 24/07/2025.
//

import SwiftUI
import CoreData

final class CakesViewModel: ObservableObject {
    
    @AppStorage("earned") var earned: Int = 0

    @Published var colors: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    @Published var curVcol: String = "1"
    @Published var curKcol: String = "1"
    @Published var curPcol: String = "1"

    @Published var isAdd: Bool = false
    @Published var isAddSale: Bool = false
    @Published var isDelete: Bool = false

    @Published var isDeleteSale: Bool = false
    @Published var isSettings: Bool = false
    @Published var isDetail: Bool = false
    @Published var isBack: Bool = false
    @Published var isChoose: Bool = false
    
    @Published var selCa: String = ""


    @Published var cVc: String = ""
    @Published var cPc: String = ""
    @Published var cKc: String = ""
    @Published var cName: String = ""
    @Published var cIng: String = ""
    @Published var cPrice: String = ""

    @Published var cakes: [CakeModel] = []
    @Published var selectedCake: CakeModel?

    func addCake() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "CakeModel", into: context) as! CakeModel

        loan.cVc = cVc
        loan.cPc = cPc
        loan.cKc = cKc
        loan.cName = cName
        loan.cIng = cIng
        loan.cPrice = cPrice

        CoreDataStack.shared.saveContext()
    }

    func fetchCakes() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CakeModel>(entityName: "CakeModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.cakes = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.cakes = []
        }
    }
    
    @Published var saVc: String = ""
    @Published var saPc: String = ""
    @Published var saKc: String = ""
    @Published var saClient: String = ""
    @Published var saNot: String = ""
    @Published var saPrice: String = ""
    @Published var saCName: String = ""
    @Published var saAmo: String = ""

    @Published var sales: [SalesModel] = []
    @Published var selectedSales: SalesModel?

    func addSale() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "SalesModel", into: context) as! SalesModel

        loan.saVc = saVc
        loan.saPc = saPc
        loan.saKc = saKc
        loan.saClient = saClient
        loan.saNot = saNot
        loan.saPrice = saPrice
        loan.saCName = saCName
        loan.saAmo = saAmo

        CoreDataStack.shared.saveContext()
    }

    func fetchSales() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<SalesModel>(entityName: "SalesModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.sales = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.sales = []
        }
    }
}

