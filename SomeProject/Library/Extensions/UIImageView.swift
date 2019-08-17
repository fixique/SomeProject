//
//  UIImageView.swift
//  SomeProject
//
//  Created by Vladislav Krupenko on 17/08/2019.
//  Copyright © 2019 Fixique. All rights reserved.
//

import UIKit

extension UIImageView {

    func downloadImage(urlPath: String?, placeholder: UIImage? = nil) {
        image = placeholder
        guard let url = URL(string: urlPath ?? "") else {
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            if let error = error {
                #if DEBUG
                print("Error while donwload image: \(error.localizedDescription)")
                #endif
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    self?.image = UIImage(data: data)
                }
            }
        }.resume()
    }

}
