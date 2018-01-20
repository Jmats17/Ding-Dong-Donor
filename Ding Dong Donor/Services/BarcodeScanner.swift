//
//  BarcodeScanner.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import SwiftQRCode
import BarcodeScanner

class Scanner : NSObject {
    
    var completionHandler: ((String) -> Void)?

    func presentBarcodeScanner(from viewController: UIViewController) {
        
        let scanner = BarcodeScannerController()
        scanner.barCodeFocusViewType = .animated
        scanner.codeDelegate = self
        scanner.errorDelegate = self
        scanner.dismissalDelegate = self
        viewController.present(scanner, animated: true, completion: nil)
    }
    
}

extension Scanner : BarcodeScannerCodeDelegate,BarcodeScannerErrorDelegate,BarcodeScannerDismissalDelegate {
    func barcodeScanner(_ controller: BarcodeScannerController, didCaptureCode code: String, type: String) {
        completionHandler?(code)
        controller.dismiss(animated: true, completion: nil)
        
    }
    func barcodeScanner(_ controller: BarcodeScannerController, didReceiveError error: Error) {
        print(error)
    }
    func barcodeScannerDidDismiss(_ controller: BarcodeScannerController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
