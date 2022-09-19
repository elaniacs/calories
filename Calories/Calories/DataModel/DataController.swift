//
//  DataController.swift
//  Calories
//
//  Created by Cáren Sousa on 15/09/22.
//

import Foundation
import CoreData


/*
 
 DataController será uma classe que vai agrupar as funções que permitirão manipular os dados

 CRUD: Create, Read(Ler tudo ou ler apenas um registro), Update, Delete
 
 Contexto?
 
 */

class DataController: ObservableObject {
    
                    // ajuda a gerenciar os objetos que serão salvos no Core Data
    let container = NSPersistentContainer(name: "FoodModel")
    
    /*Quando inicializa-se o container(NSPersistentContainer), é necessa´rio carregar os objetos do Core Data para poderem ser manipulados*/
    init() {
        container.loadPersistentStores {description, error in
            if let error = error {
                print("Erro ao carregar os dados \(error)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        
        do {
            try context.save()
        }
        catch {
            let error = error as NSError
            print("Erro ao salvar os dados no contexto \(error)")
        }
    }
    
    func update() {
        
    }
    
    func addFood(name: String, calories: Double, context: NSManagedObjectContext) {
        
        let food = Food(context: context)
        
        food.name = name
        food.calories = calories
        food.id = UUID()
        food.date = Date()
        
        save(context: context)
    }
    
    func editFood(foodOld: Food, name: String, calories: Double, context: NSManagedObjectContext) {
        
        foodOld.name = name
        foodOld.calories = calories
        foodOld.date = Date()
        
        save(context: context)
    }
}






