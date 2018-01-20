//
//  CreateBarcodeService.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import Kingfisher
import FirebaseDatabase
import SwiftQRCode

struct CreateBarcodeService {
    

    func createBarcode(imageUrl : URL, stringRef : String, completion: @escaping (UIImage?) -> Void) {
        
        KingfisherManager.shared.retrieveImage(with: imageUrl, options: nil, progressBlock: nil, completionHandler: { image, error, cacheType, imageURL in
            guard let barcodeImage = QRCode.generateImage("\(stringRef)", avatarImage: nil)
                else {
                return completion(nil)}
            completion(barcodeImage)
        })
    }

}
