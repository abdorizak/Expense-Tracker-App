//
//  OnboardingViewController.swift
//  Expense Tracker
//
//  Created by Abdirizak Hassan on 12/2/22.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - UICollectionView
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    // MARK: - UIPageController
    private var pageController = CustomPageController(frame: .zero)
    var currentPage = 0 {
        didSet{
            if currentPage == MockData.onBoardingData.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            }else {
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    
    // MARK: - UIButton
    private let nextBtn = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubViews(collectionView, pageController, nextBtn)
        view.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.delegate = self
        configCollectionView()
        configPageController()
        configurationNextBtn()
    }
    
    // MARK: - Configuration CollectionView
    private func configCollectionView() {
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.identfier)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: DeviceTypes.isiPhoneSE ? 470 : 580),
        ])
    }
    
    // MARK: - Configuration Button
    private func configurationNextBtn() {
        var config = UIButton.Configuration.filled()
        config.buttonSize = .large
        config.title = "Next"
        nextBtn.configuration = config
        nextBtn.addAction(UIAction(handler: { _ in
            DispatchQueue.main.async { [unowned self] in
                if currentPage == MockData.onBoardingData.count - 1 {
                    let welcomeVC = UINavigationController(rootViewController: LoginVC())
                    welcomeVC.modalPresentationStyle = .overFullScreen
                    welcomeVC.modalTransitionStyle   = .coverVertical
                    UserDefaults.standard.hasOnboarded = true
                    present(welcomeVC, animated: true, completion: nil)
                } else {
                    currentPage += 1
                    let indexPath = IndexPath(item: currentPage, section: 0)
                    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                    pageController.setPage(currentPage)
                }
            }
        }), for: .touchUpInside)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nextBtn.topAnchor.constraint(equalTo: pageController.bottomAnchor, constant: 30),
            nextBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80),
            nextBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            nextBtn.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    // MARK: - configuration PageController
    private func configPageController() {
        pageController.translatesAutoresizingMaskIntoConstraints = false
        pageController.drawer = DotDrawer(numberOfPages: MockData.onBoardingData.count, space: 16.0, indicatorColor: UIColor.systemBlue, dotsColor: .gray, isBordered: false, borderWidth: 0.0, indicatorBorderColor: .clear, indicatorBorderWidth: 0.0)
        NSLayoutConstraint.activate([
            pageController.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 10),
            pageController.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pageController.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}


extension OnboardingViewController: UICollectionViewDataSource, UICollisionBehaviorDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        MockData.onBoardingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identfier, for: indexPath) as! OnboardingCell
        cell.display(MockData.onBoardingData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.height)
    }
    
    //  If unspecified default value of 10 is used.
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageController.setPage(currentPage)
    }
}
