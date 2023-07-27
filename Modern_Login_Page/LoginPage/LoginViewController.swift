//
//  ViewController.swift
//  Modern_Login_Page
//
//  Created by Bircan Sezgin on 25.07.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginImage : UIImageView = UIImageView()
    private var headerLabel : UILabel = UILabel()
    private var usernameTextField : UITextField = UITextField()
    private var passwordTextField : UITextField = UITextField()
    private var forgetPassword : UIButton = UIButton()
    private var loginButton: UIButton = UIButton()
    
    
    private var registerButton : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createLoginImageStart()
        headerLabelsStart()
        usernameTextFieldStart()
        passwordTextFieldStart()
        forgetPasswordButtonStart()
        loginButtonStart()
       setupRegisterButtonBelowLogin()
    }
  
    
    
    
    
    // loginImage function
    func createLoginImageStart() {
          // UIImageView nesnesini oluşturma
          let imageView = UIImageView()
          imageView.image = UIImage(named: "logo")
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
        view.text = "Welcome Back !"
        
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
        userNameTextField.placeholder = "Enter username"
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
            userNameTextField.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 15),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25), // Left
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25), // Right
            userNameTextField.heightAnchor.constraint(equalToConstant: 40) // Textfield heidgh
        ])

        usernameTextField = userNameTextField
    }
    
    func passwordTextFieldStart(){
        // Icon/Logo Create
        let passwordLogo = UIImage(named: "lock")
        let iconImageView = UIImageView(image: passwordLogo)
        iconImageView.contentMode = .center
        
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.isSecureTextEntry = true
        passwordTextField.borderStyle = .roundedRect
        
        // Creating UIView for icon
        let iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconImageView)
        iconImageView.center = iconContainerView.center
        
        
        passwordTextField.leftView = iconContainerView
        passwordTextField.leftViewMode = .always
        
        view.addSubview(passwordTextField)
        
        // placement
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        self.passwordTextField = passwordTextField
        
    }
    
    func forgetPasswordButtonStart(){
        let forgetpasswordButton = UIButton(type: .system)
        forgetpasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgetpasswordButton.setTitle("Forget Password?", for: .normal)
        forgetpasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        forgetpasswordButton.setTitleColor(UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1), for: .normal)
        
        forgetpasswordButton.addTarget(self, action: #selector(forgetPasswordTapped), for: .touchUpInside)
        
        view.addSubview(forgetpasswordButton)
    
        NSLayoutConstraint.activate([
            forgetpasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8), // Şifre textfield'ının altından 8 birim boşluk bırakın
            forgetpasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor), // Şifre textfield'ının sağına hizalayın
           ])
        
        
    }
    
    @objc func forgetPasswordTapped() {
        // Şifreyi unuttum butonuna tıklandığında yapılacak işlemleri buraya yazabilirsiniz
        let forgetVC = ForgetPasswordViewController()
            forgetVC.modalPresentationStyle = .automatic // Geçiş sayfanın tam ekran olarak açılmasını sağlar
        self.present(forgetVC, animated: true, completion: nil)
    }
    
    
    func loginButtonStart() {
        let loginB = UIButton(type: .system)
        loginB.translatesAutoresizingMaskIntoConstraints = false
        loginB.setTitle("LOG IN", for: .normal)
        loginB.tintColor = .white
        loginB.backgroundColor = UIColor(red: 0.102, green: 0.31, blue: 0.545, alpha: 1) // Mavi arka plan rengi
        loginB.layer.cornerRadius = 5
        loginB.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        loginB.addTarget(self, action: #selector(loginTargetfunc), for: .touchUpInside)
        
        view.addSubview(loginB)
        
        NSLayoutConstraint.activate([
            loginB.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50), // "Forget Password?" butonunun altından 50 birim uzaklıkta
            loginB.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25), // Sol kenardan 40 birim içeride
            loginB.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25), // Sağ kenardan 40 birim içeride
            loginB.heightAnchor.constraint(equalToConstant: 50) // Buton yüksekliği 50 piksel olsun
        ])
    }

    
    
     
    @objc func loginTargetfunc(){
        if usernameTextField.text == "Naber" && passwordTextField.text == "123"{
            let alert = UIAlertController(title: "success", message: "helal an", preferredStyle: .alert)
            
            let gecisB = UIAlertAction(title: "Go", style: .default) { naber in
                let loginPageVC = HomePageViewController()
                    loginPageVC.modalPresentationStyle = .fullScreen // Geçiş sayfanın tam ekran olarak açılmasını sağlar
                self.present(loginPageVC, animated: true, completion: nil)
            }
            
            alert.addAction(gecisB)
            self.present(alert, animated: true)
        }
    }
    
    
    func setupRegisterButtonBelowLogin() {
        let registerButton = UIButton(type: .system)
           registerButton.translatesAutoresizingMaskIntoConstraints = false
    
        let mainText = "Don't have an account already? "
        let signUptext = "Sing Up"
        
        let attirbutedString = NSMutableAttributedString(string: mainText + signUptext)
        attirbutedString.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(location: 0, length: mainText.count))
        
        attirbutedString.addAttribute(.foregroundColor, value: UIColor(red: 0.1, green: 0.31, blue: 0.55, alpha: 1), range: NSRange(location: mainText.count, length: signUptext.count))
    
        registerButton.setAttributedTitle(attirbutedString, for: .normal)
           registerButton.tintColor = UIColor(red: 0.69, green: 0.69, blue: 0.69, alpha: 1)
           registerButton.layer.cornerRadius = 5
           registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)

           // Add your register button target and action here
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)

           view.addSubview(registerButton)

           NSLayoutConstraint.activate([
               registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 150), // 10 birim uzaklıkta
               registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25), // Sol kenardan
               registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25), // Sağ kenardan
               registerButton.heightAnchor.constraint(equalToConstant: 50) // Buton yüksekliği 50 piksel olsun
           ])
    }
    
    @objc func registerButtonTapped(){
        let registerVC = RegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true)
    }

}

