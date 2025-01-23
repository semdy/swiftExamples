//
//  Utils.swift
//  CoreTextDemo
//
//  Created by Chu Guimin on 17/3/3.
//  Copyright © 2017年 cgm. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    
    /// 将16进制颜色如#FF0000，转换为UIColor
    ///
    /// - Parameter hexString: 16进制颜色
    convenience init(hexString: String) {
//        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var hex = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
                
        // 如果传入的颜色字符串以#开头，移除#
        if hex.hasPrefix("#") {
            hex.removeFirst()
        }
        
        // 让字符串成为大写（不区分大小写）
        hex = hex.uppercased()
        
        var int: UInt64 = 0
        // 使用 Scanner 来扫描 hex 字符串
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    /// 通过浮点数字来设置颜色
    ///
    /// - Parameters:
    ///   - red: R
    ///   - green: G
    ///   - blue: B
    /// - Returns: 相应的颜色对象
    public class func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
    
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
    }
}
