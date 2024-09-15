//
//  MoreVC.swift
//  Speedo Transfer
//
//

import UIKit

class MoreVC: UIViewController {
    
    
    @IBAction func HelpBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: Storyboards.main, bundle: nil)
        
        guard let destinationController = storyboard.instantiateViewController(withIdentifier: "HelpVC") as? HelpVC else { return }

        if let presentationController = destinationController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium(), .large() ]
            presentationController.preferredCornerRadius = 50
            presentationController.prefersGrabberVisible = true
        }
        self.present(destinationController, animated: true)
    }
    @IBOutlet weak var HelpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applyGradientBgYellowToRed()

    }
    
    @IBAction func logoutBtnTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
        
//        loginVC.hidesBottomBarWhenPushed = true
//        
//        if let navigationController = self.navigationController {
//            navigationController.setViewControllers([loginVC], animated: true)
//        }
        
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
               let navigationController = UINavigationController(rootViewController: loginVC)
               window.rootViewController = navigationController
               window.makeKeyAndVisible()
           }
    }

}
