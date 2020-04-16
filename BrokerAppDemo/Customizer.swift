//
//  CustomAppearance.swift
//  BrokerAppCustomizedDemoApp
//
//  Created by Alexey Nenastev on 10.04.2020.
//  Copyright © 2020 ru.bcs. All rights reserved.
//

import UIKit
import BrokerUIKit
import SkeletonView
import BCSSwiftTools
import BrokerApp
import BrokerAuthModule
import BrokerPortfelModule

public final class Customizer: NSObject, ApplicationService {
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        ///Конфигурируем UI по дефолту
        BroUI.configurate()
        
        ///Переопределяем assets (изображения)
        ///Те изображения которые хотим переопределить кладем в Assets приложения
        BrokerUIKitModule.shared.assetsBundle = Bundle(for: Customizer.self)
        
        ///Переопределяем цветовую палитру
        var pallete = BrokerAppColorPallete.default
        pallete.azulLight = UIColor(hexString: "#2a6096")
        pallete.azulDark = pallete.azulLight
        pallete.accountIIALeftLight =  UIColor(hexString: "#609A61")
        pallete.accountIIALeftDark  = pallete.accountIIALeftLight
        pallete.accountIIARightLight =  pallete.accountIIALeftLight
        pallete.accountIIARightDark  = pallete.accountIIARightLight
        pallete.accountMainLeftLight = pallete.accountIIALeftLight
        pallete.accountMainLeftDark = pallete.accountMainLeftLight
        pallete.accountMainRightLight = pallete.accountMainLeftLight
        pallete.accountMainRightDark = pallete.accountMainLeftLight
        UIColor.set(pallete: pallete)
         
        /// Переопределяем шрифты
        var fontPallet = BrokerAppFontPallete.default
        fontPallet.regular = UIFont(name: "Avenir", size: 10)!
        fontPallet.medium = UIFont(name: "Avenir-Medium", size: 10)!
        fontPallet.semibold = UIFont(name: "Avenir-Heavy", size: 10)!
        fontPallet.bold = UIFont(name: "Avenir-Black", size: 10)!
        UIFont.set(pallete: fontPallet)
        
        /// Переопределяем наборы стилей
        UIButton.set(styleProvider: UIButton.Themes.rickAndMorty)
        BrokerButton.set(styleProvider: UIButton.Themes.rickAndMorty)
        BroTextField.set(styleProvider: BroTextField.Themes.rickAndMorty)
        
        /// Подменяем фабрики экранов на свои реализации
        BrokerUIKitModule.shared.set(factory: CustomUIKitModuleFactory())
        BrokerAppModule.shared.set(factory: CustomBrokerAppFactory())
        PortfelModule.shared.set(factory: CustomPortfelModuleFactory())
        
        return true
    }
}
