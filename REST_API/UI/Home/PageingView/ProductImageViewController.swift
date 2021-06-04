//
//  ProductImageViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/29.
//

import UIKit

class ProductImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage? {
        didSet {
            self.imageView?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = image
    }
    
}
