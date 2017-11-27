//
//  File.swift
//  CustomTableCellExample
//
//  Created by Shani on 11/13/17.
//  Copyright © 2017 Shani Rivers. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject
{
    var id: String
    var category: String
    var recipeTitle: String
    var prepTime: Int
    var difficulty: Int
    var serves: Int
    var dishImage: UIImage?
    var featuredFlag: Bool
    
    init (category: String, recipeTitle: String, prepTime: Int, difficulty: Int, serves: Int, dishImage: UIImage?, featuredFlag: Bool)
    {
        self.id = UUID().uuidString
        self.category = category
        self.recipeTitle = recipeTitle
        self.prepTime = prepTime
        self.difficulty = difficulty
        self.serves = serves
        self.dishImage = dishImage
        self.featuredFlag = featuredFlag
    }
}

