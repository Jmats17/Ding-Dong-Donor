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
    
    
    static func create(for image: UIImage, name : String, creator : String, currentAmtRaised : Int) {
        let imageRef = StorageReference.newPostImageReference()
        StorageService.uploadImage(image, at: imageRef) { (downloadURL) in
            guard let downloadURL = downloadURL else {
                return
            }
            
            let urlString = downloadURL.absoluteString
            create(forURLString: urlString, name: name, creator: creator, currentAmtRaised: currentAmtRaised)
        }
    }
    
    private static func create(forURLString urlString: String, name : String, creator : String, currentAmtRaised : Int) {
        let user = Constants.DeviceUID.deviceID
        let page = DonationPage(name: name, creator: creator, currentAmtRaised: currentAmtRaised, imageURL: urlString)
        let dict = page.dictValue
        
        let postRef = Database.database().reference().child("pages").child(user).childByAutoId()
        postRef.updateChildValues(dict)
        
    }
    
    
}
