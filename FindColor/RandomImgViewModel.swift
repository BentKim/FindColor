//
//  RandomImgViewModel.swift
//  FindColor
//
//  Created by Taewoo Kim on 2022/01/31.
//

import Foundation
import UIKit
struct RandomImgViewModel {
    private let rndImg: RandomImage
    
    var thumbImg: UIImage?{
        if let url = URL(string: rndImg.urls.thumb), let data = try? Data(contentsOf: url){
            return UIImage(data: data)
        }
        return nil
    }
    
    var regularImg: UIImage?{
        if let url = URL(string: rndImg.urls.regular), let data = try? Data(contentsOf: url){
            return UIImage(data: data)
        }
        return nil
    }
    
    init(rndImg: RandomImage) {
        self.rndImg = rndImg
    }
}
