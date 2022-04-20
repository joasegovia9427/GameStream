//
//  VentanaPopUp.swift
//  GameStream
//
//  Created by Joaquin Segovia on 14/3/22.
//

import SwiftUI

struct VentanaPopUp: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var isCerrarPopOver:Bool// = false
    @Binding var isCameraSelected:Bool// = false
    @Binding var isLibrarySelected:Bool// = false
    @Binding var isLoadedFromCamera:Bool
    
    init(isCerrarPopOver: Binding<Bool>, isCameraSelected: Binding<Bool>, isLibrarySelected: Binding<Bool>, isLoadedFromCamera: Binding<Bool>) {
        self._isCerrarPopOver = isCerrarPopOver
        self._isCameraSelected = isCameraSelected
        self._isLibrarySelected = isLibrarySelected
        self._isLoadedFromCamera = isLoadedFromCamera
    }
    
    var body: some View {
        ZStack{
            Color("marine").ignoresSafeArea()
            
            VStack {
                Text("Elije un metodo para cargar una foto de perfil").font(.title2).fontWeight(.bold).foregroundColor(.white).multilineTextAlignment(.center).padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0)).padding(50)
                
                //                Spacer()
                
                HStack{
                    
                    Button(action: {
                        self.isCameraSelected = true
                        self.isLibrarySelected = false
                        self.isLoadedFromCamera = true
                        self.isCerrarPopOver = true
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        VStack(alignment: .center){
                            
                            Image(systemName: "camera.shutter.button.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height:60, alignment: .center).foregroundColor(Color("pure-white"))
                            
                            Spacer().padding(.bottom, 10)
                            
                            Text("Camara")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("cian"))
                                .frame(maxWidth: .infinity, alignment: .center).padding(.bottom,10)
                        }.padding(EdgeInsets(top: 35, leading: 11, bottom: 35, trailing: 11))
                    }).background(Color("blue-grey")).cornerRadius(8.0).frame(width: 160, height: 120, alignment: .center
                    )
                    
                    Spacer().frame(width: 20)
                    
                    Button(action: {
                        self.isCameraSelected = false
                        self.isLibrarySelected = true
                        self.isLoadedFromCamera = false
                        self.isCerrarPopOver = true
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        VStack(alignment: .center){
                            
                            Image(systemName: "photo.fill.on.rectangle.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 60, height:60, alignment: .center).foregroundColor(Color("pure-white"))
                            
                            Spacer().padding(.bottom, 10)
                            
                            Text("Carrusel")
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(Color("cian"))
                                .frame(maxWidth: .infinity, alignment: .center).padding(.bottom,10)
                        }.padding(EdgeInsets(top: 35, leading: 11, bottom: 35, trailing: 11))
                    }).background(Color("blue-grey")).cornerRadius(8.0).frame(width: 160, height: 120, alignment: .center
                    )
                    
                }.padding(50)
                
                //                Spacer()
                
                Button(action: {
                    self.isCameraSelected = false
                    self.isLibrarySelected = false
                    self.isCerrarPopOver = true
                    self.isLoadedFromCamera = false
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Volver")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                }).background(Color("blue-grey")).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/).padding(50)
                
            }.padding()
            
        }
    }
}

struct VentanaPopUp_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
        //        VentanaPopUp()
    }
}
