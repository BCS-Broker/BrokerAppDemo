import UserNotifications

import RxSwift

import ModuleCore
import BCSSwiftTools

import BrokerData
import BrokerServiceModule
import BrokerApp

class BrokerAppDemoDelegate: BrokerAppDelegate, LoggerDelegate, ScannerDelegate, RemoteConfigDelegate {
    
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
            BrokerDataAppService.initSingleton(broDataConfiguration: .brokerTest()),
            AppNotificationCenter.shared,
            PushNotificationAppService.shared,
            DeepLink.shared,
            Shortcut.shared,
            InterfaceOrientations.shared,
            IQKeyboardAppService(),
            AppearanceAppService(),
            ModulesAppService(),
            AppCoordinator.shared]
    }
    
    override var launchViewForRestoreSession: UIView {
        let view: UIView
        let darkTheme: Bool
        if #available(iOS 13.0, *) {
            view = UIView(backgroundColor: .systemBackground)
            darkTheme = view.traitCollection.userInterfaceStyle == .dark
        } else {
            view = UIView(backgroundColor: .white)
            darkTheme = false
        }
        
        let indicator = UIActivityIndicatorView(style: darkTheme ? .white : .gray)
        indicator.startAnimating()
        
        let logoBCS = UIImageView(image: UIImage(named: "logoBcs"))
        view.add(subviews: logoBCS, indicator)
        logoBCS.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        indicator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100 + UIView.bottomSafeAreaHeight)
        }
        
        return view
    }
    
    func presentScanBankCard(vc: UIViewController, publishSubject: RxSwift.PublishSubject<BrokerApp.ScanBankCardData>) {}

    func presentScanPassport(vc: UIViewController, publishSubject: RxSwift.PublishSubject<BrokerApp.ScanPassportData>) {}
}
 
