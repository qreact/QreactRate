//
//  ReviewPopup.swift
//  BankOfBakuApp
//
//  Created by Huseyn Bayramov on 6/28/19.
//  Copyright © 2019 Jeyhun Danyaloff. All rights reserved.
//

import UIKit

public final class QRate: UIView {
    
    let defaults = UserDefaults.standard
    
    private var qreactToken = ""
    private var daysUntilPrompt = 0 /// minimum number of days
    private var launchesUntilPrompt = 0 /// minimum number of launches
    private var targetLevel = 0
    private var ratedIndex = 0
    private var neverShow = false

    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Title"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
     let subTitle: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Subtitle of popup"
        label.textAlignment = .center
        return label
    }()
    
     let container : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()
    
     let star1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star", in: Bundle(for: QRate.self), compatibleWith: nil)
        button.setImage(image, for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(starClick), for: .touchUpInside)
        return button
    }()
    
    let star2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star", in: Bundle(for: QRate.self), compatibleWith: nil)
        button.setImage(image, for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(starClick), for: .touchUpInside)
        return button
    }()
    
     let star3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star", in: Bundle(for: QRate.self), compatibleWith: nil)
        button.setImage(image, for: .normal)
        button.tag = 3
        button.addTarget(self, action: #selector(starClick), for: .touchUpInside)
        return button
    }()
    
    let star4: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star", in: Bundle(for: QRate.self), compatibleWith: nil)
        button.setImage(image, for: .normal)
        button.tag = 4
        button.addTarget(self, action: #selector(starClick), for: .touchUpInside)
        return button
    }()
    
    let star5: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star", in: Bundle(for: QRate.self), compatibleWith: nil)
        button.setImage(image, for: .normal)
        button.tag = 5
        button.addTarget(self, action: #selector(starClick), for: .touchUpInside)
        return button
    }()
    
    let dividerRate: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(red: 6/255, green: 86/255, blue: 254/255, alpha: 1)
        return view
    }()
    
     let dividerCancel: UIView = {
           let view = UIView()
           view.translatesAutoresizingMaskIntoConstraints = false
           view.backgroundColor = UIColor.init(red: 6/255, green: 86/255, blue: 254/255, alpha: 1)
           return view
    }()
    
    let dividerNotNow : UIView = {
          let view = UIView()
          view.translatesAutoresizingMaskIntoConstraints = false
          view.backgroundColor = UIColor.init(red: 6/255, green: 86/255, blue: 254/255, alpha: 1)
          return view
    }()
    
    let rateBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Rate", for: .normal)
        let color = UIColor.init(red: 6/255, green: 86/255, blue: 254/255, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.addTarget(self, action: #selector(rateApp), for: .touchUpInside)
        button.addTopBorder(color: UIColor.blue, width: 3)
        return button
    }()
    
    let cancelBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cancel", for: .normal)
        let color = UIColor.init(red: 6/255, green: 86/255, blue: 254/255, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.addTarget(self, action: #selector(cancelDialog), for: .touchUpInside)
        button.addTopBorder(color: UIColor.blue, width: 3)
        return button
    }()
    
     let neverBtn: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Never", for: .normal)
        let color = UIColor.init(red: 6/255, green: 86/255, blue: 254/255, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.addTarget(self, action: #selector(neverClick), for: .touchUpInside)
        button.addTopBorder(color: UIColor.blue, width: 3)
        return button
    }()
    
    @objc func animateOut() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })
    }
    
     lazy var starStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [star1, star2, star3, star4, star5])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
     lazy var stackButton: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [dividerRate, rateBtn, dividerCancel, cancelBtn, dividerNotNow, neverBtn])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 0
        return stack
    }()
    
     lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, subTitle, starStack, stackButton])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        
        self.addSubview(container)
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        container.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        container.addSubview(stack)
        stack.topAnchor.constraint(equalTo: container.topAnchor, constant: 20).isActive = true
        stack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        stack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10).isActive = true
        stack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
        
        starStack.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 30).isActive = true
        starStack.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -30).isActive = true
        
        star1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        star1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        star2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        star2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        star3.widthAnchor.constraint(equalToConstant: 40).isActive = true
        star3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        star4.widthAnchor.constraint(equalToConstant: 40).isActive = true
        star4.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        star5.widthAnchor.constraint(equalToConstant: 40).isActive = true
        star5.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 15).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15).isActive = true
        
        rateBtn.widthAnchor.constraint(equalTo: container.widthAnchor, constant: 0).isActive = true
        rateBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        rateBtn.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
        
        cancelBtn.widthAnchor.constraint(equalTo: container.widthAnchor, constant: 0).isActive = true
        cancelBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cancelBtn.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
        
        neverBtn.widthAnchor.constraint(equalTo: container.widthAnchor, constant: 0).isActive = true
        neverBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
        neverBtn.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
        
        dividerRate.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerRate.widthAnchor.constraint(equalTo: rateBtn.widthAnchor).isActive = true
        dividerRate.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        
        dividerCancel.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerCancel.widthAnchor.constraint(equalTo: cancelBtn.widthAnchor).isActive = true
        dividerCancel.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        
        dividerNotNow.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerNotNow.widthAnchor.constraint(equalTo: neverBtn.widthAnchor).isActive = true
        dividerNotNow.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
    }
    
    @objc func starClick(sender: UIButton) {
        let star = UIImage(named: "star", in: Bundle(for: QRate.self), compatibleWith: nil)
        let star_filled = UIImage(named: "star_filled", in: Bundle(for: QRate.self), compatibleWith: nil)
        switch sender.tag {
        case 1:
            star1.setImage(star_filled, for: .normal)
            star2.setImage(star, for: .normal)
            star3.setImage(star, for: .normal)
            star4.setImage(star, for: .normal)
            star5.setImage(star, for: .normal)
        case 2:
            star1.setImage(star_filled, for: .normal)
            star2.setImage(star_filled, for: .normal)
            star3.setImage(star, for: .normal)
            star4.setImage(star, for: .normal)
            star5.setImage(star, for: .normal)
        case 3:
            star1.setImage(star_filled, for: .normal)
            star2.setImage(star_filled, for: .normal)
            star3.setImage(star_filled, for: .normal)
            star4.setImage(star, for: .normal)
            star5.setImage(star, for: .normal)
        case 4:
            star1.setImage(star_filled, for: .normal)
            star2.setImage(star_filled, for: .normal)
            star3.setImage(star_filled, for: .normal)
            star4.setImage(star_filled, for: .normal)
            star5.setImage(star, for: .normal)
        case 5:
            star1.setImage(star_filled, for: .normal)
            star2.setImage(star_filled, for: .normal)
            star3.setImage(star_filled, for: .normal)
            star4.setImage(star_filled, for: .normal)
            star5.setImage(star_filled, for: .normal)
        default:
            print("")
        }
        ratedIndex = sender.tag
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
}

