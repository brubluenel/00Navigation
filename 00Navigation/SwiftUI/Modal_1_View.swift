import Foundation
import SwiftUI

struct Modal_1_View: View {
    @ObservedObject var controller: HomeController
    @ObservedObject var modalController: ModalController
    var body: some View {
        VStack(content: {
            
            Button(action: {
                modalController.current = .modal2
            }, label: {
                Text("Modal2")
                    .foregroundStyle(Color.white)
                    .background(.blue)
            })
        })
        .navigationTitle("Modal1")
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    controller.showModal = false
                }, label: {
                    Image(systemName: "xmark")
                })
            }
        })
    }
}


struct Modal_2_View: View {
    @ObservedObject var controller: HomeController
    @ObservedObject var modalController: ModalController
    var body: some View {
        VStack(content: {
            Button(action: {
                modalController.path.append("ModalSub")
            }, label: {
                Text("ModalSub")
                    .foregroundStyle(Color.white)
                    .background(.blue)
            })
        })
        .navigationTitle("Modal2")
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    controller.showModal = false
                }, label: {
                    Image(systemName: "xmark")
                })
            }
        })
        .navigationDestination(for: String.self) { value in
            SubView(text: value)
        }
    }
}

struct SubView: View {
    var text: String
    init(text: String) {
        self.text = text
    }
    
    
    var body: some View {
        Text("Sub")
            .navigationTitle(text)
    }
}
