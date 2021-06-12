//
//  MyPageCustomTableViewCell.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/18.
//

import UIKit

class MyPageCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var joinInfoBtn: UIButton!
    @IBOutlet weak var loginSignupBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        configrationUI()
    }
    
    func configrationUI() {
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        infoLabel.text = "           회원 가입하고 \n 다양한 혜택을 받아보세요!"
        infoLabel.numberOfLines = 2
        
        joinInfoBtn.translatesAutoresizingMaskIntoConstraints = false
        joinInfoBtn.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 3).isActive = true
        joinInfoBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        joinInfoBtn.backgroundColor = .white
        joinInfoBtn.tintColor = .darkGray
        joinInfoBtn.alpha = 1
        
        loginSignupBtn.translatesAutoresizingMaskIntoConstraints = false
        loginSignupBtn.layer.cornerRadius = 5
        loginSignupBtn.topAnchor.constraint(equalTo: joinInfoBtn.bottomAnchor, constant: 30).isActive = true
        loginSignupBtn.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        loginSignupBtn.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        loginSignupBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginSignupBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginSignupBtn.backgroundColor = UIColor(red: 80/255, green: 10/255, blue: 110/255, alpha: 1.0)
        
    }

}
