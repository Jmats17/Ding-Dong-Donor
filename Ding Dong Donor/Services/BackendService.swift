//
//  BackendService.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/21/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import BraintreeDropIn
import Braintree
import UIKit

struct BackendService {
    static var clientToken : String?
    
    static func fetchClientToken() {
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
    
    static func showDropIn(clientTokenOrTokenizationKey: String, amt : Int, viewController : UIViewController) {
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
                result.paymentOptionType = .coinbase
                result.paymentOptionType = .venmo

                BackendService.postNonceToServer(paymentMethodNonce: (result.paymentMethod?.nonce)!, amt: amt)
                
            }
            controller.dismiss(animated: true, completion: nil)
        }
        viewController.present(dropIn!, animated: true, completion: nil)
    }
    
    static func postNonceToServer(paymentMethodNonce: String, amt : Int) {
        // Update URL with your server
        let paymentURL = URL(string: "https://cannr-app.herokuapp.com/checkout")!
        var request = URLRequest(url: paymentURL)
        request.httpBody = "payment_method_nonce=\(paymentMethodNonce)&amt=\(amt)".data(using: String.Encoding.utf8)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            // TODO: Handle success or failure
            }.resume()
    }
}
