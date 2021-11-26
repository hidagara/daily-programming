//
//  AppColors.swift
//  MVC-example
//
//  Created by Roman Guseynov on 28.10.2021.
//

import Foundation
import UIKit


public struct AppColors {
    static let prussianBlue = AppColors.hexStringToUIColor(hex: "002642")
    static let claret = AppColors.hexStringToUIColor(hex: "840032")
    static let gamboge = AppColors.hexStringToUIColor(hex: "E59500")
    static let gainsboro = AppColors.hexStringToUIColor(hex: "E5DADA")
    static let richBlackFogra29 = AppColors.hexStringToUIColor(hex: "02040F")
    
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}


