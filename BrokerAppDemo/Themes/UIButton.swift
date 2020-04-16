//
//  Button+CustomTheme.swift
//  BrokerAppCustomizedDemoApp
//
//  Created by Alexey Nenastev on 10.04.2020.
//  Copyright © 2020 ru.bcs. All rights reserved.
//

import BrokerUIKit

extension UIButton.Themes {
    public static func rickAndMorty(for name: UIButton.StyleName) -> Style<UIButton> {
               switch name {
               case .bgGreenBlue_textRegular15Teal:
                   return UIButton.makeStyle(bgColor: UIColor.pallete.greenBlue.withAlphaComponent(0.2),
                                             titleColorNormal: UIColor.pallete.teal,
                                             font: .regular15,
                                             cornerRadius: 0)
               case .bgGreenBlue_textSemibold11White_rounded: // main
                   return UIButton.makeStyle(bgColor: UIColor.pallete.greenBlue, titleColorNormal: .white, font: .semibold11, cornerRadius: 0)
                   
               case .bgGreenBlue_textBold13White_rounded: // main
                   return UIButton.makeStyle(bgColor: UIColor.pallete.greenBlue, titleColorNormal: .white, font: .bold13, cornerRadius: 0)

               case .bgRedPink_textBold13White_rounded: // alternativa
                   return UIButton.makeStyle(bgColor: UIColor.pallete.redPink, titleColorNormal: .white, font: .bold13, cornerRadius: 0)

               case .bgDarkGreyBlue_textBold13White_rounded: // иис
                   return UIButton.makeStyle(bgColor: UIColor.pallete.darkGreyBlue, titleColorNormal: .white, font: .semibold11, cornerRadius: 0)

               case .bgAzul_textSemibold11White_rounded: // default
                   return UIButton.makeStyle(bgColor: UIColor.pallete.azul, titleColorNormal: .white, font: .semibold11, cornerRadius: 0)

               case .bgAzul_textBold13White_rounded: // default
                   return UIButton.makeStyle(bgColor: UIColor.pallete.azul, titleColorNormal: .white, font: .bold13, cornerRadius: 0)

               case .bgClear_textSemibold11White_rounded_borderAzul:
                   return UIButton.makeStyle(bgColor: .clear, titleColorNormal: UIColor.pallete.azul, font: .semibold11, cornerRadius: 0, borderColor: UIColor.pallete.azul)

               case .bgClear_textBold13Azul_rounded_borderAzul:
                   return UIButton.makeStyle(bgColor: .clear, titleColorNormal: UIColor.pallete.azul, font: .bold13, cornerRadius: 0, borderColor: UIColor.pallete.azul)

               case .bgClear_rounded_borderAzul:
                   return UIButton.makeStyle(bgColor: .clear, cornerRadius: 0, borderColor: UIColor.pallete.azul)
                   
               case .bgClear_selectedBgAzul: // sort
                   return UIButton.makeStyle(bgColor: .clear, bgColorSelected: UIColor.pallete.azul)
                   
               case .bgClear_textSemibold17Azul: // more
                   return UIButton.makeStyle(bgColor: .clear, titleColorNormal: UIColor.pallete.azul, font: .semibold17)
                   
               case .bgClear_textSemibold13White: // white
                   return UIButton.makeStyle(bgColor: .clear, titleColorNormal: UIColor.pallete.white, font: .bold13)
                   
               case .bgClear_textBold13Azul: // link
                   return UIButton.makeStyle(bgColor: .clear, titleColorNormal: UIColor.pallete.azul, font: .bold13)
                   
               case .bgClear_textBold13redPink: // link
                   return UIButton.makeStyle(bgColor: .clear, titleColorNormal: UIColor.pallete.redPink, font: .bold13)
                   
               case .bgClear_textRegular15Azul:
                   return UIButton.makeStyle(bgColor: .clear, titleColorNormal: UIColor.pallete.azul, font: .regular15)
                   
               case .bgClear_textRegular15Black:
                   return UIButton.makeStyle(bgColor: .clear, titleColorNormal: UIColor.pallete.black, font: .regular15)
                   
               case .bgAzul_textBold17White_rounded:
                   return UIButton.makeStyle(bgColor: UIColor.pallete.azul, titleColorNormal: .white, font: .bold17, cornerRadius: 0)
               
               case .bgAzul_textBold10AzulRounded:
                   return UIButton.makeStyle(bgColor: UIColor.pallete.azul.withAlphaComponent(0.2), titleColorNormal: UIColor.pallete.azul, font: .bold10, cornerRadius: 0)
               }
           }
}
