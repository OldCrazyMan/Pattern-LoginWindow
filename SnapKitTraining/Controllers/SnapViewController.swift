//
//  SnapViewController.swift
//  SnapKitTraining
//
//  Created by Тимур Ахметов on 01.04.2022.
//

import UIKit

class SnapViewController: UIViewController {
    
    
     let sunImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let welcomeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "welcome")
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setSNP()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(sunImageView)
        view.addSubview(welcomeImageView)
    }
    
    private func setSNP() {
        
        sunImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
      
        welcomeImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
