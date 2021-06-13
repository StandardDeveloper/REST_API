//
//  RecommendationViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/22.
//

import UIKit

class RecommendationViewController: UIViewController {
    
    @IBOutlet weak var recommendTableView: UITableView!
    
    var networkProvider = MovieNetworkManager()
    var nowPlaying: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recommendTableView.delegate = self
        recommendTableView.dataSource = self
     
        getMovieData()
    }
    
    func getMovieData() {
        
        networkProvider.getMovies(target: .nowPlaying) { results in
            
            self.nowPlaying = results
            
            OperationQueue.main.addOperation {
                self.recommendTableView.reloadData()
            }
        }
    }
}

extension RecommendationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = recommendTableView.dequeueReusableCell(withIdentifier: "recommendCell", for: indexPath) as! RecommendationTableViewCell
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
    
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
        print(nowPlaying.count)
        return nowPlaying.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendCollectionCell", for: indexPath) as! RecommendCollectionViewCell
        
        cell.recommendImageView.image = UIImage(named: "f2")
        cell.dataLabel.text = nowPlaying[indexPath.row].title
//        cell.dataLabel.text = "2,500원"
//        cell.infoLabel.text = "친환경 아욱 & 근대 2종"
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


