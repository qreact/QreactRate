//
//  ReviewPopup.swift
//  BankOfBakuApp
//
//  Created by Huseyn Bayramov on 6/28/19.
//  Copyright © 2019 Jeyhun Danyaloff. All rights reserved.
//

import UIKit

public final class ReviewPopup: UIView {
    
    let viewModel = ReviewViewModel()
    
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
        let image = UIImage(named: "star")
        button.setImage(image, for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(starClick), for: .touchUpInside)
        return button
    }()
    
    let star2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star")
        button.setImage(image, for: .normal)
        button.tag = 2
        button.addTarget(self, action: #selector(starClick), for: .touchUpInside)
        return button
    }()
    
     let star3: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star")
        button.setImage(image, for: .normal)
        button.tag = 3
        button.addTarget(self, action: #selector(starClick), for: .touchUpInside)
        return button
    }()
    
    let star4: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star")
        button.setImage(image, for: .normal)
        button.tag = 4
        button.addTarget(self, action: #selector(starClick), for: .touchUpInside)
        return button
    }()
    
    let star5: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "star")
        button.setImage(image, for: .normal)
        button.tag = 5
        button.addTarget(self, action: #selector(starClick), for: .touchUpInside)
        return button
    }()
    
     let notNow: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Not Now", for: .normal)
        let color = UIColor.init(red: 6/255, green: 86/255, blue: 254/255, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.addTarget(self, action: #selector(notNowClick), for: .touchUpInside)
        button.addTopBorder(color: UIColor.blue, width: 3)
        return button
    }()
    
    @objc public func animateOut() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    @objc public func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })
    }
    
    public lazy var starStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [star1, star2, star3, star4, star5])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    public let lineView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(red: 6/255, green: 86/255, blue: 254/255, alpha: 1)
        return view
    }()
    
     lazy var stackButton: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [lineView, notNow])
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
        
//        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        self.frame = UIScreen.main.bounds
        
        self.addSubview(container)
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8).isActive = true
        container.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
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
        
        notNow.widthAnchor.constraint(equalTo: container.widthAnchor, constant: 0).isActive = true
        notNow.heightAnchor.constraint(equalToConstant: 50).isActive = true
        notNow.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
        
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        lineView.widthAnchor.constraint(equalTo: notNow.widthAnchor).isActive = true
        lineView.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        
        animateIn()
    }
    
    @objc func starClick(sender: UIButton) {
        print(sender.tag)
        let star = UIImage(named: "star")
        let star_filled = UIImage(named: "star_filled")
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
        viewModel.reviewStarClick(rate: sender.tag)
        animateOut()
    }
    
    @objc public func notNowClick() {
        viewModel.notNowBtnClick()
        animateOut()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented ")
    }
}

extension UIButton {
   public func addRightBorder(borderColor: UIColor, borderWidth: CGFloat) {
        let border = CALayer()
        border.backgroundColor = borderColor.cgColor
        border.frame = CGRect(x: self.frame.size.width - borderWidth,y: 0, width:borderWidth, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    public func addLeftBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:0, width:width, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    public func addTopBorder(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}
