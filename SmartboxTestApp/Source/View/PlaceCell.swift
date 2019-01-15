//
//  TTPlaceCell.swift
//  SmartboxTestApp
//
//  Created by Andrew on 14.01.2019.
//  Copyright © 2019 Andrew. All rights reserved.
//

import UIKit

class PlaceCell: UITableViewCell {

    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeTitleLabel: UILabel!
    @IBOutlet weak var shortDescriptionLabel: UILabel!
    
    var imageURL: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupImageView()
    }

    func setupImageView() {
        placeImageView.layer.cornerRadius = placeImageView.frame.width / 2
    }
    
    func configure(with place:Place) {
        placeTitleLabel.text = place.title
        shortDescriptionLabel.text = place.shortDescription
        
        imageURL = place.smallImage
        placeImageView.setImage(imageURL: place.smallImage) { [weak self] (image) in
            if let image = image, self?.imageURL == place.smallImage {
                DispatchQueue.main.async {
                    self?.placeImageView.image = image
                }
            }
        }
    }
}
