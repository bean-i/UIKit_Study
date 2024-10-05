//
//  FirstViewController.swift
//  NextVC
//
//  Created by 이빈 on 9/15/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    let mainLabel = UILabel()
    lazy var backBUtton :UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var someString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        makeAutoLayout()
    }
    
    func setUp() {
        mainLabel.text = someString
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        
        view.addSubview(mainLabel)
        view.addSubview(backBUtton)
        
        view.backgroundColor = .gray
    }
    
    func makeAutoLayout() {
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
        backBUtton.translatesAutoresizingMaskIntoConstraints = false
        backBUtton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backBUtton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backBUtton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backBUtton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
         
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
