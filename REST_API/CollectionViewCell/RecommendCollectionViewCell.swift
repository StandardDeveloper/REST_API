//
//  RecommendCollectionViewCell.swift
//  REST_API
//
//  Created by 이민욱 on 2021/06/05.
//

import UIKit

class RecommendCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var recommendImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    func bind(imageURLString: String, titleText: String, dataText: String ) {
    
        recommendImageView.kf.setImage(with: URL(string: imageURLString))
        infoLabel.text = titleText
        dataLabel.text = dataText
    }
    
}
