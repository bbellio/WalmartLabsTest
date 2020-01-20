//
//  ProductController.swift
//  WalmartLabsTest
//
//  Created by Bethany Wride on 1/20/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import UIKit

class ProductController {
    private static let productURL = URL(string: "https://mobile-tha-server.firebaseapp.com/walmartproducts/1/15")
    private static let imageURL = URL(string: "https://mobile-tha-server.firebaseapp.com")
    
    static func getProducts(completion: @escaping ([Product]) -> Void) {
        guard let unwrappedFinalURL = productURL else { return }
        URLSession.shared.dataTask(with: unwrappedFinalURL) { (data, _, error) in
            if let error = error {
                print("Error in dataTask : \(error.localizedDescription) \n---\n \(error)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("No data")
                completion([])
                return
            }
            
            do {
                let decodedSearchResults = try JSONDecoder().decode(DataResults.self, from: data)
                completion(decodedSearchResults.products)
            } catch {
                let error = error
                print("Error decoding data: \(error)")
            }
        }.resume()
    } // End of function
    
    static func getImageFor(product: Product, completion: @escaping (UIImage?) -> Void) {
        guard let unwrappedImageURL = imageURL else {
            print("No URL")
            completion(nil)
            return
        }
        
        let imageURLWithValue = unwrappedImageURL.appendingPathComponent(product.productImage)
        
        URLSession.shared.dataTask(with: imageURLWithValue) { (data, _, error) in
            if let error = error {
                print("Error in dataTask : \(error.localizedDescription) \n---\n \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data")
                completion(nil)
                return
            }
            
            guard let image = UIImage(data: data) else {
                print("No image")
                return
            }
            completion(image)
        }.resume()
    } // End of function
}
