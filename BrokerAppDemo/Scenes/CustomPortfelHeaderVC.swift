//
//  CustomPortfelHeaderScene.swift
//  BrokerAppCustomizedDemoApp
//
//  Created by Alexey Nenastev on 12.04.2020.
//  Copyright © 2020 ru.bcs. All rights reserved.
//

import BrokerUIKit
import ModuleCore
import RxSwift
import BrokerPortfelModule
import BrokerData
import RxCocoa

final class CustomPortfelHeaderVC: BaseVC, SceneView {
    
    private var periodObservable = PublishSubject<Period>()
    fileprivate lazy var _periodObservable = { periodObservable.asObservable() }()
    
    lazy var textViewInfo: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .clear
        tv.contentInset = .zero
        tv.textContainer.lineFragmentPadding = 0
        tv.isScrollEnabled = false
        tv.isSelectable = true
        tv.isEditable = false
        tv.isUserInteractionEnabled = true
        tv.textColor = .white
        tv.tintColor = UIColor.pallete.azul
        tv.dataDetectorTypes = .link
        return tv
    }()
    
    lazy var imageView = UIImageView()
    
    fileprivate let preloader = Preloader(size: .small)
    
    fileprivate var inProgress: Bool = false {
        didSet {
            textViewInfo.isHidden = inProgress
            preloader.inProgress.onNext(inProgress)
        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFit
    }
    
    override public func setupViewAndConstraints() {
        super.setupViewAndConstraints()
        
        view.backgroundColor = .clear
        view.layoutMargins = .zero
        view.add(subviews: imageView,textViewInfo, preloader)
        
        preloader.snp.makeToSuperview(.edges)
        preloader.color = .white
        view.layoutMargins = .init(top: 0, left: 0, bottom: 0, right: 16)
        imageView.snp.makeToSuperview(.right, .bottom, .top, addSelf: .width(100))
        
        view.layoutMargins = .all(16)
        textViewInfo.snp.makeToSuperview(.edges, addSelf: .height(90))
    }
    
    public func bind(reactor: PortfelHeaderReactor) {
        reactor.state.subscribeNext(self, with: CustomPortfelHeaderVC.updateData, bag: disposeBag)
    }
    
    fileprivate func updateData(state: PortfelHeaderReactor.State){
        guard let portfel = state.portfel else { return } 
        let costStr = portfel.cost.attributed(font: UIFont(name: "Noteworthy-Bold", size: 27)!,
                                              mainColor: .white,
                                              fractionalColor: UIColor.pallete.white65)
        
        let priceChange = portfel.finResult.change
        
        
        let fullStr = NSMutableAttributedString(attributedString: costStr)
        let valueStr = Price(value: priceChange.absolute, unit: portfel.cost.unit).string(.minMaxFracDigits(2), .showSign)
        let percentsStr = Price(value: priceChange.percents, unit: .unknown).string(.percentStyle, .hideSign)
        
        let sign = priceChange.absolute < 0 ? "-" : "+"
        let finResStr = "\n\(valueStr) (\(sign)\(percentsStr))"
        let finResAtr =  finResStr.attributed(by: [.font: UIFont(name: "Noteworthy-Light", size: 17)!, .foregroundColor: UIColor.white])
        fullStr.append(finResAtr)
        
        textViewInfo.attributedText = fullStr
        
        if priceChange.absolute > 0 {
            imageView.image = UIImage(named: "rick_like_boss")
        } else if priceChange.absolute < 0 {
            imageView.image = UIImage(named: "rick_sad")
        } else {
            imageView.image = UIImage(named: "rick_neutral")
        }
    }
}

extension CustomPortfelHeaderVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith url: URL, in characterRange: NSRange) -> Bool {
        fire(action: .tapChangePeriod)
        return false
    }
}

extension Reactive where Base: CustomPortfelHeaderVC {
    
    var periodPicked: Observable<Period> { base._periodObservable }
    
    var portfel: Binder<Portfel?> {
        Binder(self.base) { vc, portfel in
            guard let portfel = portfel else { return }
            vc.fire(action: .setPortfel(portfel))
        }
    }
    
    var inProgress: Binder<Bool> {
        Binder(self.base) {
            vc, inProgress in vc.inProgress = inProgress
        }
    }
    
}
