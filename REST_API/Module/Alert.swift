//
//  Alert.swift
//  REST_API
//
//  Created by 이민욱 on 2021/06/09.
//

import Foundation
import UIKit


func showAlert(viewController: UIViewController?, title: String, Messge: String, btnTitle: String) {
    
    let alertController = UIAlertController(title: title, message: Messge, preferredStyle: UIAlertController.Style.alert)
    let alertOK = UIAlertAction(title: btnTitle, style: .default, handler: nil)
    alertController.addAction(alertOK)
    viewController?.present(alertController, animated: true, completion: nil)
}
