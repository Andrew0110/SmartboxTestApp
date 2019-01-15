//
//  BaseViewController.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    lazy private var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.transform = CGAffineTransform(scaleX: 2, y: 2)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor(red: 0.18, green: 0.66, blue: 1.0, alpha: 1.0)
        
        view.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        let horizontalConstraint = activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let verticalConstraint = activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint])
        
        return activityIndicator
    }()
    
    // MARK: - Alert
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: Constants.AlertTexts.ok, style: UIAlertAction.Style.default, handler: {(action) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(error: Error) {
        showAlert(title: Constants.AlertTexts.error, message: error.localizedDescription)
    }
    
    // MARK: - Activity Indicator
    func activityIndicator(active: Bool) {
        active ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
}
