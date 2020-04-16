//
//  CustomPortfelModuleFactory.swift
//  BrokerAppCustomizedDemoApp
//
//  Created by Alexey Nenastev on 11.04.2020.
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

final class CustomPortfelModuleFactory: PortfelModuleFactoryType {
    
    func portfel() -> Scene {
        let scene = PortfelVC()
        scene.navigationBar.leftButton = nil
        scene.navigationBar.rightButton2 = nil
        scene.navigationBar.rightButton = scene.currencyButton
        let reactor = PortfelReactor()
        reactor.inject(interactor: PortfelInteractor(), coordinator: PortfelCoordinator(scene: scene))
        scene.inject(reactor)
        return scene
    }
    
    func portfelHeader() -> PortfelHeaderScene {
        let scene = CustomPortfelHeaderVC()
        let reactor = PortfelHeaderReactor()
        reactor.inject(PortfelHeaderCoordinator(scene: scene))
        scene.inject(reactor)
        return PortfelHeaderScene(scene: scene,
                                  portfel: scene.rx.portfel,
                                  inProgress: scene.rx.inProgress,
                                  periodPicked: scene.rx.periodPicked)
    }
}

