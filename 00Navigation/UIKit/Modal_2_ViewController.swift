import Foundation
import UIKit

class Modal_2_ViewController: BaseViewController {
    private var modalSubButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        leftTitleLabel.text = "Modal2"
        modalSubButton.setTitle("Modal Sub", for: .normal)
        modalSubButton.setTitleColor(.label, for: .normal)
        modalSubButton.backgroundColor = .systemBlue
        
        view.addSubview(modalSubButton)
        modalSubButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            modalSubButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            modalSubButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            modalSubButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        setXButton()
        configureButton()
    }
    
    private func configureButton() {
        modalSubButton.addTarget(self, action: #selector(self.showModalSub(_:)), for: .touchUpInside)
    }
    
    @objc
    private func showModalSub(_ sender: UIButton) {
        let vc = SubViewController("Modal Sub")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
     
}
