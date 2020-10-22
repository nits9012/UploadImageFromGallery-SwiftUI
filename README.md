# UploadImageFromGallery-SwiftUI

This example will help you to understand how we can upload a image from photo gallery in swiftUI

![Alt Text](https://github.com/nits9012/UploadImageFromGallery-SwiftUI/blob/main/UploadImage.gif)

Also, do you know now you can present full screen view in SwiftUI. I have used fullScreenCover to present photo gallery in full screen, please check my code:

    Button(action: {
     self.showCaptureImageView.toggle()
    }){
     Text("UPLOAD IMAGE").foregroundColor(Color.white)
     }.padding(10).background(Color.black)                  
     .fullScreenCover(isPresented: $showCaptureImageView){
        CaptureImageFromGalleryView(isShown: $showCaptureImageView, image: $image)
    }

I hope this will help, Thank you
