//
//  NewReceiptController.swift
//  Reminder
//
//  Created by Nilton Schumacher Filho on 05/07/26.
//

import Foundation
import UIKit

class NewReceiptController: UIViewController {
    let contentView: NewReceiptView
    
    init(contentView: NewReceiptView) {
        self.contentView = contentView        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupActions()
    }
    
    private func setup() {
        view.addSubview(contentView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        setupContentViewToBounds(contentView: contentView)
    }
    
    private func setupActions() {
        contentView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
