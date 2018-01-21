//
//  Constants.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import UIKit
import FirebaseDatabase

struct Constants {
    struct DeviceUID {
        static let deviceID = UIDevice.current.identifierForVendor!.uuidString
    }
    struct StripeKey {
        static let apiKey = "pk_test_4W8hdFleOIMWTQq7GZRcyvZn"
        static let merchantKey = "merchant.com.cannr"
    }
    struct PagePointer {
        static func pages() -> DatabaseReference {
            return Database.database().reference().child("pages").child(Constants.DeviceUID.deviceID)
        }
        static func page() -> DatabaseReference {
            return Database.database().reference()
        }
    }
}
