//
//  VTEcoViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/28.
//

import UIKit
import Moya
import Kingfisher
import ProgressHUD

class VTEcoViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let lineSpacing: CGFloat = 10
    let inset: CGFloat = 20
    
    var networkProvider = MovieNetworkManager()
    var nowPlaying: [Movie] = []
    
 
 
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
    
        getMovieData()
    }
    
    func getMovieData() {
        
        networkProvider.getMovies(target: .nowPlaying) { (results) in

            self.nowPlaying = results
            
            OperationQueue.main.addOperation {
                self.collectionView.reloadData()
            }
            
        }
    }
    
    
}

extension VTEcoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "resuableBannerView", for: indexPath) as! VTEcoCollectionReusableView
            headerView.bannerImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/6MKr3KgOLmzOP6MSuZERO41Lpkt.jpg"))
            return headerView
        default:
            assert(false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 150
        return CGSize(width: width, height: height)
    }
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nowPlaying.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "vtEcoCell", for: indexPath) as! VTEcoCollectionViewCell
        cell.backgroundColor = .lightGray
        cell.bind(
            imageURLString: "https://image.tmdb.org/t/p/w500\(nowPlaying[indexPath.row].poster_path)",
            text: nowPlaying[indexPath.item].title
        )
        return cell
    }
}

extension VTEcoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 100.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        ///  2등분하여 배치, 옆 간격이 1이므로 1을 빼줌
        let width = collectionView.safeAreaLayoutGuide.layoutFrame.width / 2 - inset - lineSpacing
        let size = CGSize(width: width, height: 240)
        return size
    }
    
}
