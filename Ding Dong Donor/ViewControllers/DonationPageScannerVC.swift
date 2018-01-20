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
import BarcodeScanner

class DonationPageScannerVC : UIViewController {
    
    @IBOutlet weak var scannerImageView : UIImageView!
    let controller = BarcodeScannerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        controller.codeDelegate = self
        controller.errorDelegate = self
        controller.dismissalDelegate = self

    }
    
    @IBAction func scan(sender : Any) {
        present(controller, animated: true, completion: nil)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)


    }
   
}

extension DonationPageScannerVC: BarcodeScannerCodeDelegate,BarcodeScannerErrorDelegate,BarcodeScannerDismissalDelegate {
    
    func barcodeScanner(_ controller: BarcodeScannerController, didCaptureCode code: String, type: String) {
        print(code)
        controller.dismiss(animated: true, completion: nil)

    }
    func barcodeScanner(_ controller: BarcodeScannerController, didReceiveError error: Error) {
        print(error)
    }
    func barcodeScannerDidDismiss(_ controller: BarcodeScannerController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
