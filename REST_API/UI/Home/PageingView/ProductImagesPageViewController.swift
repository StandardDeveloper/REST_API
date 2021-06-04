//
//  ProductImagesPageViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/29.
//

import UIKit

//delegeate가 없어서 커스텀으로 클래스 제작
protocol ProudctimagesPageViewControllerDelegate: class {
    func setupPageController(numberOfPages: Int)
    func turnPageController(to index: Int)
}

class ProductImagesPageViewController: UIPageViewController {

    var images: [UIImage]? = Product.fetchProducts().first!.images
    weak var pageViewControllerDelegate: ProudctimagesPageViewControllerDelegate?
    
    struct Storyboard {
        static let proudctImageViewController = "ProudctImageViewController"
    }
    
    lazy var controllers: [UIViewController] = {
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        var controllers = [UIViewController]()
                
        if let images = self.images {
            for image in images {
                let productImageVC = storyboard.instantiateViewController(withIdentifier: Storyboard.proudctImageViewController)
                    controllers.append(productImageVC)
                }
            }
                
        self.pageViewControllerDelegate?.setupPageController(numberOfPages: controllers.count)
        return controllers

    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        dataSource = self
        delegate = self
        
        turnToPage(index: 0)
        
    }
    
    func turnToPage(index: Int) {
        
        let controller = controllers[index]
        var direction = UIPageViewController.NavigationDirection.forward
        
        if let currentVC = viewControllers?.first {
            let currentIndex = controllers.index(of: currentVC)!
            if (currentIndex > index) {
                direction = .reverse
            }
        }
        
        self.configureDisplaying(viewController: controller)
        
        setViewControllers([controller], direction: direction, animated: true, completion: nil)
        
    }

    func configureDisplaying(viewController: UIViewController)
        {
            for (index, vc) in controllers.enumerated() {
                if viewController === vc {
                    if let productImageVC = viewController as? ProductImageViewController {
                        productImageVC.image = self.images?[index]
                        
                        self.pageViewControllerDelegate?.turnPageController(to: index)
                    }
                }
            }
        }
    
//    func configDisplaying(viewController: UIViewController) {
//
//        for (index, vc) in controllers.enumerated() {
//
//            if (viewController == vc) {
//                if let proudctImageVC = viewController as? ProductImageViewController {
//                    proudctImageVC.image = self.images?[index]
//
//                    self.pageViewControllerDelegate?.turnPageController(to: index)
//                }
//            }
//        }
//
//    }
    
    
    
    
    
    
}

extension ProductImagesPageViewController: UIPageViewControllerDataSource {
 
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController) {
            if index > 0 {
                return controllers[index - 1]
            }
        }
        
        return controllers.last
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let index = controllers.index(of: viewController) {
            if index < controllers.count - 1 {
                return controllers[index + 1]
            }
        }
        
        return controllers.first
    }
}

extension ProductImagesPageViewController: UIPageViewControllerDelegate {
 
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        self.configureDisplaying(viewController: pendingViewControllers.first as! ProductImageViewController)
        
    
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if (!completed) {
            self.configureDisplaying(viewController: previousViewControllers.first as! ProductImageViewController)
        }
    }
    
}

