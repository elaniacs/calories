//
//  AddFoodView.swift
//  Calories
//
//  Created by Cáren Sousa on 16/09/22.
//

import SwiftUI

struct AddFoodView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentation
    
    @State var name : String = ""
    @State var calories : Double = 0.0
    
    var body: some View {
        
        Form{
            Section{
                TextField("Insert food name", text: $name )
                    .textFieldStyle(.roundedBorder)
                                .padding()
                
                VStack{
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 1...3000, step: 10 )
                }.padding()
                
                HStack{
                    Button("Submit"){
                        if !name.isEmpty{
                            DataController().addFood(name: name, calories: calories, context: managedObjectContext )
                            presentation.wrappedValue.dismiss()
                        }
                    }
                    Spacer()
                    Button("Cancel"){
                            presentation.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}




//
//struct AddFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddFoodView()
//    }
//}
//
//
