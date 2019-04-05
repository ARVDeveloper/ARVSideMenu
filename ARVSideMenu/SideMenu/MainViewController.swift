//
//  MainViewController.swift
//  ARVSideMenu
//
//  Created by user1 on 05/04/19.
//  Copyright © 2019 ARV. All rights reserved.
//

import UIKit
protocol SideMenuDelegate {
    func animateShowLeftPanel(shouldExpand: Bool)
    func animateHideLeftPanel(shouldExpand: Bool)
}
class MainViewController: UIViewController,SidePanelViewControllerDelegate {
    static let menuManager = MainViewController()
    
    var delegate : SideMenuDelegate?
    var sideMenuButton = UIBarButtonItem()
    var sideMenuVC = SideMenuViewController()
    var centerViewController: UIView!
    var isOpen = false
    var menuWidth = CGFloat()
    var currentviewController = UIViewController()
    var animationDurations = TimeInterval()
    var delayDurations = TimeInterval()
    
    @IBOutlet weak var containerView: UIView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
       
        sideMenuButton = UIBarButtonItem(image:UIImage(named:"menu"), style:.plain, target:self, action:#selector(self.buttonAction(_:)))
        sideMenuButton.tintColor = UIColor.blue
        self.navigationItem.leftBarButtonItem = sideMenuButton
        
        sideMenuVC = self.storyboard?.instantiateViewController(withIdentifier: "SideMenuViewController") as! SideMenuViewController
        self.addChild(sideMenuVC)
        sideMenuVC.delegate = self
        sideMenuVC.didMove(toParent: self)
        sideMenuVC.view.frame = CGRect.init(x: -UIScreen.main.bounds.width, y: 0, width: menuWidth, height: (self.view.bounds.height))
        self.view.addSubview((sideMenuVC.view)!)
       
    }
    
    func showMenu(){
        isOpen = true
        delegate?.animateHideLeftPanel(shouldExpand: isOpen)
        UIView.animate(withDuration: animationDurations, delay: delayDurations, options: [],
                       animations: {
                        self.sideMenuVC.view.frame = CGRect.init(x: 0, y: 0, width: self.menuWidth, height: (self.view.bounds.height))
        },
                       completion: nil
        )
    }
    
    func hideMenu(){
        isOpen = false
        delegate?.animateHideLeftPanel(shouldExpand: isOpen)
        UIView.animate(withDuration: animationDurations, delay: delayDurations, options: [],
                       animations: {
                        self.sideMenuVC.view.frame = CGRect.init(x: -UIScreen.main.bounds.width, y: 0, width: self.menuWidth, height: (self.view.bounds.height))
        },
                       completion: nil
        )
        
    }
    
    @objc func buttonAction(_ sender: UIBarButtonItem) {
       
        if isOpen == false{
            self.showMenu()
        }else{
            self.hideMenu()
        }
    }
   func menuSelect(ViewController: UIViewController) {
        self.hideMenu()
        self.title = ViewController.title
        addChild(ViewController)
        ViewController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        ViewController.view.frame = containerView.bounds
        containerView.addSubview(ViewController.view)
        ViewController.didMove(toParent: self)
    }
   
}
extension MainViewController{
    
    @IBInspectable var menuwidh: CGFloat {
        get { return menuWidth}
        set { menuWidth = newValue }
    }
    
   @IBInspectable var animationDuration:CGFloat{
        get { return CGFloat(animationDurations)}
        set { animationDurations = TimeInterval(newValue) }
    }
    
    @IBInspectable var delayDuration:CGFloat{
        get { return CGFloat(delayDurations)}
        set { delayDurations = TimeInterval(newValue) }
    }
}
