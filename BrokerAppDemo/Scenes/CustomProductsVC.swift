//
//  ProductCollectionCell.swift
//  BrokerAppCustomizedDemoApp
//
//  Created by Alexey Nenastev on 12.04.2020.
//  Copyright © 2020 ru.bcs. All rights reserved.
//
 import UIKit
import BrokerProductsModule
import BrokerInformationModule

final class CustomProductsVC: UIViewController {
    
    @IBAction func authorTapped(_ sender: Any) {
        let scene = ProductsModule.shared.factory.authorList(delegate: nil)
        navigationController?.pushViewController(scene.0, animated: true)
    }
    
    @IBAction func portfoliosTapped(_ sender: Any) {
        let scene = ProductsModule.shared.factory.investPortfoliosList(delegate: nil)
        navigationController?.pushViewController(scene.0, animated: true)
    }
    
    @IBAction func iiaIdeasTapped(_ sender: Any) {
        let scene = ProductsModule.shared.factory.iiaIdeaList(delegate: nil)
        navigationController?.pushViewController(scene.0, animated: true)
    }
    
    @IBAction func ideasTapped(_ sender: Any) {
        let scene = ProductsModule.shared.factory.ideaList(delegate: nil)
        navigationController?.pushViewController(scene.0, animated: true)
    }
    
    @IBAction func strategiesTapped(_ sender: Any) {
        let scene = ProductsModule.shared.factory.strategyList(delegate: nil)
        navigationController?.pushViewController(scene.0, animated: true)
    }
    
    @IBAction func newsTapped(_ sender: Any) {
        let scene = InformationModule.shared.factory.newsShowCase(delegate: nil)
        navigationController?.pushViewController(scene.0, animated: true)
    }
}
