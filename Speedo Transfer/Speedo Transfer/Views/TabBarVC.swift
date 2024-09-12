//
//  TabBarVC.swift
//  Speedo Transfer
//
//  Created by 1234 on 12/09/2024.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ChangeRadiusOfTabbar()
        self.ChangeHeightOfTabbar()

        if let tabBar = self.tabBarController?.tabBar {
            let appearance = UITabBarAppearance()
            appearance.configureWithDefaultBackground()
            
            
            let normalAttributes: [NSAttributedString.Key: Any] = [ .foregroundColor: Colors .NormalTabBarColor]
            
            let itemAppearance = appearance.stackedLayoutAppearance
            itemAppearance.normal.titleTextAttributes = normalAttributes
            
            tabBar.standardAppearance = appearance
            if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = appearance
            }
        }
    }

    func ChangeRadiusOfTabbar(){
        self.tabBar.layer.masksToBounds = true
        self.tabBar.isTranslucent = true
        self.tabBar.layer.cornerRadius = 24
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func ChangeHeightOfTabbar(){
        if UIDevice().userInterfaceIdiom == .phone {
            var tabFrame = tabBar.frame
            tabFrame.size.height = 73
            tabFrame.origin.y = view.frame.size.height - 73
            tabBar.frame = tabFrame
        }
    }
}
