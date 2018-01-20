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
    struct PagePointer {
        static func pages() -> DatabaseReference {
            return Database.database().reference().child("pages").child(Constants.DeviceUID.deviceID)
        }
        static func page(link : String) -> DatabaseReference {
            return Database.database().reference().child("pages").child(Constants.DeviceUID.deviceID).child(link)
        }
    }
}
