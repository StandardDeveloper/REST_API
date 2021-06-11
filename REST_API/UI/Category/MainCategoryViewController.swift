//
//  MainCategoryViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/28.
//

import UIKit
import Tabman
import Pageboy

class MainCategoryViewController: TabmanViewController {
    
    var section = Section()

    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        for _ in section.data {
            let allVC = self.storyboard?.instantiateViewController(identifier: "categoryDataVC") as! CategoryDataViewController
            allVC.categoryData = section
            viewControllers.append(allVC)
        }
        
        self.dataSource = self
        self.delegate = self
        
        let bar = TMBar.ButtonBar()
        bar.backgroundColor = .white
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 16.0, bottom: 0, right: 16.0)
        bar.layout.interButtonSpacing = 20
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .intrinsic
        
        bar.buttons.customize {
        
            $0.tintColor = .lightGray
            $0.selectedTintColor = .purple
               if #available(iOS 11, *) {
                   $0.adjustsFontForContentSizeCategory = true
            }
        }
           
        bar.indicator.tintColor = .purple
        addBar(bar, dataSource: self, at: .top)
        
    }
}

extension MainCategoryViewController: PageboyViewControllerDataSource,TMBarDataSource {

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        let item = TMBarItem(title: "")
        item.title = section.data[index]
        
        return item
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}
