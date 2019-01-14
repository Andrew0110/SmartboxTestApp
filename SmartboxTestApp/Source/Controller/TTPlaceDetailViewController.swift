//
//  TTPlaceDetailViewController.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class TTPlaceDetailViewController: UIViewController {
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var shortInfoLabel: UILabel!
    @IBOutlet weak var detailInformationLabel: UILabel!
    
    var place: TTPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func setupViews() {
        placeTitleLabel.text = ""
        shortInfoLabel.text = ""
        detailInformationLabel.text = ""
        imageHeightConstraint.constant = 0
        guard let place = place else {
            return
        }
        placeTitleLabel.text = place.title
        shortInfoLabel.text = place.shortDescription
        detailInformationLabel.text = place.description

        updateImage()
    }

    private func updateImage() {
        guard let place = place else {
            return
        }
        placeImageView.setImage(imageURL: place.bigImage) { [weak self] (image) in
            guard let strongself = self else { return }
            DispatchQueue.main.async {
                if image == nil {
                    strongself.imageHeightConstraint.constant = 0
                } else {
                    strongself.placeImageView.image = image
                    let ratio = image!.size.height / image!.size.width
                    strongself.imageHeightConstraint.constant = strongself.view.bounds.width * ratio
                }
//                strongself.view.layoutIfNeeded()
            }
        }
    }
    
// MARK: - Actions
    @IBAction func backBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showMapClicked(_ sender: UIButton) {
        
    }
    
}
