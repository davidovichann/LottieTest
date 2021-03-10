//
//  OfferViewController.swift
//  LottieTest
//
//  Created by Anna Davidovich on 3/10/21.
//

import UIKit
import Lottie

class OfferViewController: UIViewController {

    override func loadView() {
        super.loadView()
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        view.addSubview(backgroundImageView)
        
        backgroundImageView.addSubview(whiteBackgroundImageView)
        
        view.addSubview(topAnimation)
        topAnimation.addSubview(limitedLabel)
        
        view.addSubview(badgeAnimation)
        
        view.addSubview(nextButton)
    }
    
    func setUpConstraints() {
        backgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        whiteBackgroundImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(40)
        }
        
        limitedLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(UIScreen.main.bounds.size.height / 9.7)
            make.height.equalTo(40)
        }
        
        nextButton.snp.makeConstraints { (make) in
            make.leading.equalTo(60)
            make.trailing.bottom.equalTo(-60)
            make.height.equalTo(44)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        topAnimation.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        badgeAnimation.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        topAnimation.play()
        badgeAnimation.play()
    }
    
    @objc func didPressNextButton(_ : UIButton) {
        topAnimation.animation = Animation.named("limited_offer_end")
        badgeAnimation.animation = Animation.named("badge_end")
        
        topAnimation.play()
        badgeAnimation.play { (finished) in
            self.dismiss(animated: true, completion: nil)
        }
    }
    
//    MARK:- Init
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        return imageView
    }()
    
    lazy var whiteBackgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "white_background"))
        return imageView
    }()
    
    lazy var topAnimation: AnimationView = {
        let animationView = AnimationView.init(name: "limited_offer_start")
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.5
        animationView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width - 60, height: 80)
        return animationView
    }()
    
    lazy var badgeAnimation: AnimationView = {
        let animationView = AnimationView.init(name: "badge_start")
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 0.5
        animationView.frame = CGRect.init(x: 0, y: topAnimation.frame.maxY, width: UIScreen.main.bounds.size.width - 60, height: 200)
        return animationView
    }()
    
    lazy var limitedLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: topAnimation.frame.minX, y: topAnimation.frame.minY, width: 200, height: 40))
        label.text = "LIMITED OFFER"
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.addTarget(self, action: #selector(didPressNextButton(_:)), for: .touchUpInside)
        button.backgroundColor = .green
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 10
        
        return button
    }()
    
}
