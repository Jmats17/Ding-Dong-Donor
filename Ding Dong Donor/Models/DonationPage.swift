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
    let creationDate: Date
    var dictValue: [String : Any] {
        let createdAgo = creationDate.timeIntervalSince1970
        
        return [
                "created_at" : createdAgo,
                "page_name" : name,
                "creator" : creator,
                "current_amt_raised" : currentAmtRaised
        
        ]
    }
    
    init(name : String, creator : String, currentAmtRaised : Int) {
        self.name = name
        self.creator = creator
        self.currentAmtRaised = currentAmtRaised
        self.creationDate = Date()

    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let pageName = dict["page_name"] as? String,
            let createdAgo = dict["created_at"] as? TimeInterval,
            let creator = dict["creator"] as? String,
            let currentAmtRaised = dict["current_amt_raised"] as? Int
            else { return nil }
        
        self.key = snapshot.key
        self.name = pageName
        self.creator = creator
        self.currentAmtRaised = currentAmtRaised
        self.creationDate = Date(timeIntervalSince1970: createdAgo)
    }
    
    

    
    
}
