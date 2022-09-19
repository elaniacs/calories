//
//  EditFoodView.swift
//  Calories
//
//  Created by Cáren Sousa on 19/09/22.
//

import SwiftUI

struct EditFoodView: View {
    
    @State var name : String = ""
    @State var calories : Double = 0.0
    var food: Food
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var managedObjectContext

    
    var body: some View {
        AddEditFoodView(name: $name, calories: $calories, buttonCancel: {  presentation.wrappedValue.dismiss()}) {
            if !name.isEmpty{
                DataController().editFood(foodOld: food, name: name, calories: calories, context: managedObjectContext)
                presentation.wrappedValue.dismiss()
            }
        }
    }
}

//struct EditFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditFoodView()
//    }
//}
