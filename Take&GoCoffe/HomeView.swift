//
//  ContentView.swift
//  Take&GoCoffe
//
//  Created by andrey on 04.05.2020.
//  Copyright © 2020 Andrey Mescheryakov. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var drinkListener = DrinkListener()

    var categories: [String : [Drink]] {
        
        .init(
            grouping: drinkData,
            by: {$0.category.rawValue}
        )
    }
    
    var body: some View {
        
        NavigationView {
            
            List(categories.keys.sorted(), id: \String.self) {
                key in
                
                DrinkRow(categoryName: "\(key) Drink".uppercased(), drinks: self.categories[key]!)
                    .frame(height: 320)
                    .padding(.top)
                    .padding(.bottom)
                
            }

            .navigationBarTitle(Text("Take&Go"))
            .navigationBarItems(leading:
                
                Button(action: {
                        //code
                        print("log out")
                        createMenu()
                    }, label: {
                        Text("Log Out")
                })
                
                , trailing:
                
                Button(action: {
                    //code
                    print("basket")
                    
                }, label: {
                    Image("basket")
            })
            )
    
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
