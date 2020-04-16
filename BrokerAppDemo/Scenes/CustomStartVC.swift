//
//  StartVC.swift
//  BrokerAuthModule
//
//  Created by Andrey Raevnev on 16/05/2019.
//  Copyright © 2019 Andrey Raevnev. All rights reserved.
//
import BrokerUIKit
import ModuleCore
import BrokerData
import BrokerServiceModule
import BrokerApp

final class CustomStartVC: BaseVC, SceneView {
    
    private let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "rick1"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
 
    private let loginButton: UIButton = {
        let loginButton = UIButton(style: .bgAzul_textBold13White_rounded, title: "Я КЛИЕНТ")
        loginButton.extendHitTestAreaToMinVertically = true
        return loginButton
    }()
    
    private let demoButton: UIButton = {
        let loginButton = UIButton(style: .bgAzul_textBold13White_rounded, title: "ДЕМО ВХОД")
        loginButton.extendHitTestAreaToMinVertically = true
        return loginButton
    }()
    
    private lazy var label = UILabel(font: UIFont(name: "Get Schwifty", size: 60)!,
                                     text: "My Broker",
                                     textColor: .white)
    
    private let becomeACustomerButton = UIButton(style: .bgAzul_textBold13White_rounded)
    
    private var forceShowSignIn: Bool
    
    init(forceShowSignIn: Bool) {
        self.forceShowSignIn = forceShowSignIn
        super.init()
        self.label.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
 
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        BroUI.statusBar(.byTheme)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        BroUI.statusBar(.byTheme)
    
        let title = AppContext.shared.isActual(.hasOpenAccountSessionPhone) ? "ПРОДОЛЖИТЬ ОТКРЫТИЕ СЧЕТА" : "ПЕРВЫЙ РАЗ ТУТ"
        becomeACustomerButton.setTitle(title, for: .normal)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if forceShowSignIn {
            forceShowSignIn = false
            DispatchQueue.main.async { self.fire(action: .tapSignInUser) }
        }
    }
    
    override func setupViewAndConstraints() {
        view.backgroundColor = UIColor.pallete.background
        let stack = UIStackView(.vertical, spacing: 20, distribution: .fill, alignment: .fill, views: label, demoButton, loginButton, becomeACustomerButton)
        view.add(subviews: imageView, stack)
        view.layoutMargins = .zero
        imageView.snp.makeToSuperview(.top, .bottom, .leftRight)
        
        view.layoutMargins = .init(top: 80, left: 16, bottom: 0, right: 16)
        
        loginButton.snp.makeSelf(constraints: .height(40))
        becomeACustomerButton.snp.makeSelf(constraints: .height(40))
        demoButton.snp.makeSelf(constraints: .height(40))
        
        stack.snp.makeToSuperview(.topSafeArea, .leftRight)
 
    }
    
    func bind(reactor: StartReactor) {
        let binder = ReactorBindings(reactor: reactor, defaultDisposeBag: disposeBag)
        binder.fire(action: .tapOpenAccount, on: becomeACustomerButton.rx.tap.mapToVoid())
        binder.fire(action: .tapSignInUser, on: loginButton.rx.tap.mapToVoid())
        binder.fire(action: .tapSignInDemo, on: demoButton.rx.tap.mapToVoid())
    }
}
 
