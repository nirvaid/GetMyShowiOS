//
//  UIImage+Async.swift
//  GetMyShows
//
//  Created by user220159 on 4/24/22.
//

import UIKit
import AlamofireImage

extension UIImageView {
    func setImageFromUrl(_ urlString: String, completion : @escaping () -> ()){
        
        guard let url = URL(string: urlString) else {
            //assertionFailure("Can't set image without image URL")
            return
        }
        
        af.setImage(withURL: url , completion: { _ in
            completion()
        })
    }
}
