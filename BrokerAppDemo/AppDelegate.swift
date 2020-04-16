import UserNotifications

import RxSwift
import ModuleCore
import BCSSwiftTools
import BrokerData
import BrokerServiceModule
import BrokerApp

class BrokerAppDemoDelegate: BrokerAppDelegate {
    
    override var services: [ApplicationService] {
        Application.remoteConfigDelegate = self
        Application.scannerDelegate = self
        Application.brokerAppDelegate = self
        Application.loogerDelegate = self
        
        /*
         Учетки для тестового конфигуратора (смотрит на тестовые сервера)
         login: "k-999901", password: "Qwerty12345"
         login: "k-9999903", password: "Zxcvbn123"
         login: "k-9999101", password: "Zxcvbn123"
         
         
         ТЕСТОВЫЙ:
         BrokerDataAppService.initSingleton(broDataConfiguration: .brokerTest())
         
         БОЕВОЙ:
         BrokerDataAppService.initSingleton(broDataConfiguration: .brokerProduction())
           
         */
        
        return [
            BrokerDataAppService.initSingleton(broDataConfiguration: .brokerProduction()),
            Customizer(), // в этом сервисе кастомизируем приложение
            AppNotificationCenter.shared,
            PushNotificationAppService.shared,
            DeepLink.shared,
            Shortcut.shared,
            InterfaceOrientations.shared,
            IQKeyboardAppService(), 
            ModulesAppService(),
            AppCoordinator.shared]
    }
}
 
 
extension BrokerAppDelegate: ScannerDelegate {
    
    public func presentScanBankCard(vc: UIViewController, publishSubject: RxSwift.PublishSubject<BrokerApp.ScanBankCardData>) {
    
    }

    public func presentScanPassport(vc: UIViewController, publishSubject: RxSwift.PublishSubject<BrokerApp.ScanPassportData>) {
        
    }
}

/// Делегат для оработки события логирования
extension BrokerAppDelegate: LoggerDelegate {
    
    public func didRecieveLog(log: Logger.Log, logger: Logger) {
        
    }
}

/// Делегат удаленного конфигурирования
extension BrokerAppDelegate: RemoteConfigDelegate {
    
}
