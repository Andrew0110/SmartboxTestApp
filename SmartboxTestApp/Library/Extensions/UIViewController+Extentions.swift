//
//  UIViewController+Extentions.swift
//  SmartboxTestApp
//
//  Created by Andrew on 1/14/19.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

// MARK: - Create Storyboard Instance
extension UIViewController {
    private static func storyboardInstancePrivate<T: UIViewController>() -> T {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as! T
    }
    static func storyboardInstance() -> Self {
        return self.storyboardInstancePrivate()
    }
}
