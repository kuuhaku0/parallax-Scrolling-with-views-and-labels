//
//  ViewController.swift
//  parallax2
//
//  Created by C4Q on 1/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

struct ScrollViewData {
    let title: String?
    let image: UIImage?
}

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var scrollViewData1 = [UIImage]() {
        didSet {
            print("GOT \(scrollViewData1.count) IMAGES")
        }
    }
    
    var scrollViewData = [ScrollViewData]()
    
    var num = 1
    var viewTagValue = 10
    var tagValue = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollViewData = [ScrollViewData.init(title: "First", image: #imageLiteral(resourceName: "download")),
                          ScrollViewData.init(title: "Second", image: #imageLiteral(resourceName: "download-1")),
                          ScrollViewData.init(title: "Third", image: #imageLiteral(resourceName: "window"))]
        
        scrollView.contentSize.width = self.view.bounds.width * CGFloat(scrollViewData1.count)
        
        var i = 0
        for data in scrollViewData1 {
            let view = ParallaxView(frame: CGRect(x: 10 + (self.view.bounds.width * CGFloat(i)), y: 80, width: self.view.bounds.width - 20, height: self.scrollView.bounds.height - 90))
        
            view.imageView.image = data
            view.tag = i + viewTagValue
            self.scrollView.addSubview(view)
            
            let label = UILabel(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 20), size: CGSize.init(width: 80, height: 40)))
            
            label.text = "Picture"
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.textColor = .black
            label.sizeToFit()
            label.textAlignment = .center
            label.tag = i + tagValue
            
            if i == 0 {
                label.center.x = view.center.x
            }
            else {
                label.center.x = view.center.x - self.scrollView.frame.width / 2
            }
            self.scrollView.addSubview(label)
            i += 1
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollView {
            for i in 0..<scrollViewData1.count {
                let label = scrollView.viewWithTag(i + tagValue) as! UILabel
                let view = scrollView.viewWithTag(i + viewTagValue) as! ParallaxView
                let scrollContentOffset = scrollView.contentOffset.x + self.view.bounds.width
                let viewOffset = (view.center.x - self.view.bounds.width / 4) - scrollContentOffset
                label.center.x = scrollContentOffset - ((self.view.bounds.width / 4 - viewOffset) / 2)
            }
        }
        print(scrollView.contentSize.width)
        
        print(scrollView.bounds.width)
    }
}


