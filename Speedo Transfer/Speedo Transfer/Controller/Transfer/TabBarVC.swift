//
//  TabBarVC.swift
//

import UIKit

import RAMAnimatedTabBarController

class TabBarVC: RAMAnimatedTabBarController {
    
    var homeNavigation = UINavigationController()
    var transferNavigation = UINavigationController()
    var transactionNavigation = UINavigationController()
    var cardNavigation = UINavigationController()
    var moreNavigation = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpVCs()
        self.setUpTabBarView()
        self.navigationItem.hidesBackButton = true
    }
    
}
extension TabBarVC {
    
    private func setUpTabBarView(){
        self.tabBar.tintColor = Colors.primaryColor
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.backgroundColor = Colors.white.cgColor
    }
    
    private func setHomeTab() {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        guard let homeVC = sb.instantiateViewController(withIdentifier: "TransfersHomeVC") as? TransfersHomeVC else {
            print("TransfersHomeVC could not be instantiated")
            return
        }
        self.homeNavigation = UINavigationController(rootViewController: homeVC)
        self.homeNavigation.tabBarItem = createTabBarItem(image: UIImage(named: "home"), title: "Home", tag: 0, animation: RAMBounceAnimation())
        homeNavigation.viewControllers = [homeVC]
    }
    
    private func setTransferTab() {
//        let transferVC = TransfersAmountVC()
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        guard let transferVC = sb.instantiateViewController(withIdentifier: "TransfersAmountVC") as? TransfersAmountVC else {
            print("TransfersAmountVC could not be instantiated")
            return
        }
        self.transferNavigation = UINavigationController(rootViewController: transferVC)
        self.transferNavigation.tabBarItem = createTabBarItem(image: UIImage(named: "Transfer 1"), title: "Transfer", tag: 1, animation: RAMLeftRotationAnimation())
        transferNavigation.viewControllers = [transferVC]
    }
    
    private func setTransactionsTab() {
//        let transactionsVC = LastTransactionsVC()
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        guard let transactionsVC = sb.instantiateViewController(withIdentifier: "LastTransactionsVC") as? LastTransactionsVC else {
            print("LastTransactionsVC could not be instantiated")
            return
        }
        self.transactionNavigation = UINavigationController(rootViewController: transactionsVC)
        self.transactionNavigation.tabBarItem = createTabBarItem(image: UIImage(named: "transactions"), title: "Transactions", tag: 2, animation: RAMRightRotationAnimation())
        transactionNavigation.viewControllers = [transactionsVC]
    }
    
    private func setCardsTab() {
//        let cardsVC = CardsVC()
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        guard let cardsVC = sb.instantiateViewController(withIdentifier: "CardsVC") as? CardsVC else {
            print("cardsVC could not be instantiated")
            return
        }
        self.cardNavigation = UINavigationController(rootViewController: cardsVC)
        self.cardNavigation.tabBarItem = createTabBarItem(image: UIImage(named: "Cards 1"), title: "My Cards", tag: 3, animation: RAMFlipBottomTransitionItemAnimations())
        cardNavigation.viewControllers = [cardsVC]
    }
    
    private func setMoreTab() {
//        let moreVC = MoreVC()
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        guard let moreVC = sb.instantiateViewController(withIdentifier: "MoreVC") as? MoreVC else {
            print("moreVC could not be instantiated")
            return
        }
        self.moreNavigation = UINavigationController(rootViewController: moreVC)
        self.moreNavigation.tabBarItem = createTabBarItem(image: UIImage(named: "More"), title: "More", tag: 4, animation: RAMBounceAnimation())
        moreNavigation.viewControllers = [moreVC]
    }
    
    private func setUpVCs() {
        setHomeTab()
        setTransferTab()
        setTransactionsTab()
        setCardsTab()
        setMoreTab()
        self.viewControllers = [homeNavigation, transferNavigation, transactionNavigation, cardNavigation, moreNavigation]
    }
    
    func createTabBarItem(image: UIImage?, title: String, tag: Int, animation: RAMItemAnimation) -> RAMAnimatedTabBarItem {
        
        let item = RAMAnimatedTabBarItem(title: title, image: image, tag: tag)
        animation.textSelectedColor = Colors.primaryColor
        item.animation = animation
        item.textFontSize = 12
        
        item.textColor = Colors.tabBarColor
        item.iconColor = Colors.tabBarColor
        
        return item
    }
    
}

//class TabBarVC: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.ChangeRadiusOfTabbar()
//        self.ChangeHeightOfTabbar()
//
//        if let tabBar = self.tabBarController?.tabBar {
//            let appearance = UITabBarAppearance()
//            appearance.configureWithDefaultBackground()
//            
//            
//            let normalAttributes: [NSAttributedString.Key: Any] = [ .foregroundColor: Colors .NormalTabBarColor]
//            
//            let itemAppearance = appearance.stackedLayoutAppearance
//            itemAppearance.normal.titleTextAttributes = normalAttributes
//            
//            tabBar.standardAppearance = appearance
//            if #available(iOS 15.0, *) {
//                tabBar.scrollEdgeAppearance = appearance
//            }
//        }
//    }
//
//    func ChangeRadiusOfTabbar(){
//        self.tabBar.layer.masksToBounds = true
//        self.tabBar.isTranslucent = true
//        self.tabBar.layer.cornerRadius = 24
//        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//    }
//    
//    func ChangeHeightOfTabbar(){
//        if UIDevice().userInterfaceIdiom == .phone {
//            var tabFrame = tabBar.frame
//            tabFrame.size.height = 73
//            tabFrame.origin.y = view.frame.size.height - 73
//            tabBar.frame = tabFrame
//        }
//    }
//}
