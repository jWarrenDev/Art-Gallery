//
//  PaintingTableViewCell.swift
//  ArtGallery
//
//  Created by Welinkton on 9/1/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class PaintingTableViewCell: UITableViewCell, PaintingTableViewCellDelegate {
    
    weak var delegate: PaintingTableViewCellDelegate?
    
    func likeButtonWasTapped(on cell: PaintingTableViewCell) {}
   
    
    func updateViews(){
        guard let painting = painting else {return}
            paintingImageView.image = painting.image
            painting.isLiked ? likeButton.setTitle("Like 😀", for: .normal) : likeButton.setTitle("Unlike 🤨", for: .normal)
        
//        Can also be written like this
        
//        let likeButtonTitle = painting.isLiked ? "Unlike" : "Like"
//        likeButton.setTitle(likeButtonTitle, for: .normal)
   }

    
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var paintingImageView: UIImageView!
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        delegate?.likeButtonWasTapped(on: self)
    }
    
    var painting: Painting? {
        didSet {
            updateViews()
        }
    }
}
