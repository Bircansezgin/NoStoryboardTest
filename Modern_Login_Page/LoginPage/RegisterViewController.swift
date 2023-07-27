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

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLoginImage()
        setupTitleLabel()
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
}
