//
//  ViewController.swift
//  SnapKitTraining
//
//  Created by Тимур Ахметов on 01.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setSNP()
    }

    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(loginView)
}

    private func setSNP() {
       
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
    }
        
}
    
}
