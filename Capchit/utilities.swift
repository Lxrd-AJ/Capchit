//
//  utilities.swift
//  Capchit
//
//  Created by AJ Ibraheem on 03/12/2015.
//  Copyright © 2015 The Leaf. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    //returns a basic cap
    class func getExampleCap() -> Cap {
        let cap:Cap = Cap()
        cap.title = "This is a sample cap"
        cap.description = "Example so long, it makes you think of what you had for breakfast"
        cap.image = UIImage(named: "Classroom")
        cap.showPlusIcon = true
        return cap
    }
}