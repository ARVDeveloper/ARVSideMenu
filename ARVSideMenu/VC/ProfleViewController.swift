//
//  ProfleViewController.swift
//  ARVSideMenu
//
//  Created by user1 on 05/04/19.
//  Copyright © 2019 ARV. All rights reserved.
//

import UIKit

class ProfleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func btnDetails(_ sender: Any) {
        let childVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfileDetailsViewController") as! ProfileDetailsViewController
        self.navigationController?.pushViewController(childVC, animated: true)
    }
}
