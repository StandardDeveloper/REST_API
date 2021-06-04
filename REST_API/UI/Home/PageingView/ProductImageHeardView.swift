//
//  ProductImageHeardView.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/29.
//

import UIKit

class ProductImageHeardView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!

}

extension ProductImageHeardView: ProudctimagesPageViewControllerDelegate {
    func setupPageController(numberOfPages: Int) {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int) {
        pageControl.currentPage = index
    }
}

