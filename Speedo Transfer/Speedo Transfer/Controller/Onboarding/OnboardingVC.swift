//
//  OnboardingVC.swift
//  Speedo Transfer
//
//

import UIKit

class OnboardingVC: UIViewController {

    //MARK: - @IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - Properties
    var pages: [OnboardingPage] = []
    var currentPage = 0
    
    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyGradientBgWhiteToRed()
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        customizeCollectoinView()
        getPageInfo()
    }
    
    private func customizeCollectoinView() {
        let nib = UINib(nibName: "OnboardingCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Onboarding")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func getPageInfo() {
        pages.append(contentsOf: [
            OnboardingPage(image: UIImage(named: "on boarding IMG 1")!, title: "Amount", content: "Send money fast with simple steps. Create account, Confirmation, Payment. Simple."),
            OnboardingPage(image: UIImage(named: "on boarding IMG 2")!, title: "Confirmation", content: "Transfer funds instantly to friends and family worldwide, strong shield protecting a money."),
            OnboardingPage(image: UIImage(named: "on boarding IMG 3")!, title: "Payment", content: "Enjoy peace of mind with our secure platform  Transfer funds instantly to friends.")
        ])
        collectionView.reloadData()
    }
    
    private func goToSignUpScreen() {
        let sb = UIStoryboard(name: Storyboards.main, bundle: nil)
        let signUpVC = sb.instantiateViewController(withIdentifier: VCS.signUpVC) as! SignUpVC
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    private func goToNextOnboardingCell() {
        currentPage += 1
        pageControl.currentPage = currentPage
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    //MARK: - @IBActions
    @IBAction func skipBtnTapped(_ sender: UIButton) {
        goToSignUpScreen()
        UserDefaultsManager.shared().hasSeenOnboarding = true
    }
    
    @IBAction func nextBtnTapped(_ sender: UIButton) {
        if currentPage == pages.count - 1 {
            goToSignUpScreen()
            UserDefaultsManager.shared().hasSeenOnboarding = true
        } else {
            goToNextOnboardingCell()
        }
    }
    
}

extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource,
                       UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let onboardingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Onboarding", for: indexPath) as! OnboardingCollectionViewCell
        onboardingCell.customizeCell(page: pages[indexPath.row])
        return onboardingCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }

}
