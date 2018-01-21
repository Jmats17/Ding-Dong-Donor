//
//  PaymentOptionVC.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import BraintreeDropIn
import Braintree
class PaymentOptionVC : UIViewController {
    private var merchantID = "merchant.com.justinmatsnev.Ding-Dong-Donor.cannr"
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var creatorLabel : UILabel!
    @IBOutlet weak var amtRaisedLabel : UILabel!
    
    let barcodeScanner = Scanner()
    var clientToken : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barcodeScanner.completionHandler = { ref in
            CreatorService.showPage(for: Constants.PagePointer.page().child("pages").child(ref), completion: { (page) in
                self.nameLabel.text = page?.name
                self.creatorLabel.text = page?.creator
                self.amtRaisedLabel.text = "$\((page?.currentAmtRaised)!)"
            })
            
        }
        fetchClientToken()
    }
    
    func showDropIn(clientTokenOrTokenizationKey: String) {
        let request =  BTDropInRequest()
        let dropIn = BTDropInController(authorization: clientTokenOrTokenizationKey, request: request)
        { (controller, result, error) in
            if (error != nil) {
                print("ERROR")
            } else if (result?.isCancelled == true) {
                print("CANCELLED")
            } else if let result = result {
                // Use the BTDropInResult properties to update your UI
                 result.paymentOptionType = .visa
                result.paymentOptionType = .applePay

                self.postNonceToServer(paymentMethodNonce: (result.paymentMethod?.nonce)!)
                
                // result.paymentIcon
                // result.paymentDescription
            }
            controller.dismiss(animated: true, completion: nil)
        }
        self.present(dropIn!, animated: true, completion: nil)
    }
    
    
    @IBAction func scan(sender : Any) {
        barcodeScanner.presentBarcodeScanner(from: self)
        
    }
    
    @IBAction func applyPaySelected(sender : Any) {

    }
    @IBAction func venmoSelected(sender : Any) {
        
    }
    @IBAction func cardSelected(sender : Any) {
      
        self.showDropIn(clientTokenOrTokenizationKey: self.clientToken ?? "")

    }
    
    func fetchClientToken() {
        // TODO: Switch this URL to your own authenticated API
        let clientTokenURL = NSURL(string: "https://cannr-app.herokuapp.com/client_token")!
        let clientTokenRequest = NSMutableURLRequest(url: clientTokenURL as URL)
        clientTokenRequest.setValue("text/plain", forHTTPHeaderField: "Accept")
        
        URLSession.shared.dataTask(with: clientTokenRequest as URLRequest) { (data, response, error) -> Void in
            // TODO: Handle errors
            if let data = data {
                guard let clientToken = String(data: data, encoding: String.Encoding.utf8) else {return}
                self.clientToken = clientToken
                // As an example, you may wish to present Drop-in at this point.
                // Continue to the next section to learn more...
            }
            
            }.resume()
    }
    
    func postNonceToServer(paymentMethodNonce: String) {
        // Update URL with your server
        let paymentURL = URL(string: "https://cannr-app.herokuapp.com/payment-methods")!
        var request = URLRequest(url: paymentURL)
        request.httpBody = "payment_method_nonce=\(paymentMethodNonce)".data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            // TODO: Handle success or failure
            }.resume()
    }
    @IBAction func bitcoinSelected(sender : Any) {
        
    }
}
