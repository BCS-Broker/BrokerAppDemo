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
  
        return [ BrokerDataAppService.initSingleton(dadataSecret: "",
                                                      qntSoftSecret: ""),
                   AppNotificationCenter.shared,
        
                   InterfaceOrientations.shared,
                   IQKeyboardAppService(),
                   AppearanceAppService(),
        
                   AppCoordinator.shared,
                   ModulesAppService(partnerGUID: "")
               ]
    }
}

extension AppDelegate : LoggerDelegate {
    public func didRecieveLog(log: Logger.Log, logger: Logger) {
           debugPrint(log.text)
       }
}
