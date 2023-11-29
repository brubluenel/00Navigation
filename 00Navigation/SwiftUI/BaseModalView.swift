import Foundation
import SwiftUI

struct BaseModalWrapper: View {
    @ObservedObject var homeController: HomeController
    @StateObject var controller: ModalController
    
    init(
        homeController: HomeController,
        _ initial: ModalController.State
    ) {
        self.homeController = homeController
        self._controller = .init(wrappedValue: .init(initial: initial))
    }
    
    var body: some View {
        NavigationStack(path: $controller.path) {
            switch controller.current {
            case .modal1:
                Modal_1_View(controller: homeController, modalController: controller)
            case .modal2:
                Modal_2_View(controller: homeController, modalController: controller)
            }
        }
    }
}
