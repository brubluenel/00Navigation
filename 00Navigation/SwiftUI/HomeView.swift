import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject var controller = HomeController()
    
    var body: some View {
        NavigationStack(path: $controller.path) {
            ZStack {
                
                VStack(content: {
                    Button(action: {
                        controller.showModal = true
                    }, label: {
                        Text("Modal")
                            .foregroundStyle(Color.white)
                            .background(.blue)
                    })
                    Button(action: {
                        controller.path.append("Sub")
                    }, label: {
                        Text("Sub")
                            .foregroundStyle(Color.white)
                            .background(.blue)
                    })
                    
                    Button(action: {
                        controller.showBottomSheet = true
                        
                    }, label: {
                        Text("BottomSheet")
                            .foregroundStyle(Color.white)
                            .background(.blue)
                    })
                })
                
            }
            .sheet(isPresented: $controller.showBottomSheet, content: {
                BottomSheetView(isPresented: $controller.showBottomSheet)
            })
            .fullScreenCover(isPresented: $controller.showModal, content: {
                BaseModalWrapper(
                    homeController: self.controller,
                    .modal1
                )
            })
            .navigationDestination(for: String.self) { value in
                SubView(text: value)
            }
        }
    }
}
