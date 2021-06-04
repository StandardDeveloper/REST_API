//
//  VTEcoCollectionViewCell.swift
//  REST_API
//
//  Created by 이민욱 on 2021/06/03.
//

import UIKit
import Kingfisher

class VTEcoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    func bind(imageURLString: String, text: String ) {
    
        imageView.kf.setImage(with: URL(string: imageURLString))
        infoLabel.text = text
    }
    
}
