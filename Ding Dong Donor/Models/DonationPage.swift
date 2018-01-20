//
//  DonationPage.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/19/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class DonationPage  {
   
    var key: String?
    var name : String
    var creator : String
    var currentAmtRaised : Int
    //var qrCode : UIImage?
    let imageURL: String
    let creationDate: Date
    var dictValue: [String : Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        
        return ["image_url" : imageURL,
                "created_at" : createdAgo,
                "page_name" : name,
                "creator" : creator,
                "current_amt_raised" : currentAmtRaised
        
        ]
    }
    
    init(name : String, creator : String, currentAmtRaised : Int, imageURL : String) {
        self.name = name
        self.creator = creator
        self.currentAmtRaised = currentAmtRaised
        self.imageURL = imageURL
        self.creationDate = Date()

    }
    
    
    

    
    
}
