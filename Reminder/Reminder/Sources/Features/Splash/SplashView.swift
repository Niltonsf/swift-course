//
//  SplashView.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 17/12/25.
//

import Foundation
import UIKit

class SplashView: UIView {
    internal let logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
//    private let titleLogoLabel: UILabel = {
//        let title = UILabel()
//        title.text = "Remind"
//        title.textColor = .white
//        title.font = UIFont.boldSystemFont(ofSize: 32)
//        title.translatesAutoresizingMaskIntoConstraints = false
//        return title
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError( "init(coder:) has not been implemented" )
    }
    
    private func setupUI() {
        self.addSubview(logoImageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
