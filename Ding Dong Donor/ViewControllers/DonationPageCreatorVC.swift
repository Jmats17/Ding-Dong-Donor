//
//  DonationPageCreatorVC.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/19/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import ImagePicker
import EFQRCode

class DonationPageCreatorVC : UIViewController, ImagePickerDelegate {
    
    @IBOutlet weak var nameLabel : UITextField!
    @IBOutlet weak var creatorLabel : UITextField!
    @IBOutlet weak var barcodeImage : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func addImage() {
  
        var configuration = Configuration()
        configuration.doneButtonTitle = "Add"
        configuration.noImagesTitle = "Sorry! There are no images here!"
        configuration.recordLocation = false
        let imagePicker = ImagePickerController(configuration: configuration)
        imagePicker.delegate = self
        imagePicker.imageLimit = 1
        present(imagePicker, animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        let imageData = UIImagePNGRepresentation(images[0])


        let barcodeImg = EFQRCode.generate(
            content: "https://www.youtube.com/watch?v=s-U1J5CCiY4",
            watermark: UIImage(data: imageData!)?.toCGImage())
        barcodeImage.image = UIImage(cgImage: barcodeImg!)
        self.dismiss(animated: true, completion: nil)
    }
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
