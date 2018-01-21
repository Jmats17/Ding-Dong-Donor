//
//  CreatePageService.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

struct CreatePageService {
    
    
//    static func create(for image: UIImage, name : String, creator : String, currentAmtRaised : Int) {
//        let imageRef = StorageReference.newPostImageReference()
//        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
//            guard let downloadURL = downloadURL else {
//                return
//            }
//
//            let urlString = downloadURL.absoluteString
//            create(forURLString: urlString, name: name, creator: creator, currentAmtRaised: currentAmtRaised)
//        }
//    }
    
    static func updateAmount(page : DonationPage,ref : String,currentAmtRaised : Int) {
 
        let newAmt = Int(page.currentAmtRaised) + currentAmtRaised
        print(newAmt)
        let page = DonationPage(name: page.name, creator: page.creator, currentAmtRaised: newAmt)
        let dict = page.dictValue
        
        let postRef = Database.database().reference().child("pages").child(ref)
        
        postRef.updateChildValues(dict)
    }
    
     static func create(forName name : String, creator : String, currentAmtRaised : Int) {
        let user = Constants.DeviceUID.deviceID
        let page = DonationPage(name: name, creator: creator, currentAmtRaised: currentAmtRaised)
        let dict = page.dictValue
        
        let postRef = Database.database().reference().child("pages").child(user).childByAutoId()

        postRef.updateChildValues(dict)
        
    }
    
    
}
