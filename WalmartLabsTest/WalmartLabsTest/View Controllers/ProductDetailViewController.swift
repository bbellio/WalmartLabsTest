//
//  ProductDetailViewController.swift
//  WalmartLabsTest
//
//  Created by Bethany Bellio on 1/20/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    // MARK: - Properties and Global Variables
    var product: Product?
    
    // MARK: - Outlets
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var inStockLabel: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var shortDescriptionTextView: UITextView!
    @IBOutlet weak var longDescriptionView: UITextView!
    @IBOutlet weak var aboutThisItemLabel: UILabel!
    @IBOutlet weak var moreDetailsLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        getImage()
    }
    
    // MARK: - Custom Methods
    func setUpViews() {
        guard let product = product else { return }
        productNameLabel.text = product.productName
        priceLabel.text = product.price
        inStockLabel.text = product.inStock ? "In Stock" : "Out of Stock"
        inStockLabel.textColor = product.inStock ? .green : .red
        setStars()
        reviewCount.text = product.reviewCount == 1 ? "\(product.reviewCount) Review" : "\(product.reviewCount) Reviews"
        shortDescriptionTextView.text = product.shortDescription != nil ? product.shortDescription?.attributedToString : "No details found."
        longDescriptionView.text = product.longDescription != nil ? product.longDescription?.attributedToString : "No additional details."
    }
    
    func setStars() {
        guard let product = product else { return }
        if product.reviewRating > 0 && product.reviewRating < 1 {
            star1.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if product.reviewRating > 1 && product.reviewRating < 2 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if product.reviewRating > 2 && product.reviewRating < 3 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
            star3.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if product.reviewRating > 3 && product.reviewRating < 4 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
            star3.image = UIImage.init(systemName: "star.fill")
            star4.image = UIImage.init(systemName: "star.lefthalf.fill")
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
        } else if product.reviewRating == 3 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
            star3.image = UIImage.init(systemName: "star.fill")
        } else if product.reviewRating == 2 {
            star1.image = UIImage.init(systemName: "star.fill")
            star2.image = UIImage.init(systemName: "star.fill")
        } else if product.reviewRating == 1 {
            star1.image = UIImage.init(systemName: "star.fill")
        }
    }
    
    func getImage() {
        guard let product = product else { return }
        ProductController.getImageFor(product: product) { (image) in
            DispatchQueue.main.async {
                 self.productImage.image = image
            }
        }
    }
}
