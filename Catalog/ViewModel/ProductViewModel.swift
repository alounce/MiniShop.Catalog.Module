//
//  File.swift
//  MiniShop
//
//  Created by Alexander Karpenko on 3/25/18.
//  Copyright © 2018 Alexander Karpenko. All rights reserved.
//

import Foundation
import MiniShop_Shared

public struct ProductViewModel {
    var model: Product
    
    public var priceString: String {
        return Formatter.stringFromMoney(model.price)
    }
    
    public var title: String { return model.title }
    public var details: String { return model.details }
}
