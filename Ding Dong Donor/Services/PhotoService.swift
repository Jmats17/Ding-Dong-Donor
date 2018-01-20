//
//  PhotoService.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import UIKit
import ImagePicker
//import EFQRCode

class PhotoService: NSObject {
    
    var completionHandler: ((UIImage) -> Void)?
    
    func presentImagePickerController(from viewController: UIViewController) {
        
        var configuration = Configuration()
        configuration.doneButtonTitle = "Add"
        configuration.noImagesTitle = "Sorry! There are no images here!"
        configuration.recordLocation = false
        let imagePicker = ImagePickerController(configuration: configuration)
        imagePicker.delegate = self
        imagePicker.imageLimit = 1
        viewController.present(imagePicker, animated: true, completion: nil)
    }
    
}

extension PhotoService: ImagePickerDelegate {
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        completionHandler?(images[0])
        imagePicker.dismiss(animated: true)
    }
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
}
