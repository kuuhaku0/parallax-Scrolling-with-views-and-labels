//
//  ParallaxView.swift
//  parallax2
//
//  Created by C4Q on 1/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ParallaxView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupImageView()
    }
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        [imageView.leftAnchor.constraint(equalTo: leftAnchor),
         imageView.rightAnchor.constraint(equalTo: rightAnchor),
         imageView.topAnchor.constraint(equalTo: topAnchor),
         imageView.bottomAnchor.constraint(equalTo: bottomAnchor)]
            .forEach{$0.isActive = true}
    }
}

