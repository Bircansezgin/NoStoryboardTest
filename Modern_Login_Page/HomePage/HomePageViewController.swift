//
//  HomePAgeViewController.swift
//  Modern_Login_Page
//
//  Created by Bircan Sezgin on 26.07.2023.
//

import UIKit

class HomePageViewController: UIViewController {

    
    var welcomeLabel : UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        lable()
    }
    
    
    func lable(){
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NABER"
        label.textColor = .red
        label.font = UIFont(name: "Helvetica-Bold", size: 34)
        
        self.view.addSubview(label)
       
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      
        ])
        
        welcomeLabel = label
    }

  

}
