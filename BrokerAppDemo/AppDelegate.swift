//
//  AppDelegate.swift
//  MyBrokerX
//
//  Created by Andrey Raevnev on 24/04/2019.
//  Copyright © 2019 Andrey Raevnev. All rights reserved.
//
import BrokerApp
import BCSSwiftTools
 
class AppDelegate: BrokerAppDelegate {
    
    override var services: [ApplicationService] { 
        Application.brokerAppDelegate = self
        Application.loogerDelegate = self
  
        return [ BrokerDataAppService.initSingleton(dadataSecret: "Token cdf0235a3a74b5ca1c7adcc72b40d41f2d318cdd",
                                                      qntSoftSecret: "f890ca54-6329-478b-981e-e5825cc2929c"),
                   AppNotificationCenter.shared,
        
                   InterfaceOrientations.shared,
                   IQKeyboardAppService(),
                   AppearanceAppService(),
        
                   AppCoordinator.shared,
                   ModulesAppService(partnerGUID: "4D50D6E6-8FE6-4E68-A94D-018684D5181A")
               ]
    } 
}

extension AppDelegate : LoggerDelegate {
    public func didRecieveLog(log: Logger.Log, logger: Logger) {
           debugPrint(log.text)
       }
}
