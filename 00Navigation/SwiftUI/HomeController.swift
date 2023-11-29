import Foundation
import Combine
import SwiftUI

class HomeController: ObservableObject {
    @Published var showModal: Bool = false
    @Published var showBottomSheet: Bool = false
    
    @Published var path: NavigationPath = .init()
}
