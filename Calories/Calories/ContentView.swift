//
//  ContentView.swift
//  Calories
//
//  Created by Cáren Sousa on 15/09/22.
//

import SwiftUI

/*
 @Environment -> serve para instanciar uma variável que está global na nossa aplicação.
 Ex.: O gerenciador de objetos do contexto banco de dados
 
 @FetchRequest é um mecanismo que permite consultar os objetos que estão armazenados no CoreData, inclusive com ordenação
 
 SorteDescriptor serve para descrever como vc quer ordenar os dados.
 */

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)])
    var food: FetchedResults<Food>
    
    @State var isAddView: Bool = false
    @State var isEditView: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("\(Int(getTotalCalories())) calorias totais")
                    .foregroundColor(.gray)
                    .padding()
                
                List {
                    ForEach(food) { food in
                        FoodRowView(food: food, isEditView: $isEditView)
                    }
                }
                
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            isAddView = true
                        } label: {
                            Label("add Label", systemImage: "plus.circle")
                        }
                    }
                }
                .sheet(isPresented: $isAddView) {
                    AddFoodView()
                }
            }
        }
    }
    
    func getTotalCalories() -> Double {
        return 0.0
    }
}


struct FoodRowView: View {
    
    @State var food: Food
    @Binding var isEditView: Bool
    
    var body: some View {
        HStack {
            Text(food.name ?? "")
            Spacer()
            Button("Edit") {
                isEditView = true
            }
            .foregroundColor(.red)
            .sheet(isPresented: $isEditView) {
                EditFoodView(name: food.name ?? "", calories: food.calories, food: food)
            }
        }
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
