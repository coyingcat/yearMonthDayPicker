//
//  FontAdd.swift
//  
//
//  Created by 杰克 伦敦 on 2019/8/23.
//

import UIKit



enum FontWeight: String {
    case light = "Light"
    case regular = "Regular"
    case medium = "Medium"
    
    case semibold = "Semibold"
    case bold = "Bold"
    case heavy = "Heavy"
}

enum FontType: String {
    case PingFangSC = "PingFangSC"
    case SFProText = "SFProText"
    case Think = "SourceHanSerifCN"
}

extension UIFont {
    
    static func heavy(ofSize fontSize: CGFloat, type: FontType = .PingFangSC) -> UIFont {
        return customFont(type, weight: .heavy, fontSize: fontSize)
    }
    
    static func regular(ofSize fontSize: CGFloat, type: FontType = .PingFangSC) -> UIFont {
        return customFont(type, weight: .regular, fontSize: fontSize)
    }
    
    static func bold(ofSize fontSize: CGFloat, type: FontType = .PingFangSC) -> UIFont {
        return customFont(type, weight: .bold, fontSize: fontSize)
    }
    
    static func light(ofSize fontSize: CGFloat, type: FontType = .PingFangSC) -> UIFont {
        return customFont(type, weight: .light, fontSize: fontSize)
    }
    
    static func medium(ofSize fontSize: CGFloat, type: FontType = .PingFangSC) -> UIFont {
        return customFont(type, weight: .medium, fontSize: fontSize)
    }
    
    static func semibold(ofSize fontSize: CGFloat, type: FontType = .PingFangSC) -> UIFont {
        return customFont(type, weight: .semibold, fontSize: fontSize)
    }
    
    /// 自定义字体
    static func customFont(_ type: FontType, weight: FontWeight, fontSize realFontSize: CGFloat) -> UIFont {
        if let customFont = UIFont(name: "\(type.rawValue)-\(weight.rawValue)", size: realFontSize) {
            return customFont
        }
     
        var systemWeight = UIFont.Weight.regular
        switch weight {
        case .light:
            systemWeight = UIFont.Weight.light
        case .regular:
            systemWeight = UIFont.Weight.regular
        case .medium:
            systemWeight = UIFont.Weight.medium
        case .semibold:
            systemWeight = UIFont.Weight.semibold
        case .bold:
            systemWeight = UIFont.Weight.bold
        case .heavy:
            systemWeight = UIFont.Weight.heavy
        }
        return UIFont.systemFont(ofSize: realFontSize, weight: systemWeight)
    }
}





extension UIFont {

    static let scoreName = UIFont.medium(ofSize: 16)
    static let headerFirstThree = UIFont.medium(ofSize: 22)
    static let accountListTitle = UIFont.regular(ofSize: 16)
    
    
    
    static let myStudyTitle = UIFont.medium(ofSize: 18)
    static let myStudyListScoreName = UIFont.medium(ofSize: 14)
    static let loginHeaderName = UIFont.medium(ofSize: 16)

    
}





extension UIFont{
    
    static func omiX(ofSize fontSize: CGFloat, type: FontType = .Think) -> UIFont {
        if let customFont = UIFont(name: "\(type.rawValue)", size: fontSize) {
            return customFont
        }
        return UIFont.systemFont(ofSize: fontSize, weight: UIFont.Weight.regular)
    }
    
    
}
