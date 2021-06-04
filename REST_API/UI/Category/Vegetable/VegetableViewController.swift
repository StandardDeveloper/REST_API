//
//  VegetableViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/28.
//

import UIKit
import Tabman
import Pageboy

class VegetableViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    
   // let titleName = ["전체보기" : 1, "친환경" : 2, "고구마・감자・당근" : 3, "시금치・쌈채소・나물" : 4, "브로콜리・파프리카・양배추" : 5]
    let titleName = ["전체보기", "친환경", "고구마・감자・당근", "시금치・쌈채소・나물", "브로콜리・파프리카・양배추"]
   
    override func viewDidLoad() {
        super.viewDidLoad()

        let allVC = self.storyboard?.instantiateViewController(identifier: "vtAllVC") as! VTAllViewController
        let ecoVC = self.storyboard?.instantiateViewController(identifier: "vtEcoVC") as! VTEcoViewController
        let potatoVC = self.storyboard?.instantiateViewController(identifier: "vtPotatoVC") as! VTPotatoViewController
        let spinachVC = self.storyboard?.instantiateViewController(identifier: "vtSpinachVC") as! VTSpinachViewController
        let broccoliVC = self.storyboard?.instantiateViewController(identifier: "vtBroccoliVC") as! VTBroccoliViewController
        
        viewControllers.append(allVC)
        viewControllers.append(ecoVC)
        viewControllers.append(potatoVC)
        viewControllers.append(spinachVC)
        viewControllers.append(broccoliVC)
        
        self.dataSource = self
        
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

extension VegetableViewController: PageboyViewControllerDataSource ,TMBarDataSource {

    //이것도 물어보기
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        let item = TMBarItem(title: "")
        
        if(index == 0) {
            item.title = titleName[0]
        }
        else if(index == 1) {
            item.title = titleName[1]
        }
        else if(index == 2) {
            item.title = titleName[2]
        }
        else if(index == 3) {
            item.title = titleName[3]
        }
        else {
            item.title = titleName[4]
        }
        
        
//        for (name, number) in titleName {
//            var i = 0
//            i+=1
//
//            if(number == i) {
//
//                item.title = name
//
//            }
//        }
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
