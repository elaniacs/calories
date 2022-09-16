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

class DataController {
    
    func save(context: NSManagedObjectContext) {
        
        do {
            try context.save()
        }
        catch {
            let error = error as NSError
            print("Erro ao salvar os dados do contexto \(error)")
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
    
    func editFood() {
        
    }
}


