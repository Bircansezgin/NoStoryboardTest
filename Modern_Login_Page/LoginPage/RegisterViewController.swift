import UIKit

import Parse

class RegisterViewController: UIViewController {
    
    let userServer = PFUser()
    
    private let loginImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.gif(asset: "register")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign Up"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 24)
        return label
    }()
    
    private let usernameTextField: UITextField = {
        let userLogo = UIImage(named: "userADD")
        
        let iconImageView = UIImageView(image: userLogo)
        iconImageView.contentMode = .center
        
        let usernameTextField = UITextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username Enter"
        usernameTextField.layer.cornerRadius = 5
        usernameTextField.autocapitalizationType = .none
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        
        let iconView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconView.addSubview(iconImageView)
        iconImageView.center = iconView.center
        
        usernameTextField.leftView = iconView
        usernameTextField.leftViewMode = .always
        
        return usernameTextField
    }()
    
    private let emailTextField: UITextField = {
        
        let userLogo = UIImage(named: "mail")
        let iconImageView = UIImageView(image: userLogo)
        iconImageView.contentMode = .center
        
        let emailT = UITextField()
        emailT.translatesAutoresizingMaskIntoConstraints = false
        emailT.placeholder = "Email Enter"
        emailT.layer.cornerRadius = 5
        emailT.autocapitalizationType = .none
        emailT.borderStyle = .roundedRect
        emailT.layer.borderWidth = 1
        emailT.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        
        
        let iconView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconView.addSubview(iconImageView)
        iconImageView.center = iconView.center
        
        emailT.leftView = iconView
        emailT.leftViewMode = .always
        
        return emailT
    }()
    
    private let passwordOneTextField: UITextField = {
        let passwordLogo = UIImage(named: "lock")
        let iconImageView = UIImageView(image: passwordLogo)
        iconImageView.contentMode = .center
        
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password Enter"
        passwordTextField.layer.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.autocapitalizationType = .none
        passwordTextField.borderStyle = .roundedRect
        //passwordTextField.layer.borderWidth = 1
        
        passwordTextField.isSecureTextEntry = true
        
        let iconView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconView.addSubview(iconImageView)
        iconImageView.center = iconView.center
        
        passwordTextField.leftView = iconView
        passwordTextField.leftViewMode = .always
        
        return passwordTextField
    }()
    
    private let passwordTwoTextField: UITextField = {
        let passwordLogo = UIImage(named: "lock")
        let iconImageView = UIImageView(image: passwordLogo)
        iconImageView.contentMode = .center
        
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Confirm Password Enter"
        passwordTextField.layer.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1).cgColor
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.autocapitalizationType = .none
        passwordTextField.borderStyle = .roundedRect
        //passwordTextField.layer.borderWidth = 1
        passwordTextField.isSecureTextEntry = true
        
        let iconView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconView.addSubview(iconImageView)
        iconImageView.center = iconView.center
        
        passwordTextField.leftView = iconView
        passwordTextField.leftViewMode = .always
        
        return passwordTextField
    }()
    
    private var signUpButton: UIButton = {
        
        let signUpButton = UIButton(type: .system)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign Up Now", for: .normal)
        signUpButton.tintColor = .black
        signUpButton.layer.borderWidth = 2
        signUpButton.backgroundColor = UIColor(red: 0.945, green: 0.945, blue: 0.945, alpha: 1) // Mavi arka plan rengi
        signUpButton.layer.cornerRadius = 15
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        signUpButton.addTarget(self, action: #selector(registerUpButton), for: .touchUpInside)
        
        return signUpButton
    }()
    
    private let backbuttin: UIButton = {
        let backB = UIButton(type: .system)
        backB.translatesAutoresizingMaskIntoConstraints = false
        //backB.setTitle("Back", for: .normal)
        let imageView = UIImage(systemName: "arrow.backward.circle")
        // arrowshape.backward
        backB.setImage(imageView, for: .normal)
        backB.tintColor = .black
        backB.layer.cornerRadius = 5
        backB.titleLabel?.font =  UIFont(name: "Helvetica-Bold", size: 16)
        // Self dokununca bozuluyor.
        backB.addTarget(self, action: #selector(loginTargetfunc), for: .touchUpInside)
        
        return backB
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginImage()
        setupTitleLabel()
        setupUsernameTextField()
        setupEmailTextField()
        setupBackButton()
        setupPasswordOneTextField()
        setupPasswordTwoTextField()
        setupSignUpButton()
        
    }// Finish ViewDidLoad
    
    
    @objc func loginTargetfunc(){
        dismiss(animated: true)
        
    }
    
    
    func setupLoginImage() {
        view.addSubview(loginImageView)
        NSLayoutConstraint.activate([
            loginImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            loginImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: loginImageView.bottomAnchor, constant: -20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func setupUsernameTextField(){
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    func setupEmailTextField(){
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setupPasswordOneTextField(){
        view.addSubview(passwordOneTextField)
        
        NSLayoutConstraint.activate([
            passwordOneTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordOneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordOneTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordOneTextField.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    func setupPasswordTwoTextField(){
        view.addSubview(passwordTwoTextField)
        
        NSLayoutConstraint.activate([
            passwordTwoTextField.topAnchor.constraint(equalTo: passwordOneTextField.bottomAnchor, constant: 15),
            passwordTwoTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            passwordTwoTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            passwordTwoTextField.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
    func setupSignUpButton(){
        view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: passwordTwoTextField.bottomAnchor, constant: 25),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            signUpButton.heightAnchor.constraint(equalToConstant: 40)
        
        ])
        
        
    }
    
    @objc func registerUpButton(){
        
        if let email = self.emailTextField.text, let passwordOne = self.passwordOneTextField.text, let passwordTwo = self.passwordTwoTextField.text,
           let username = self.usernameTextField.text{
            
            userServer.email = email
            userServer.password = passwordOne
            userServer.username = username
            
            
            
            userServer.signUpInBackground { succes, error in
                if error != nil{
                    self.setupShowAlertSignUP(title: "Info", message: error!.localizedDescription, buttonHeader: "Try")
                }else{
                    self.setupShowAlertSignUP(title: "Account Info", message: "Your account has been successfully created", buttonHeader: "OK")
                }
            }
            
        }else{
            
        }
    }
    
    
   
    func setupBackButton(){
        view.addSubview(backbuttin)
        
        NSLayoutConstraint.activate([
            backbuttin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backbuttin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
    }
    
    
    func setupShowAlertSignUP(title:String, message:String, buttonHeader:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: buttonHeader, style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
