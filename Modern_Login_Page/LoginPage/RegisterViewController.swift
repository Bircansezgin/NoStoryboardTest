import UIKit



class RegisterViewController: UIViewController {
    
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
        label.text = "Welcome Register Page"
        label.textColor = .black
        label.font = UIFont(name: "Helvetica-Bold", size: 24)
        return label
    }()
    
    private let emailTextField: UITextField = {
        
        let userLogo = UIImage(named: "email")
        let iconImageView = UIImageView(image: userLogo)
        iconImageView.contentMode = .center
        
        let emailT = UITextField()
        emailT.translatesAutoresizingMaskIntoConstraints = false
        emailT.placeholder = "Enter Email"
        emailT.layer.cornerRadius = 5
        emailT.autocapitalizationType = .none
        emailT.borderStyle = .roundedRect
        emailT.layer.borderWidth = 1
        emailT.layer.borderColor = UIColor(red: 0.102, green: 0.31, blue: 0.545, alpha: 1).cgColor
        
        
        let iconView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconView.addSubview(iconImageView)
        iconImageView.center = iconView.center
        
        emailT.leftView = iconView
        emailT.leftViewMode = .always
        
        return emailT
    }()
    
    private let backbuttin: UIButton = {
        
        
        let loginB = UIButton(type: .system)
        loginB.translatesAutoresizingMaskIntoConstraints = false
        loginB.setTitle("Back", for: .normal)
        loginB.tintColor = .black
        loginB.layer.cornerRadius = 5
        loginB.titleLabel?.font =  UIFont(name: "Helvetica-Bold", size: 16)
        
        loginB.addTarget(self, action: #selector(loginTargetfunc), for: .touchUpInside)
        
        return loginB
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginImage()
        setupTitleLabel()
        setupEmailTextField()
        setupBackButton()
        
    }
    
    
    @objc func loginTargetfunc(){
       dismiss(animated: true)
    
    }
    
    func setupBackButton(){
        view.addSubview(backbuttin)
        
        NSLayoutConstraint.activate([
            backbuttin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backbuttin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
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
    
    
    func setupEmailTextField(){
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    func backButtonItem(){
        
    }
}
