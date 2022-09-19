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
        Form{
            Section{
                TextField(food.name ?? "", text: $name )
                    .textFieldStyle(.roundedBorder)
                                .padding()
                
                VStack{
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 1...3000, step: 10 )
                }.padding()
                
                HStack{
                    Button("Submit"){
                        if !name.isEmpty{
                            DataController().editFood(foodOld: food, name: name, calories: calories, context: managedObjectContext)
                            presentation.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}

//struct EditFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditFoodView()
//    }
//}
