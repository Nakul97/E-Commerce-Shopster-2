//
//  CartWishlist.swift
//  Shopster
//
//  Created by Nakul Sakhuja on 12/02/18.
//  Copyright © 2018 GetThisDone. All rights reserved.
//

import Foundation
import Firebase

class Cart{
    
    var cartProducts = [String]()
    
    init(){
        let users = FIRDatabase.database().reference().child("Users")
        let userId = FIRAuth.auth()?.currentUser?.uid
        let cart = users.child(userId!).child("Cart")
        cart.observe(.value, with: { (snapshot) in
                        self.cartProducts = snapshot.value as? [String] ?? []
                    })
    }
    
    
}

class Likes{
    
     var listProducts = [String]()
    
    init(){
        let users = FIRDatabase.database().reference().child("Users")
        let userId = FIRAuth.auth()?.currentUser?.uid
        let cart = users.child(userId!).child("Likes")
        cart.observe(.value, with: { (snapshot) in
            self.listProducts = snapshot.value as? [String] ?? []
        })
    }
    
}
