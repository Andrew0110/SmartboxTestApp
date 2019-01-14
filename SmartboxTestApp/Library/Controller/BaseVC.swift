//
//  BaseVC.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    var activityIndicator = UIActivityIndicatorView()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupActivityIndicator()
        activityIndicator.isHidden = true
    }
    
    // MARK: - Alert
    func showAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {(action) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(_ error:Error) {
        showAlert(title: "Ошибка", message: error.localizedDescription)
    }
    
    // MARK: - Activity Indicator
    private func setupActivityIndicator() {
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        activityIndicator.hidesWhenStopped = false
        activityIndicator.isHidden = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = UIColor(red: 0.18, green: 0.66, blue: 1.0, alpha: 1.0)
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        let horizontalConstraint = activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let verticalConstraint = activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
    }
    
    func showActivityIndicator() {
        activityIndicator.isHidden = false
    }
    
    func hideActivityIndicator() {
        activityIndicator.isHidden = true
    }
}
