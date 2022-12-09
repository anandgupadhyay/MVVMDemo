//
//  Developer.swift
//  Developer
//
//  Created by Anand 9/12/22
//  Copyright © 2022 Anand All rights reserved.
//

import Foundation

struct Developer {
    var name = ""
    var joiningDate = Date()
    var income = "INR0.0"
    var isAvilable = false
    var location = ""
    var image = ""
    var rating = 0.0
    
    init(data: [String: Any]) {
        name = data["name"] as! String
        joiningDate = data["joiningDate"] as! Date
        income = data["income"] as! String
        isAvilable = data["isAvilable"] as! Bool
        location = data["location"] as! String
        image = data["image"] as! String
        rating = data["rating"] as! Double
    }
}


