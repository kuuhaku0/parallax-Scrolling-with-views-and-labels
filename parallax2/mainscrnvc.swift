//
//  mainscrnvc.swift
//  parallax2
//
//  Created by C4Q on 1/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class mainscrnvc: UIViewController {
    
    var pixabay = [Hits]()
    
    var images = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        PixabayAPIClient.manager.getPixabayData(from: "new+york", completionHandler: {self.pixabay = $0}, errorHandler: {print($0)})
    }
    
    @IBAction func getimage(_ sender: UIButton) {
        DispatchQueue.main.async {
        
            for i in self.pixabay {
            ImageAPIClient.manager.loadImage(from: i.webformatURL!, completionHandler: {self.images.append($0)}, errorHandler: {print($0)})
        }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController {
            destination.scrollViewData1 = images
        }
    }
    
}
