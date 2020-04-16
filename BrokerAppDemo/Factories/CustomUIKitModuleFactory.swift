//
//  CustomBrokerUIKitModuleFactory.swift
//  BrokerAppCustomizedDemoApp
//
//  Created by Alexey Nenastev on 10.04.2020.
//  Copyright © 2020 ru.bcs. All rights reserved.
//

import BrokerUIKit
import BrokerData
import ModuleCore
import RxSwift
import BrokerApp
import BCSSwiftTools

final class CustomUIKitModuleFactory: BrokerUIKitModuleFactoryType {
    func onboarding() -> CompletionScene<Void> {
        let pages: [OnboardingPage] = [.init("1",
                                             image: UIImage(named: "rick4")!,
                                             title: "Брокер №1",
                                             description: "",
                                             button: "Wow"),
                                       .init("2",
                                             image: UIImage(named: "rick3")!,
                                             title:  "Готовые инвестиционные решения",
                                             description: "",
                                             button: "ОК, ЧТО ЕЩЕ?"),
                                       .init("3",
                                             image: UIImage(named: "rick2")!,
                                             title: "Лучшая финансовая аналитика",
                                             description: "",
                                             button: "ОТЛИЧНО!")]
        
        let vc = OnboardingVC(pages: pages, imageMode: .fullscreen)
        vc.closeButton.tintColor = .white
        let navigator = UINavigationController(rootViewController: vc)
        navigator.isNavigationBarHidden = true
        return CompletionScene(navigator, completion: vc.onboardingCompleted.asObservable())
    }
    
    func onboardPage(page: OnboardingPage) -> UIViewController {
        CustomOnboardingPageVC(page: page)
    }
}

