//
//  ContentView.swift
//  UploadImage
//
//  Created by Nitin Bhatt on 10/22/20.
//

import SwiftUI

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var isCoordinatorShown: Bool
    @Binding var imageCoordinator: Image?
    
    init(isShown: Binding<Bool>, image: Binding<Image?>) {
        _isCoordinatorShown = isShown
        _imageCoordinator = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        imageCoordinator = Image(uiImage: unwrapImage)
        isCoordinatorShown = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isCoordinatorShown = false
    }
}

struct CaptureImageFromGalleryView {
  
  @Binding var isShown: Bool
  @Binding var image: Image?
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(isShown: $isShown, image: $image)
  }
}

extension CaptureImageFromGalleryView: UIViewControllerRepresentable {
  func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageFromGalleryView>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController,
                              context: UIViewControllerRepresentableContext<CaptureImageFromGalleryView>) {
    
  }
}

struct ContentView: View {
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    
    var body: some View {
        VStack{
            image?.resizable()
                  .frame(width: 250, height: 200)
                  .clipShape(Circle())
                  .overlay(Circle().stroke(Color.white, lineWidth: 4))
                  .shadow(radius: 10)
            
            Button(action: {
                self.showCaptureImageView.toggle()
            }){
             Text("UPLOAD IMAGE").foregroundColor(Color.white)
            }.padding(10).background(Color.black)
                        
            .fullScreenCover(isPresented: $showCaptureImageView) {
                CaptureImageFromGalleryView(isShown: $showCaptureImageView, image: $image)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
