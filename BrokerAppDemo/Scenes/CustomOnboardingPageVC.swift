//
//  CustomOnboardingPageVC.swift
//  BrokerAppCustomizedDemoApp
//
//  Created by Alexey Nenastev on 13.04.2020.
//  Copyright © 2020 ru.bcs. All rights reserved.
//

import Foundation
import BrokerUIKit

final class CustomOnboardingPageVC: UIViewController {

    private lazy var imageView: UIImageView = {
        let iv = UIImageView(image: page.image)
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.attributedText = page.text
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .bold34
        return label
    }()
 
    private let page: OnboardingPage

    init(page: OnboardingPage) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = UIColor.pallete.background
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.layoutMargins = .zero
        view.add(subviews: imageView, textLabel)
        imageView.snp.makeToSuperview(.edges)
        view.layoutMargins = .init(top: 65, left: 16, bottom: 16, right: 16)
        textLabel.snp.makeToSuperview(.leftRight, .topSafeArea)
    }
}
