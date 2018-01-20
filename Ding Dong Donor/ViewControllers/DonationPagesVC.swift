//
//  DonationPagesVC.swift
//  Ding Dong Donor
//
//  Created by Justin Matsnev on 1/20/18.
//  Copyright © 2018 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit

class DonationPagesVC: UITableViewController {
    
    var pages = [DonationPage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CreatorService.pages(for: Constants.DeviceUID.deviceID) { (pages) in
            self.pages = pages
            print(pages.count)
            self.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DonationPageCell", for: indexPath) as! DonationPageTableVC
        let page = pages[indexPath.row]
        cell.creatorLabel.text = page.creator
        cell.pageLabel.text = page.name
        cell.moneyRaised.text = "$\(page.currentAmtRaised)"
        return cell
    }
    
}
