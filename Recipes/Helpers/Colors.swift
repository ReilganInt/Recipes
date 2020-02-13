//
//  Colors.swift
//  Recipes
//
//  Created by admin on 13.02.2020.
//  Copyright © 2020 Rinat Kutuev. All rights reserved.
//

import UIKit

enum Colors {
    enum Button {
        enum Background {
            static let defaultColor = UIColor(red: 221/255, green: 221/255, blue: 229/255, alpha: 1)
        }
        enum Title {
            static let defaultColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
            static let backColor = UIColor(red: 209/255, green: 211/255, blue: 212/255, alpha: 1)
        }
    }
    enum Label {
        static let error = UIColor(red: 255/255, green: 1/255, blue: 1/255, alpha: 1)
    }
}
