import SwiftUI

struct BottomSheetView: View {
    @Binding var isPresented: Bool
    @State private var dragOffset = CGSize.zero

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 24) {
                Text("타이틀")
                    .font(.title2)
                    .foregroundColor(.primary)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)

                Text("추가 링크 누르기")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)

                HStack(spacing: 0) {
                    Button("닫기") {
                        self.handleCloseAction()
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)

                    Button("확인") {
                        // Handle confirm action here
                    }
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
                }

                Spacer()
            }
            .padding()
            .cornerRadius(16)
            .frame(width: geometry.size.width, height: self.viewHeight(geometry: geometry), alignment: .bottom)
            .offset(y: max(self.dragOffset.height + self.dismissibleHeight(geometry: geometry), 0))
            .gesture(DragGesture().onChanged { value in
                self.dragOffset = value.translation
            }.onEnded { value in
                if value.translation.height > 100 {
                    self.handleCloseAction()
                } else {
                    self.dragOffset = .zero
                }
            })
            .animation(.easeOut, value: dragOffset)
            .transition(.move(edge: .bottom))
        }
        .edgesIgnoringSafeArea(.all)
    }

    private func viewHeight(geometry: GeometryProxy) -> CGFloat {
        return geometry.size.height / 2
    }

    private func dismissibleHeight(geometry: GeometryProxy) -> CGFloat {
        return geometry.size.height - 100 
    }

    private func handleCloseAction() {
        self.isPresented = false
    }
}

//struct ContentView: View {
//    @State private var showBottomSheet = false
//
//    var body: some View {
//        Button("Show Bottom Sheet") {
//            self.showBottomSheet = true
//        }
//        .sheet(isPresented: $showBottomSheet) {
//            BottomSheetView(isPresented: self.$showBottomSheet)
//        }
//    }
//}
