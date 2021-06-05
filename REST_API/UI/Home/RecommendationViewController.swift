//
//  RecommendationViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/22.
//

import UIKit

class RecommendationViewController: UIViewController {
    
    @IBOutlet weak var recommendTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recommendTableView.delegate = self
        recommendTableView.dataSource = self
        
        recommendTableView.estimatedRowHeight = recommendTableView.rowHeight
        recommendTableView.rowHeight = UITableView.automaticDimension
        
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
//        header.backgroundColor = .white
//
//        let headerLabel = UILabel(frame: header.bounds)
//        headerLabel.text = "이 상품 어때요?"
//        headerLabel.textAlignment = .left
//
//        header.addSubview(headerLabel)
//
//        recommendTableView.tableHeaderView = header
        
    }
}

extension RecommendationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = recommendTableView.dequeueReusableCell(withIdentifier: "recommendCell", for: indexPath) as! RecommendationTableViewCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 250.0
        //return UITableView.automaticDimension
    }
    

    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "이 상품 어때요?"
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let vw = UIView()
//        vw.backgroundColor = .red//UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
//        let headerLabel = UILabel(frame: vw.bounds)
//               headerLabel.text = "이 상품 어때요?"
//               headerLabel.textAlignment = .left
//
//        vw.addSubview(headerLabel)
//        return vw
//    }
    
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }



    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if let cell = cell as? RecommendationTableViewCell {
            
            cell.recommendCollectionView.dataSource = self
            cell.recommendCollectionView.delegate = self
            cell.recommendCollectionView.reloadData()
        
        }
    }
}

extension RecommendationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendCollectionCell", for: indexPath) as! RecommendCollectionViewCell
        
        cell.recommendImageView.image = UIImage(named: "f1")
        cell.dataLabel.text = "2,500원"
        cell.infoLabel.text = "친환경 아욱 & 근대 2종"
        return cell
    }
    
}

extension RecommendationViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 10.0
            let itemWidth = (collectionView.bounds.width - 5.0) / 2.0
            return CGSize(width: itemWidth, height: itemWidth)
        }
        
        return CGSize.zero
        
    }
    
}


