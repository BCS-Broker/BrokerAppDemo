//
//  CustomBrokerAppFactory.swift
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
import ModuleCore
import BrokerPortfelModule
import BrokerServiceModule
import BrokerInformationModule
import BrokerQuotesModule

final class CustomBrokerAppFactory: BrokerAppFactoryType {
    
    private var tvMenuItem: MoreMenuItem {
        .init(title: "Межгалактическое TV",
              image: UIImage(named: "tv"),
              sceneBuilder: { UIViewController()})
    }
    
    private var instagrammMenuItem: MoreMenuItem {
        .init(title: "Наш инстаграмм",
              image: UIImage(named: "instagramm"),
              sceneBuilder: { UIViewController()})
    }
    
    
    private var githubMenuItem: MoreMenuItem {
        .init(title: "Проект на GitHub",
              image: UIImage(named: "github"),
              sceneBuilder: { UIViewController()})
    }
    var moreMenuItem: [MoreMenuItem] {  [.tariffs, .documents, .feedBack, .faq, .settings, instagrammMenuItem, tvMenuItem, githubMenuItem ]  }
    
    func startInNavigator(delegate: UIGestureRecognizerDelegate, forceShowSignIn: Bool) -> CompletionScene<StartSceneResult> {
        
        BrokerAppModule.shared.resetStartSceneActionPublisher()
        
        let sv = CustomStartVC(forceShowSignIn: forceShowSignIn)
        let sr = StartReactor()
        sr.inject(interactor: StartInteractor(), coordinator: StartCoordinator(scene: sv))
        sv.inject(sr)
        let navigator = UINavigationController(rootViewController: sv)
        navigator.isNavigationBarHidden = true
        navigator.interactivePopGestureRecognizer?.delegate = delegate
        navigator.interactivePopGestureRecognizer?.isEnabled = true
        return CompletionScene(navigator, sr)
    }
    
    func tabs(delegate: UIGestureRecognizerDelegate, navDelegate: UINavigationControllerDelegate) -> Scene {
        func createTab(_ vc: Scene, _ title: String? = nil,  image: UIImage?, selectedImage: UIImage? = nil ) -> UINavigationController {
            let nc = UINavigationController(rootViewController: vc)
            nc.interactivePopGestureRecognizer?.delegate = delegate
            nc.interactivePopGestureRecognizer?.isEnabled = true
            nc.delegate = navDelegate
            nc.isNavigationBarHidden = true
            
            nc.tabBarItem = UITabBarItem(title: title,
                                         image: image?.withRenderingMode(.alwaysOriginal),
                                         selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
            return nc
        }
        
        /// Портфель
        let portfelTab = createTab(PortfelModule.shared.factory.portfelByUserSession(),
                                   "Портфель",
                                   image: UIImage(named: "rick_tab_bar"),
                                   selectedImage: UIImage(named: "rick_tab_bar_filled"))
        
        /// Котировки
        let quotesTab = createTab(QuotesModule.shared.factory.quotesByUserSession(),
                                  "Котировки",
                                  image: UIImage(named: "galaxy"),
                                  selectedImage: UIImage(named: "galaxy_filled"))
        
        /// Для вас
        let productsRoot = productsScene()
        productsRoot.navigationItem.title = "Для Вас"
        productsRoot.navigationItem.largeTitleDisplayMode = .never
        let productsTab = createTab(productsRoot, "Для вас",
                                    image: UIImage(named: "alien"),
                                    selectedImage: UIImage(named: "alien_filled"))
        productsTab.isNavigationBarHidden = false
        productsTab.navigationBar.prefersLargeTitles = false
        
        
        // Инфо
        let infoRoot = InformationModule.shared.factory.alertsShowCase(delegate: nil).0
        infoRoot.navigationItem.title = "Инфо"
        infoRoot.navigationItem.largeTitleDisplayMode = .always
        let infoTab = createTab(infoRoot, "Инфо",
                                image: UIImage(named: "satellite"),
                                selectedImage: UIImage(named: "satellite_filled"))
        infoTab.isNavigationBarHidden = false
        infoTab.navigationBar.prefersLargeTitles = true
        
        // Профиль
        let moreScene = ServiceModule.shared.factory.more(items: moreMenuItem)
        let moreTab = createTab(moreScene, "Профиль", image: UIImage.brokerApp(.tabBarMore))
        
        
        
        let mainTabVC = MainTabsVC()
        mainTabVC.setViewControllers([portfelTab, quotesTab, productsTab, infoTab, moreTab], animated: false)
        mainTabVC.selectedIndex = MainTab.defaultTab.rawValue
        
        return mainTabVC
    }
}

fileprivate extension CustomBrokerAppFactory {
    
    func productsScene() -> UIViewController {
        UIStoryboard(name: "CustomProductsScene", bundle: nil).instantiateViewController(withIdentifier: "CustomProducts") as UIViewController
    }
}
