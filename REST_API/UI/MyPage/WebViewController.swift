//
//  WebViewController.swift
//  REST_API
//
//  Created by 이민욱 on 2021/05/20.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate, WKUIDelegate  {

    lazy var backButton: UIBarButtonItem = {
        let buttonIcon = UIImage(systemName: "chevron.backward")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(backBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .lightGray
        return button
    }()
    
    @objc func backBtn(_ sender:UIBarButtonItem!){
        navigationController?.popViewController(animated: true)
      }
    
    var webView: WKWebView!
    
    var navTitle: String? = ""
    
    override func loadView() {
        super.loadView()
        webView = WKWebView(frame: self.view.frame)
        self.view = self.webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = navTitle
        navigationItem.leftBarButtonItem = self.backButton
        
        //tabbar 숨기기
        self.tabBarController?.tabBar.isHidden = true
        let sURL = URL(string: "https://m.naver.com")
        let request = URLRequest(url: sURL!)
        webView.load(request)

    }
    
}
