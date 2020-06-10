//
//  Order.swift
//  Take&GoCoffe
//
//  Created by andrey on 15.05.2020.
//  Copyright © 2020 Andrey Mescheryakov. All rights reserved.
//

import Foundation

class Order: Identifiable {
    
    var id: String!
    var customerId: String!
    var orderItems: [Drink] = []
    var amount: Double!
    var customerName: String!
    var isCompleted: Bool!
    
    func saveOrderToFirestore() {
        
        FirebaseReference(.Order).document(self.id).setData(orderDictionaryFrom(self)) {
            error in
            
            if error != nil {
                print("error saving order to firestore: ", error!.localizedDescription)
            }
        }
    }
}


func orderDictionaryFrom(_ order: Order) -> [String : Any] {
    
    var allDrinkIds: [String] = []
    
    for drink in order.orderItems {
        allDrinkIds.append(drink.id)
    }
    
    return NSDictionary(objects: [order.id,
                                  order.customerId,
                                  allDrinkIds,
                                  order.amount,
                                  order.customerName,
                                  order.isCompleted
                                ],
                        forKeys: [kID as NSCopying,
                                  kCUSTOMERID as NSCopying,
                                  kDRINKIDS as NSCopying,
                                  kAMOUNT as NSCopying,
                                  kCUSTOMERNAME as NSCopying,
                                  kISCOMPLETED as NSCopying
    ]) as! [String : Any]
}
