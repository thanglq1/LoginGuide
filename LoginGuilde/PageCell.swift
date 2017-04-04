//
//  PageCell.swift
//  LoginGuilde
//
//  Created by ThangLQ on 4/4/17.
//  Copyright © 2017 ThangLQ. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageView: UIImageView = {
        let iv = UIImageView()
//        iv.backgroundColor = UIColor.yellow
        iv.image = UIImage(named: "page1")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        return iv
    }()
    
    var textView: UITextView = {
        let tv = UITextView()
        tv.text = "Sample sample sample sample"
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = false
        return tv
    }()
    
    func setupViews() {
        backgroundColor = UIColor.brown
        addSubview(imageView)
        addSubview(textView)
        
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: textView.topAnchor).isActive = true
        
        textView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
    }
}
