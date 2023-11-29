
import Foundation
import UIKit

class SubViewController: BaseViewController {
    private var leftTitle: String
    
    init(_ leftTitle: String) {
        self.leftTitle = leftTitle
        super.init(nibName: nil, bundle: nil )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
    }
    
    private func initView() {
        setBackButton()
        leftTitleLabel.text = leftTitle
        view.backgroundColor = .systemBackground
    }
}
