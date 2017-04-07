//
//  ViewController.swift
//  LoginGuilde
//
//  Created by ThangLQ on 4/3/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, FinishViewControllerDelegate {

    let cellId:String = "cellID"
    let loginId = "loginID"
    
    let pages: [Page] = {
       let page1 = Page(title: "This is page 1", message: "Page 1 is introduction page", imageName: "page1")
        let page2 = Page(title: "This is page 2", message: "Page 2 is introduction page", imageName: "page2")
        let page3 = Page(title: "This is page 3", message: "Page 3 is introduction page", imageName: "page3")
        return [page1, page2, page3]
        
    }()
    
    
    lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = UIColor.orange
        pc.pageIndicatorTintColor = UIColor.gray
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.numberOfPages = 4
        return pc
    }()
    
    var skipButton: UIButton = {
        let skBtn = UIButton(type: UIButtonType.system)
        skBtn.setTitle("Skip", for: UIControlState.normal)
        skBtn.setTitleColor(UIColor.orange, for: .normal)
        skBtn.translatesAutoresizingMaskIntoConstraints = false
        skBtn.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        return skBtn
    }()
    
    func handleSkip() {
        pageControl.currentPage =  pages.count - 1
        handleNext()
    }
    
    var nextButton: UIButton = {
       let nextBtn = UIButton(type: UIButtonType.system)
        nextBtn.setTitleColor(UIColor.orange, for: .normal)
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        nextBtn.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return nextBtn
    }()
    
    func handleNext() {
        if pageControl.currentPage ==  pages.count {
            return
        }
        
        if pageControl.currentPage ==  pages.count - 1 {
            skipButton.isHidden = true
            nextButton.isHidden = true
            pageControl.isHidden = true
        }
        
        let currentPage = pageControl.currentPage
        let indexPath = IndexPath(item: currentPage + 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageControl.currentPage += 1
    }
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        nextButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        skipButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        skipButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        skipButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        skipButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        pageControl.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageControl.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(LoginCell.self, forCellWithReuseIdentifier: loginId)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pages.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        if indexPath.row == pages.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loginId, for: indexPath) as! LoginCell
//            cell.loginController = self
            cell.finishLoginController = self
            return cell
        }
        
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.row]
        myCell.page = page
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = page
        if page == pages.count {
            pageControl.isHidden = true
            skipButton.isHidden = true
            nextButton.isHidden = true
//            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 80).isActive = true
        } else {
            pageControl.isHidden = false
            skipButton.isHidden = false
            nextButton.isHidden = false
//            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    func finishViewController() {
        dismiss(animated: true, completion: nil)
    }
    
//    func finishController() {
//        dismiss(animated: true, completion: nil)
//    }
}

