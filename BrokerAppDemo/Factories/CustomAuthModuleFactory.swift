//
//  CustomAuthModuleFactory.swift
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
import BrokerAuthModule

//final class CustomAuthModuleFactory: AuthModuleFactoryType {
//
//     func signIn() -> CompletionScene<SignInSceneResult> {
//         AuthModule.shared.resetSignInReactorActionPublisher()
//
//        let sceneBuilder = StackSceneBuilder(viewsWidthDefaultInset: 32, stackViewSpacing: 0, contentMode: .scrollable, backgroundColor: UIColor.pallete.background)
//        sceneBuilder.addNavigationBarWithBackBtn()
//        sceneBuilder.set(contentInset: screenDefaultContentInsets)
//        sceneBuilder.addText(h1: "Войти")
//        sceneBuilder.addSpace(18)
//        let signInView = SignInView()
//        sceneBuilder.add(view: signInView)
//        let button = sceneBuilder.addFooter(button: "ВОЙТИ")
//
//        let reactor = SignInReactor()
//        let scene = sceneBuilder.build(reactor: reactor)
//        reactor.inject(interactor: SignInInteractor(), coordinator: SignInCoordinator(scene: scene))
//
//        scene.rx.viewDidLoad
//            .subscribeNext { _ in analytic(.loginShow) }
//            .disposed(by: scene.disposeBag)
//
//        let binder = ReactorBindings(reactor: reactor, defaultDisposeBag: scene.disposeBag)
//        binder.fire(action: .tapSignIn, on: button.rx.animTap)
//        binder.fire(action: .tapForgotPassword, on: signInView.forgotPasswordButton.rx.tap.mapToVoid())
//        binder.bind(signInView.loginTextField, fire: SignInReactor.Action.typeLogin, state: { $0.login })
//        binder.bind(signInView.passwordTextField, fire: SignInReactor.Action.typePassword, state: { $0.password })
//
//        binder.map(\.buttonIsEnabled, to: button.rx.isEnabled)
//        binder.map(\.inProgress, to: button.rx.isBusy)
//
//        return CompletionScene(scene, reactor)
//    }
//}
 
