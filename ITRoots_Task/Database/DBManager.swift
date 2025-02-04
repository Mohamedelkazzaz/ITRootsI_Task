//
//  DBManager.swift
//  ITRoots_Task
//
//  Created by Mohamed Elkazzaz on 04/02/2025.
//

import Foundation
import CoreData


class DBManager{
    static let sharedInstanse = DBManager()
    private init(){}
}

extension DBManager{
    
    
    func addData(appDelegate: AppDelegate,apiModels: [ApiModel]){
       
        let managedContext = appDelegate.persistentContainer.viewContext

        if let entity = NSEntityDescription.entity(forEntityName: "Data", in: managedContext){

            for apiModel in apiModels {
                let newEntity = Data(context: managedContext)
                newEntity.title = apiModel.title
                newEntity.body = apiModel.body
                   }
//            let data = NSManagedObject(entity: entity, insertInto: managedContext)
//            data.setValue(title, forKey: "title")
//            data.setValue(body, forKey: "body")
            do {
                try managedContext.save()
            }catch let error as NSError {
                print("Error in saving")
                print(error.localizedDescription)
            }
        }
    }

    func fetchData(appDelegate: AppDelegate) -> [Data]{
        /*
         Steps to save data to an entity in core data:
            1- get the shared application delegate
            2- get the managed object context
            3- Create the Fetch Request using th eentity Name and the NSManagedObject
            4- Add Predicate as a condition for fetching the data (optional)
            5- set the predicate of the fetchRequet with your predicate
            6- try fetching the records that have the predicate by  managedContext
            7- handle the error using do and catch

         */

        var fetchedList : [Data] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Data")

        do{
            fetchedList = try managedContext.fetch(fetchRequest) as! [Data]
            print(fetchedList)
        }catch let error as NSError {
            print("Error in saving")
            print(error.localizedDescription)
        }

        return fetchedList
    }

    
}
