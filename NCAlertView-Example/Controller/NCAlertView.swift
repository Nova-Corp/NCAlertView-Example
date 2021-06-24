//
//  NCAlertView.swift
//  NCAlertView-Example
//
//  Created by ADMIN on 24/06/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

class NCAlertView: UIView {
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var buttonContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let stackView: UIStackView = {
        let stkView = UIStackView()
        stkView.axis = .horizontal
        stkView.distribution = .fillEqually
        stkView.translatesAutoresizingMaskIntoConstraints = false
        return stkView
    }()
    
    let seperatorLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    func configView(message: String?,
                    actionButtons: [UIButton],
                    _ animated: Bool? = nil) {
        //Setup BackgroundView
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        containerView.layer.cornerRadius = 2
        containerView.clipsToBounds = true
        
        self.addSubview(self.containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
        // Container Animation
    
        if let animated = animated, animated {
            containerView.transform = .init(scaleX: 0, y: 0)
            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {[weak self] in
                self!.containerView.transform = .init(scaleX: 1, y: 1)
            })
        }
        
        // Message Label Setup
        messageLabel.text = message ?? "Your message here"
        containerView.addSubview(messageLabel)
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            messageLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 200)
        ])
        
        //Seperator Line Setup
        containerView.addSubview(seperatorLine)
        NSLayoutConstraint.activate([
            seperatorLine.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 15),
            seperatorLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            seperatorLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            seperatorLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        // StackView Setup
        actionButtons.forEach { stackView.addArrangedSubview($0) }
        
        containerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: seperatorLine.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension UIViewController {
    func makeAlert(message: String,
                   actionButtons: [UIButton]? = nil,
                   animated: Bool? = nil) {
        let alertView = NCAlertView()
        var buttons:[UIButton]? = nil
        
        let hideAlertView: UIButton = {
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.setTitle("Close", for: .normal)
            btn.setTitleColor(.blue, for: .normal)
            btn.addTarget(self, action: #selector(hideAlert), for: .touchUpInside)
            return btn
        }()
        
        if let actionButtons = actionButtons,
            actionButtons.count > 0 {
            buttons = actionButtons
        }else{
            buttons = [hideAlertView]
        }
        
        alertView.configView(message: message,
                             actionButtons: buttons!,
                             animated)
        
        view.addSubview(alertView)
        NSLayoutConstraint.activate([
            alertView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            alertView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            alertView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            alertView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    @objc func hideAlert() {
        view.subviews.forEach { view in
            if view is NCAlertView { view.removeFromSuperview() }
        }
    }
}
