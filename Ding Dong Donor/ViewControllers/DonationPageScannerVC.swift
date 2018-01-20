//
//  DonationPageScannerVC.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import SwiftQRCode

class DonationPageScannerVC : UIViewController {
    
    let scanner = QRCode()
    @IBOutlet weak var scannerImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scanner.prepareScan(view) { (stringValue) -> () in
            print(stringValue)
        }
        scanner.scanFrame = scannerImageView.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scanner.startScan()

    }
   
}

