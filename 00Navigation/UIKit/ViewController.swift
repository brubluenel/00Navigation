import UIKit

class ViewController: UIViewController {
    private var buttonStackView = UIStackView()
    private var modalButton = {
        var button = UIButton()
        button.setTitle("Modal", for: .normal)
        return button
    }()
    
    private var subButton = {
        var button = UIButton()
        button.setTitle("Sub", for: .normal)
        return button
    }()
    
    private var bottomSheetButton = {
        var button = UIButton()
        button.setTitle("BottomSheet", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    private func initView() {
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.spacing = 8
        buttonStackView.axis = .vertical
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        modalButton.backgroundColor = .systemBlue
        subButton.backgroundColor = .systemBlue
        bottomSheetButton.backgroundColor = .systemBlue
        
        buttonStackView.addArrangedSubview(modalButton)
        buttonStackView.addArrangedSubview(subButton)
        buttonStackView.addArrangedSubview(bottomSheetButton)
        buttonStackView.subviews.forEach({[self] in ($0 as? UIButton)?.addTarget(self, action: #selector(self.tapButton(_:)), for: .touchUpInside) })
    }
    
    @objc
    func tapButton(_ sender: UIButton) {
        if  sender === self.bottomSheetButton {
            self.showBottomSheet()
        } else if sender === self.modalButton {
            self.showModal()
        } else if sender === self.subButton {
            self.showSubModal()
        }
    }
    
    private func showModal() {
        let vc = Modal_1_ViewController()
        let navCon = BaseNavigationController(rootViewController: vc)
        self.present(navCon, animated: true)
    }
    
    private func showSubModal() {
        let vc = SubViewController("Sub")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func showBottomSheet() {
        let vc = BottomSheetViewController()
        self.present(vc, animated: false)
    }
}
