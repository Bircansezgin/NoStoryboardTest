//
//  RegisterViewController.swift
//  Modern_Login_Page
//
//  Created by Bircan Sezgin on 26.07.2023.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    
    private var loginImage : UIImageView = UIImageView()
    private var headerLabel : UILabel = UILabel()
    private var usernameTextField : UITextField = UITextField()

    private var forgetPassword : UIButton = UIButton() // degisim
    private var loginButton: UIButton = UIButton()
    
    private var discriptionLabel : UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createLoginImageStart()
        headerLabelsStart()
        usernameTextFieldStart()
        loginButtonStart()
        
        discLabel()
        
    }
    
    // loginImage function
    func createLoginImageStart() {
          // UIImageView nesnesini oluşturma
          let imageView = UIImageView()
          imageView.image = UIImage(named: "forgot")
          imageView.contentMode = .scaleAspectFit
          imageView.translatesAutoresizingMaskIntoConstraints = false

          // UIImageView'i ViewController'a ekleme
          view.addSubview(imageView)

          // Kısıtlamaların eklenmesi
          NSLayoutConstraint.activate([
              imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
              imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
              imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
              imageView.heightAnchor.constraint(equalToConstant: 250) // Görselin yüksekliğini istediğiniz değere ayarlayabilirsiniz.
          ])

          // loginImage özelliğini atama
          loginImage = imageView
      }
    
    func headerLabelsStart(){
        // Auto layout, variables, and unit scale are not yet supported
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textColor = .black
        view.font = UIFont(name: "Helvetica-Bold", size: 34)
        view.text = "Forget Password !"
        
        self.view.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: loginImage.bottomAnchor, constant: 15),
            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), // Etiketi yatayda merkezle
            ])
        
        headerLabel = view
    }
    
    func usernameTextFieldStart() {
      
        // Icon/Logo Create
        let userLogo = UIImage(named: "userLogo")
        let iconImageView = UIImageView(image: userLogo)
        iconImageView.contentMode = .center
        
        let userNameTextField = UITextField()
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.placeholder = "Enter E-Mail"
        userNameTextField.layer.cornerRadius = 5
        userNameTextField.autocapitalizationType = .none
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.layer.borderWidth = 1
        userNameTextField.layer.borderColor = UIColor(red: 0.102, green: 0.31, blue: 0.545, alpha: 1).cgColor
        
        // Creating UIView for icon
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconImageView)
        iconImageView.center = iconContainerView.center
        
        userNameTextField.leftView = iconContainerView
        userNameTextField.leftViewMode = .always
        
        view.addSubview(userNameTextField)
        
        
        // placement
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 50),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25), // Left
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25), // Right
            userNameTextField.heightAnchor.constraint(equalToConstant: 40) // Textfield heidgh
        ])

        usernameTextField = userNameTextField
    }
    
  
    func loginButtonStart() {
        let loginB = UIButton(type: .system)
        loginB.translatesAutoresizingMaskIntoConstraints = false
        loginB.setTitle("Reset Password", for: .normal)
        loginB.tintColor = .black
        loginB.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1) // Mavi arka plan rengi
        loginB.layer.cornerRadius = 5
        loginB.layer.cornerRadius = 15
        loginB.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        loginB.addTarget(self, action: #selector(loginTargetfunc), for: .touchUpInside)
        
        view.addSubview(loginB)
        
        NSLayoutConstraint.activate([
            loginB.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 150), // "Forget Password?" butonunun altından 50 birim uzaklıkta
            loginB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25), // Sol kenardan 40 birim içeride
            loginB.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25), // Sağ kenardan 40 birim içeride
            loginB.heightAnchor.constraint(equalToConstant: 40) // Buton yüksekliği 50 piksel olsun
        ])
    }

    
    
     
    @objc func loginTargetfunc(){
        
    }
    
    
    func discLabel() {
        let loginHereButton = UIButton(type: .system)
        loginHereButton.translatesAutoresizingMaskIntoConstraints = false
        
        let loginHereText = "Login here"
        let otherText = "Already have an account? "
        
        let attributedString = NSMutableAttributedString(string: otherText + loginHereText)
        attributedString.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: otherText.count))
        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 0.1, green: 0.31, blue: 0.55, alpha: 1), range: NSRange(location: otherText.count, length: loginHereText.count))
        
        loginHereButton.setAttributedTitle(attributedString, for: .normal)
        loginHereButton.titleLabel?.font = UIFont(name: "Arial", size: 16)
        
        loginHereButton.addTarget(self, action: #selector(loginHereButtonTapped), for: .touchUpInside)
        
        view.addSubview(loginHereButton)
        
        NSLayoutConstraint.activate([
            loginHereButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Yatayda merkeze hizala
            loginHereButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50) // Sayfanın alt kenarından 50 birim yukarıda
        ])
    }

    @objc func loginHereButtonTapped() {
        dismiss(animated: true, completion: nil)
    }


   
    
    
   


}
