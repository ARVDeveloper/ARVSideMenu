//
//  SideMenuViewController.swift
//  ARVSideMenu
//
//  Created by user1 on 05/04/19.
//  Copyright © 2019 ARV. All rights reserved.
//

import UIKit
protocol SidePanelViewControllerDelegate {
    func menuSelect(ViewController:UIViewController)
}
class SideMenuViewController: UIViewController {
  var delegate: SidePanelViewControllerDelegate?
  var menuTitle = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTitle = ["Home","Profile"]
    }
}
extension SideMenuViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text  = menuTitle[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            guard let childVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
                return
            }
            childVC.title = menuTitle[indexPath.row]
            delegate?.menuSelect(ViewController: childVC )
        }else if indexPath.row == 1 {
            guard let childVC = self.storyboard?.instantiateViewController(withIdentifier: "ProfleViewController") as? ProfleViewController else {
                return
            }
            childVC.title = menuTitle[indexPath.row]
            delegate?.menuSelect(ViewController: childVC )
        }
    }
}
