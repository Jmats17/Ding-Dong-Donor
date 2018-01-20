//
//  CreatorService.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct CreatorService {
    
    static func pages(for user: String, completion: @escaping ([DonationPage]) -> Void) {
        let ref = Constants.PagePointer.pages()
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            
            let posts = snapshot.reversed().flatMap(DonationPage.init)
            completion(posts)
        })
    }
    static func showPage(for ref: DatabaseReference, completion: @escaping (DonationPage?) -> Void) {
        let ref = ref
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let page = DonationPage(snapshot: snapshot) else {
                return completion(nil)
            }
            
            completion(page)
        })
    }
    
}
