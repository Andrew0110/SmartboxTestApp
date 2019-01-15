//
//  TTPlaceDetailViewController.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class PlaceDetailViewController: BaseViewController {
    
    @IBOutlet weak private var placeImageView: UIImageView!
    @IBOutlet weak private var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak private var placeTitleLabel: UILabel!
    @IBOutlet weak private var shortInfoLabel: UILabel!
    @IBOutlet weak private var detailInformationLabel: UILabel!
    
    private var place: Place?
    
    //  MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cleanViews()
        setupPlace()
    }
    
    //  MARK: - Setters
    func setPlace(_ place: Place) {
        self.place = place
    }
    
    //  MARK: - UI setup
    private func cleanViews() {
        placeTitleLabel.text = ""
        shortInfoLabel.text = ""
        detailInformationLabel.text = ""
        imageHeightConstraint.constant = 0
    }
    
    private func setupPlace() {
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
            }
        }
    }
    
    // MARK: - Actions
    @IBAction private func backBtnClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func showMapClicked(_ sender: UIButton) {
        guard let place = place else { return }
        let vc = MapViewController.storyboardInstance()
        vc.setPlace(place)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
