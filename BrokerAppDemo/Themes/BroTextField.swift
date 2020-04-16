//
//  BroTextField.swift
//  BrokerAppCustomizedDemoApp
//
//  Created by Alexey Nenastev on 10.04.2020.
//  Copyright © 2020 ru.bcs. All rights reserved.
//

import BrokerUIKit

extension BroTextField.Themes {
    public static func rickAndMorty(for name: BroTextField.StyleName) -> Style<BroTextField> {
            switch name {
            case .default: return {
                $0.configuration = makeConfiguration()
                
                }
            case .datePicker: return {
                var config = makeConfiguration()
                config.withDataPicker = true
                $0.configuration = config
                }
            case .hidePlaceholderWhileEditing: return {
                var config = makeConfiguration()
                config.hidePlaceholderWhileEditing = true
                config.placeholderFont = UIFont.regular15
                $0.configuration = config
                }
            }
        }
}

fileprivate func makeConfiguration() -> BroTextField.Configuration {
    var config = BroTextField.Configuration()
   
    config.placeholderColor = UIColor.pallete.blueyGrey
    config.textColor = UIColor.pallete.black
    config.tintColor = UIColor.pallete.black

    config.editingBorderColor = UIColor.pallete.azul
    config.normalBorderColor = UIColor.pallete.separator
    config.redBorderColor = UIColor.pallete.redPink
    config.greenBorderColor = UIColor.pallete.teal

    config.normalTopLabelColor = UIColor.pallete.azul
    config.redTopLabelColor = UIColor.pallete.redPink
    config.greenTopLabelColor = UIColor.pallete.teal
    
    config.topLabelFont     = .systemFont(ofSize: 14, weight: .regular)
    config.placeholderFont  = .systemFont(ofSize: 16, weight: .semibold)
    config.textFont         = .systemFont(ofSize: 16, weight: .semibold)
    config.botLabelFont     = UIFont.regular13
    config.bottomLabelColor = UIColor.pallete.blueyGrey
    
    var disabledBackgroundColor: UIColor { .createColor(light: UIColor(hexString: "F2F4F9"), dark: UIColor(hexString: "2e2e31")) }
    config.disabledBackgroundColor = disabledBackgroundColor

    var disableTextColor: UIColor { .createColor(light: .black, dark: UIColor(hexString: "c5c8ce")) }
    config.disableTextColor = disableTextColor

    return config
}
