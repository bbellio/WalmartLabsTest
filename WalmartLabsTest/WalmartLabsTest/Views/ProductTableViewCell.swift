//
//  ProductTableViewCell.swift
//  WalmartLabsTest
//
//  Created by Bethany Wride on 1/23/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    var product: Product? {
        didSet {
            updateViews()
            setImage()
            setStars()
        }
    }
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func updateViews() {
        guard let product = product else { return }
        productTitleLabel.text = product.productName
        priceLabel.text = product.price
    }
    
    func setImage() {
        guard let product = product else { return }
        ProductController.getImageFor(product: product) { (image) in
            DispatchQueue.main.async {
                self.productImage.image = image
            }
        }
    }
    
    func setStars() {
        guard let product = product else { return }
        if product.reviewRating > 0 && product.reviewRating < 1 {
            star1.image = UIImage.init(systemName: "star.lefthalf.fill")
            star2.image = UIImage.init(systemName: "star")
            star3.image = UIImage.init(systemName: "star")
            star4.image = UIImage.init(systemName: "star")
            star5.image = UIImage.init(systemName: "star")
        } else if product.reviewRating > 1 && product.reviewRating < 2 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.lefthalf.fill")
            star3.image = UIImage.init(systemName: "star")
            star4.image = UIImage.init(systemName: "star")
            star5.image = UIImage.init(systemName: "star")
        } else if product.reviewRating > 2 && product.reviewRating < 3 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
            star3.image = UIImage.init(systemName: "star.lefthalf.fill")
            star4.image = UIImage.init(systemName: "star")
            star5.image = UIImage.init(systemName: "star")
        } else if product.reviewRating > 3 && product.reviewRating < 4 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
            star3.image = UIImage.init(systemName: "star.fill")
            star4.image = UIImage.init(systemName: "star.lefthalf.fill")
            star5.image = UIImage.init(systemName: "star")
        } else if product.reviewRating > 4 && product.reviewRating < 5 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
            star3.image = UIImage.init(systemName: "star.fill")
            star4.image = UIImage.init(systemName: "star.fill")
            star5.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if product.reviewRating == 5 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
            star3.image = UIImage.init(systemName: "star.fill")
            star4.image = UIImage.init(systemName: "star.fill")
            star5.image = UIImage.init(systemName: "star.fill")
        } else if product.reviewRating == 4 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
            star3.image = UIImage.init(systemName: "star.fill")
            star4.image = UIImage.init(systemName: "star.fill")
            star5.image = UIImage.init(systemName: "star")
        } else if product.reviewRating == 3 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
            star3.image = UIImage.init(systemName: "star.fill")
            star4.image = UIImage.init(systemName: "star")
            star5.image = UIImage.init(systemName: "star")
        } else if product.reviewRating == 2 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
            star3.image = UIImage.init(systemName: "star")
            star4.image = UIImage.init(systemName: "star")
            star5.image = UIImage.init(systemName: "star")
        } else if product.reviewRating == 1 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star")
            star3.image = UIImage.init(systemName: "star")
            star4.image = UIImage.init(systemName: "star")
            star5.image = UIImage.init(systemName: "star")
        } else {
            star1.image = UIImage.init(systemName: "star")
            star2.image = UIImage.init(systemName: "star")
            star3.image = UIImage.init(systemName: "star")
            star4.image = UIImage.init(systemName: "star")
            star5.image = UIImage.init(systemName: "star")
        }
    }
}
