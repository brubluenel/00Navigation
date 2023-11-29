import Foundation
import UIKit

class Modal_1_ViewController: BaseViewController {
    private var modal2Button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
    }
    
    private func initView() {
        leftTitleLabel.text = "Modal1"
        view.backgroundColor = .systemBackground
        modal2Button.setTitle("Modal2", for: .normal)
        modal2Button.setTitleColor(.label, for: .normal)
        modal2Button.backgroundColor = .systemBlue
        
        
        view.addSubview(modal2Button)
        modal2Button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            modal2Button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modal2Button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            modal2Button.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        setXButton()
        
        modal2Button.addTarget(self, action: #selector(self.didTapModal2Button(_:)), for: .touchUpInside)
    }
    
    @objc
    func didTapModal2Button(_ sender: UIButton) {
        if let navCon = self.navigationController {
            let modal2ViewCon = Modal_2_ViewController()
            navCon.viewControllers.replace([self], with: [modal2ViewCon])
        }
    }
}
