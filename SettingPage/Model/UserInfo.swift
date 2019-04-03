//
//  UserInfo.swift
//  SettingPage
//
//  Created by WY NG on 25/3/2019.
//  Copyright © 2019 lumanmann. All rights reserved.
//

import Foundation


class UserInfo {
    var name: String?
    var account: String?
    var password: String?
    var isEditable: Bool = false
    var favouriteFood = [String]()
    
    
    init() {
      
    }
    
    init(name: String? = nil, account: String? = nil, password: String? = nil, favouriteFood: [String]? = nil) {
        self.name = name
        self.account = account
        self.password = password
        if let foods = favouriteFood{
            self.favouriteFood = foods
        }
    }
    
    func removeFood(_ food:String) {
        for num in 0..<favouriteFood.count {
            if favouriteFood[num] == food {
                favouriteFood.remove(at: num)
                return
            }
        }
    }
    
    func printAll() {
        print("===")
        print(name ?? "No name" ,
              "\(self.account ?? "No account")",
            "\(self.password ?? "No password")",
            "\(isEditable)",
            separator: ", ", terminator: "\n")
        for food in favouriteFood {
            print(food)
        }
        print("===")
    }
    
    
}
