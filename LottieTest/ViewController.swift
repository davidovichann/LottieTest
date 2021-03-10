//
//  ViewController.swift
//  LottieTest
//
//  Created by Anna Davidovich on 3/7/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.addTarget(self, action: #selector(didPressNextButton(_:)), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(nextButton)
        
        nextButton.snp.makeConstraints({(make) in
            make.edges.equalToSuperview()
        })
    }
    
    @objc
    func didPressNextButton(_ : UIButton) {
        let vc = OfferViewController()
        present(vc, animated: true, completion: nil)
    }

}
