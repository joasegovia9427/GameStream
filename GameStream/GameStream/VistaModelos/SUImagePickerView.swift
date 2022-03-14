//
//  SUImagePickerView.swift
//  SUImagePickerView
//
//  Created by Karthick Selvaraj on 02/05/20.
//  Copyright © 2020 Karthick Selvaraj. All rights reserved.
//

import SwiftUI
import UIKit

struct SUImagePickerView: UIViewControllerRepresentable {
    
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var image: Image?
    @Binding var isPresented: Bool
    @Binding var capturo: Bool
    
    func makeCoordinator() -> ImagePickerViewCoordinator {
        return ImagePickerViewCoordinator(image: $image, isPresented: $isPresented, capturo: $capturo)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let pickerController = UIImagePickerController()
        pickerController.sourceType = sourceType
        pickerController.delegate = context.coordinator
        return pickerController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // Nothing to update here
    }

}

class ImagePickerViewCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: Image?
    @Binding var isPresented: Bool
    @Binding var capturo: Bool
        
    init(image: Binding<Image?>, isPresented: Binding<Bool>, capturo: Binding<Bool>) {
        self._image = image
        self._isPresented = isPresented
        self._capturo = capturo
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //modificar nombre constante
        if let UiImageFromUser = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.image = Image(uiImage: UiImageFromUser)
            
            //codigo agregado
            if let data = UiImageFromUser.pngData(){
                let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                let url = documents.appendingPathComponent("fotoperfil.png")
                
                do{
                    try data.write(to: url)
                }catch{
                   print("no pude guardar foto en el folder del dispositivo \(error)")
                }
                
            }
            
        }
        self.capturo = true
        self.isPresented = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.isPresented = false
    }
    
    
    
}

