import Foundation
import UIKit

class BaseViewController: UIViewController {
    private let customNavigationBar = UIView()
    
    private var leftBarItem = UIView()
    private let xImageView = UIImageView(image: .init(systemName: "xmark"))
    private let backImageView = UIImageView(image: .init(systemName: "arrowshape.left.fill"))
    
    let leftTitleLabel = UILabel()
    
    var willDisMissHandler: () -> Void = { }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBaseView()
    }
    
    private func initBaseView() {
        self.navigationController?.navigationBar.isHidden = true
        navigationItem.hidesBackButton = true
        view.backgroundColor = .systemBackground
        view.addSubview(customNavigationBar)
        customNavigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            customNavigationBar.heightAnchor.constraint(equalToConstant: 44)
        ])
        let xImageTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapXImageView(_:)))
        xImageView.addGestureRecognizer(xImageTapGesture)
        xImageView.isUserInteractionEnabled = true
        
        let backImageTapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapBackImageView(_:)))
        backImageView.addGestureRecognizer(backImageTapGesture)
        backImageView.isUserInteractionEnabled = true
        
        leftBarItem.translatesAutoresizingMaskIntoConstraints = false
        customNavigationBar.addSubview(leftBarItem)
        NSLayoutConstraint.activate([
            leftBarItem.widthAnchor.constraint(equalToConstant: 24),
            leftBarItem.heightAnchor.constraint(equalToConstant: 24),
            leftBarItem.bottomAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 8),
            leftBarItem.leadingAnchor.constraint(equalTo: customNavigationBar.leadingAnchor, constant: 16)
        ])
        
        leftTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        leftTitleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        customNavigationBar.addSubview(leftTitleLabel)
        NSLayoutConstraint.activate([
            leftTitleLabel.centerYAnchor.constraint(equalTo: leftBarItem.centerYAnchor),
            leftTitleLabel.leadingAnchor.constraint(equalTo: leftBarItem.trailingAnchor, constant: 8)
        ])
        
    }
    
    func setXButton() {
        xImageView.translatesAutoresizingMaskIntoConstraints = false
        backImageView.removeFromSuperview()
        leftBarItem.addSubview(xImageView)
        NSLayoutConstraint.activate([
            xImageView.topAnchor.constraint(equalTo: leftBarItem.topAnchor),
            xImageView.leadingAnchor.constraint(equalTo: leftBarItem.leadingAnchor),
            xImageView.trailingAnchor.constraint(equalTo: leftBarItem.trailingAnchor),
            xImageView.bottomAnchor.constraint(equalTo: leftBarItem.bottomAnchor)
        ])
    }
    
    func setBackButton() {
        backImageView.translatesAutoresizingMaskIntoConstraints = false
        xImageView.removeFromSuperview()
        leftBarItem.addSubview(backImageView)
        NSLayoutConstraint.activate([
            backImageView.topAnchor.constraint(equalTo: leftBarItem.topAnchor),
            backImageView.leadingAnchor.constraint(equalTo: leftBarItem.leadingAnchor),
            backImageView.trailingAnchor.constraint(equalTo: leftBarItem.trailingAnchor),
            backImageView.bottomAnchor.constraint(equalTo: leftBarItem.bottomAnchor)
        ])
    }
    
    @objc
    func didTapXImageView(_ sender: UITapGestureRecognizer) {
        willDisMissHandler()
        self.dismiss(animated: true)
    }
    
    @objc
    func didTapBackImageView(_ sender: UITapGestureRecognizer) {
        willDisMissHandler()
        self.navigationController?.popViewController(animated: true)
    }
}
