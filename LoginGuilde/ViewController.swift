//
//  ViewController.swift
//  LoginGuilde
//
//  Created by ThangLQ on 4/3/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let cellId:String = "cellID"
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
        cv.backgroundColor = UIColor.red
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPageIndicatorTintColor = UIColor.orange
        pc.pageIndicatorTintColor = UIColor.gray
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.numberOfPages = 3
        return pc
    }()
    
    var skipButton: UIButton = {
        let skBtn = UIButton(type: UIButtonType.system)
        skBtn.setTitle("Skip", for: UIControlState.normal)
        skBtn.setTitleColor(UIColor.orange, for: .normal)
        skBtn.translatesAutoresizingMaskIntoConstraints = false
        return skBtn
    }()
    
    var nextButton: UIButton = {
       let nextBtn = UIButton(type: UIButtonType.system)
        nextBtn.setTitleColor(UIColor.orange, for: .normal)
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        return nextBtn
    }()
    
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
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.row]
        myCell.page = page
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}