extension QRate {
    public func setQreactToken(token: String?) {
       guard let qtoken = token else { return }
       qreactToken = qtoken
    }
    
    public func setDaysUntilPrompt(daysPrompt: Int?) {
       guard let dprompt = daysPrompt else { return }
       daysUntilPrompt = dprompt
    }
    
    public func setLaunchesUntilPrompt(launchesPrompt: Int?) {
       guard let lprompt = launchesPrompt else { return }
       launchesUntilPrompt = lprompt
    }
    
    public func setTitle(title: String?) {
        guard let ntitle = title else { return }
        titleLabel.text = ntitle
    }
    
    public func setRateTitle(rateTitle: String?) {
        guard let title = rateTitle else { return }
        rateBtn.setTitle(title, for: .normal)
    }
    
    public func setCancelTitle(cancelTitle: String?) {
        guard let title = cancelTitle else { return }
        cancelBtn.setTitle(title, for: .normal)
    }
    
    public func setNeverTitle(neverTitle: String?) {
        guard let title = neverTitle else { return }
        neverBtn.setTitle(title, for: .normal)
    }
}

extension QRate {
    func prepare() {
        let currentTime = Int(NSDate().timeIntervalSince1970 * 1000)
        
        /// increment launch counter
        let launchCt = defaults.integer(forKey: "qreactLaunchCt") + 1
        defaults.set(launchCt, forKey: "qreactLaunchCt")
        
        /// get first date launch
        let dateFirstLaunch = defaults.integer(forKey: "qreactDateFirst")
        if dateFirstLaunch == 0 {
            defaults.set(currentTime, forKey: "qreactDateFirst")
        }
    }
    
    public func show(view: UIView) {
        prepare()
        
        let launchCt = defaults.integer(forKey: "qreactLaunchCt")
        let dateFirstLaunch = defaults.integer(forKey: "qreactDateFirst")
        let currentTime = Int(NSDate().timeIntervalSince1970 * 1000)
        
        if defaults.bool(forKey: "qreactNeverAgain") {
            neverShow = true
            return
        }
        
        if launchCt >= launchesUntilPrompt && !neverShow {
            if currentTime >= (dateFirstLaunch + (daysUntilPrompt*24*60*60*1000)) {
                view.addSubview(self)
                animateIn()
            }
        }
    }

    @objc func rateApp() {
        if ratedIndex <= targetLevel {
              guard let url = URL(string: qreactToken) else { return }
              if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
              } else {
                  UIApplication.shared.openURL(url)
              }
        } else {
              let storeToken = "https://itunes.apple.com/app/\(Bundle.main.bundleIdentifier ?? "")"
              guard let url = URL(string: storeToken) else { return }
              if #available(iOS 10.0, *) {
                  UIApplication.shared.open(url, options: [:], completionHandler: nil)
              } else {
                  UIApplication.shared.openURL(url)
              }
        }
    }
       
    @objc func neverClick() {
       defaults.set(false, forKey: "qreactNeverAgain")
       animateOut()
    }
       
    @objc func cancelDialog() {
       animateOut()
    }
}

extension UIButton {
    func addRightBorder(borderColor: UIColor, borderWidth: CGFloat) {
        let border = CALayer()
        border.backgroundColor = borderColor.cgColor
        border.frame = CGRect(x: self.frame.size.width - borderWidth,y: 0, width:borderWidth, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:0, width:width, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addTopBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}
