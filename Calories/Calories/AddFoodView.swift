//
//  AddFoodView.swift
//  Calories
//
//  Created by Cáren Sousa on 16/09/22.
//

import SwiftUI

struct AddFoodView: View {
    
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var name : String = ""
    @State var calories : Double = 0.0
    
    var body: some View {
        
        AddEditFoodView(name: $name, calories: $calories, buttonCancel: {  presentation.wrappedValue.dismiss()}) {
            if !name.isEmpty{
                DataController().addFood(name: name, calories: calories, context: managedObjectContext )
                presentation.wrappedValue.dismiss()
            }
        }
    }
}


struct AddEditFoodView: View {



    @Binding var name: String
    @Binding var calories: Double
    @State var buttonCancel: () -> Void
    @State var buttonAction: () -> Void
    
    var body: some View {

        
        Form {
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
                        buttonAction()
                    }.buttonStyle(BorderlessButtonStyle())
                    Spacer()
                    Button("Cancel"){
                      buttonCancel()
                    }.buttonStyle(BorderlessButtonStyle())
                }
            }
        }
    }
}




//struct AddFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddFoodView()
//    }
//}


