//
//  navController.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/21/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
class NavController : UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
        self.navigationBar.backItem?.backBarButtonItem?.tintColor = #colorLiteral(red: 0.06102801114, green: 0.8412134051, blue: 0.8149386644, alpha: 1)
    }
}
