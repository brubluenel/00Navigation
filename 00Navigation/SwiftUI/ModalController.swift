import Foundation
import SwiftUI

class ModalController: ObservableObject {
    @Published var path: NavigationPath
    @Published var current: State
    
    init(
        path: NavigationPath = .init(),
        initial: State
    ) {
        self.current = initial
        self.path = path
    }
    
    enum State: Equatable {
        case modal1
        case modal2
    }
}
