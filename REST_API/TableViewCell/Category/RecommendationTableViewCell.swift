//
//  RecommendationTableViewCell.swift
//  REST_API
//
//  Created by 이민욱 on 2021/06/05.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var recommendCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
