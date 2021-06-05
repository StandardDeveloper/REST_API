//
//  VTEcoCollectionReusableView.swift
//  REST_API
//
//  Created by 이민욱 on 2021/06/04.
//

import UIKit

class VTEcoCollectionReusableView: UICollectionReusableView {

    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var recommendationBtn: UIButton!
    
    func bind(imageURLString: String, titleText: String) {
    
        bannerImageView.kf.setImage(with: URL(string: imageURLString))
        recommendationBtn.setTitle(titleText, for: .normal)
    }
    
    @IBAction func recommendationActionBtn(_ sender: Any) {
    }
    
}

