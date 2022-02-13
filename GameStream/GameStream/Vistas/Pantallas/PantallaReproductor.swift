//
//  PantallaReproductor.swift
//  GameStream
//
//  Created by Joaquin Segovia on 13/2/22.
//

import SwiftUI
import AVKit

struct PantallaReproductor: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let screenSize: CGRect = UIScreen.main.bounds
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var urlGlobal:String
    var imagenNameToLoadBG:String
    
    var body: some View{
        ZStack {
            Image(imagenNameToLoadBG).resizable().scaledToFill().blur(radius: /*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/).frame(maxWidth: 400, minHeight: screenHeight+20, alignment: .center).padding(.top, -10)
            
            VideoPlayer(player: AVPlayer(url: URL(string: urlGlobal)!))
                .frame(width: (screenWidth-15), height: 320, alignment: .center).padding(.all, 2.0)
            VStack {
                Spacer().frame(height: 500)
                Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {
                    Text(String("Volver").uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: 100, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("dark-cian"), lineWidth: 2).shadow(color: .white, radius: 6))
                }).padding(.bottom, 100)
            }
        }.ignoresSafeArea()
    }
    
    init(in_urlGlobal : String, in_imagenNameToLoadBG : String){
        self.urlGlobal = in_urlGlobal
        self.imagenNameToLoadBG = in_urlGlobal
        
        print("urlGlobal \(urlGlobal)")
    }
}

struct PantallaReproductor_Previews: PreviewProvider {
    static var previews: some View {
        PantallaReproductor(in_urlGlobal : "", in_imagenNameToLoadBG : "")
    }
}
