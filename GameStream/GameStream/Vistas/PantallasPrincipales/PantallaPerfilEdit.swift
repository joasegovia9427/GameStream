//
//  PantallaPerfilEdit.swift
//  GameStream
//
//  Created by Joaquin Segovia on 9/3/22.
//

import SwiftUI

var isFromCamera:Bool = false
var isFromCameraReturned:String = ""
//var isFotoFromCamera:String = "false"
//var isLoadedFromCameraEdit:Bool = false

struct PantallaPerfilEdit: View {
    @State var isLoadedFromCamera = false
    
    var body: some View {
        ZStack{
            Color("marine").ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                VStack{
                    ModuloEditarPhoto(isLoadedFromCamera: $isLoadedFromCamera)
                    ModuloEditarData(isLoadedFromCamera: $isLoadedFromCamera)
                }
            }
        }
    }
}

struct ModuloEditarPhoto : View{
    @Binding var isLoadedFromCamera:Bool
    
    @State var imagenPerfil: Image? = Image("40-profile-picture")
    @State var isCameraActive = false
    @State var isLibraryActive = false
    
    @State var imagenRecuperadaPerfil: UIImage = UIImage(named: "40-profile-picture")!
    @State var imagenRecuperadaPerfilAUX: UIImage = UIImage(named: "40-profile-picture")!
    @State var isImageGuardadaShow = false
    @State var ocultarAnterior = false
    
    @State var isMostrarPopOver: Bool = false
    @State var isCerrarPopOverReturned = false
    @State var isCameraSelectedReturned = false
    @State var isLibrarySelectedReturned = false
    
    //    @State var isLoadedFromCamera = false
    //    isLoadedFromCamera: Binding<Bool>
    //    @State var isLoadedFromCameraEdit:Bool = false
    
    var body: some View{
        VStack(alignment: .center){
            Text("Editar perfil").font(.title2).fontWeight(.bold).foregroundColor(Color("cian")).padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            
            VStack{
                Button(action: tomarFoto) {
                    ZStack{
                        if !ocultarAnterior {
                            Image(uiImage: imagenRecuperadaPerfil).resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118, alignment: .center).clipShape(Circle())
                        } else {
                            imagenPerfil!
                                .resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118, alignment: .center).clipShape(Circle())
                        }
                        
                        //                        Image("40-profile-picture").resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118, alignment: .center).clipShape(Circle())
                        Image(systemName: "camera").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height:40, alignment: .center).foregroundColor(Color("pure-white"))
                            .sheet(isPresented: $isCameraActive, content: {
                                SUImagePickerView(sourceType: .camera, image: $imagenPerfil, isPresented: $isCameraActive, capturo: $ocultarAnterior, isLoadedFromCamera: $isLoadedFromCamera)
                            })
                            .sheet(isPresented: $isLibraryActive, content: {
                                SUImagePickerView(sourceType: .photoLibrary, image: $imagenPerfil, isPresented: $isLibraryActive, capturo: $ocultarAnterior, isLoadedFromCamera: $isLoadedFromCamera)
                            })
                        
                    }
                }.popover(isPresented: $isMostrarPopOver) {
                    VentanaPopUp(isCerrarPopOver: $isMostrarPopOver, isCameraSelected: $isCameraActive, isLibrarySelected: $isLibraryActive, isLoadedFromCamera: $isLoadedFromCamera)
                    
                    //                    .popover(isPresented: $isMostrarPopOver) {
                    //                        VentanaPopUp(isCerrarPopOver: $isMostrarPopOver, isCameraSelected: $isCameraSelectedReturned, isLibrarySelected: $isLibrarySelectedReturned)
                    
                }
                
            }.padding(EdgeInsets(top: 26, leading: 0, bottom: 32, trailing: 0))
            
        }.onAppear {
            print("Revisando si tengo foto de perfil")
            
            if returnUIImage(named: "fotoperfil.png") != nil{
                imagenRecuperadaPerfilAUX = returnUIImage(named: "fotoperfil.png")!
                
                if isFotoFromCameraGlobal=="true" {
                    imagenRecuperadaPerfil = imagenRecuperadaPerfilAUX.rotate(radians: .pi/2)! // Rotate 90 degrees
                }else{
                    imagenRecuperadaPerfil = imagenRecuperadaPerfilAUX
                }
                
                isImageGuardadaShow = true
            }else{
                print("No se encontro foto de perfil guardada en el dispositivo")
            }
        }
    }
    
    func tomarFoto() {
        print("Estoy editando la foto")
        
        isMostrarPopOver.toggle()
        
        isFromCamera = isCameraActive
        //        print("valores de varialbes luego de popup")
        //        print("isCameraSelectedReturned: \(isCameraSelectedReturned)")
        //        print("isLibrarySelectedReturned: \(isLibrarySelectedReturned)")
        //
        //        if isCameraSelectedReturned {
        //            isCameraActive.toggle()
        //        }
        //        if isLibrarySelectedReturned {
        //            isLibraryActive.toggle()
        //        }
    }
    
    func returnUIImage(named: String) -> UIImage?{
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }
        return nil
    }
    
}

struct ModuloEditarData : View{
    @Binding var isLoadedFromCamera:Bool
    
    @State var correo_input:String = ""
    @State var contrasenia_input:String = ""
    @State var confirmacionContrasenia_input:String = ""
    @State var nombre_input:String = ""
    @State var isContraseniaVisible:Bool = false
    
    @State var isAlertActualizarDatosViewActive = false
    @State var tituloAlerta = ""
    @State var textoAlerta = ""
    
    @State var isMostrarPopOver: Bool = false
    @State var isCerrarPopOverReturned = false
    @State var isCameraSelectedReturned = false
    @State var isLibrarySelectedReturned = false
    
    //    @State var isLoadedFromCamera = false
    
    var body: some View{
        
        VStack(alignment: .leading) {
            
            ////CAMPO PARA NOMBRE
            Text("Nombre").foregroundColor(Color("dark-cian"))
            ZStack(alignment: .leading){
                if(nombre_input.isEmpty){
                    Text(verbatim: "Introduce tu nombre de usuario").font(.caption).foregroundColor(Color("light-grey"))
                }
                TextField("", text: $nombre_input).foregroundColor(Color("pure-white"))
            }
            Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom,10)
            //// -
            ///
            ///
            ////CAMPO PARA CORREO
            Text("Correo electronico").foregroundColor(Color("dark-cian"))
            ZStack(alignment: .leading){
                if(correo_input.isEmpty){
                    Text(verbatim: "ejemplo@email.com").font(.caption).foregroundColor(Color("light-grey"))
                }
                TextField("", text: $correo_input).foregroundColor(Color("pure-white")).autocapitalization(UITextAutocapitalizationType.none)
            }
            Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom,10)
            //// -
            
            VStack(alignment: .leading){
                ////CAMPO PARA CONTRASE:A
                Text("Contraseña*").foregroundColor(Color("dark-cian"))
                ZStack(alignment: .leading){
                    if(contrasenia_input.isEmpty){
                        Text(verbatim: "escribe tu contraseña").font(.caption).foregroundColor(Color("light-grey"))
                    }
                    HStack{
                        if isContraseniaVisible{
                            TextField("", text: $contrasenia_input).foregroundColor(Color("pure-white"))
                        }else{
                            SecureField("", text: $contrasenia_input).foregroundColor(Color("pure-white"))
                        }
                        Button(action: {isContraseniaVisible.toggle()}, label: {
                            if isContraseniaVisible{
                                Image(systemName:"eye.slash.fill").foregroundColor(Color("light-grey"))
                            }else{
                                
                                Image(systemName:"eye.fill").foregroundColor(Color("dark-cian"))
                            }
                        })
                    }
                }
                VStack{
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom,10)
                    if(!contrasenia_input.isEmpty && !isContraseniaVisible){
                        Spacer().frame(height: 8)
                    }
                    if isContraseniaVisible{
                        Spacer().frame(width: 0.0, height: 6.4)
                    }
                }
                //// -
                ///
                ////CAMPO PARA CONTRASE:A
                Text("Confirmar contraseña*").foregroundColor(Color("dark-cian"))
                ZStack(alignment: .leading){
                    if(confirmacionContrasenia_input.isEmpty){
                        Text(verbatim: "confirmar contraseña").font(.caption).foregroundColor(Color("light-grey"))
                    }
                    if isContraseniaVisible{
                        TextField("", text: $confirmacionContrasenia_input).foregroundColor(Color("pure-white"))
                    }else{
                        SecureField("", text: $confirmacionContrasenia_input).foregroundColor(Color("pure-white"))
                    }
                }
                VStack{
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom,10)
                    if(!confirmacionContrasenia_input.isEmpty && !isContraseniaVisible){
                        Spacer().frame(height: 8)
                    }
                    if isContraseniaVisible{
                        Spacer().frame(width: 0.0, height: 6.4)
                    }
                }
                //// -
            }
            ///
            Spacer().padding(5)
            VStack{
                Button(action: actualizarDatos, label: {
                    ZStack{
                        Spacer().frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("dark-cian"), lineWidth: 2).shadow(color: .white, radius: 6))
                        
                        Text(String("Actualizar datos").uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(.white).frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18)).background(Color("marine")).cornerRadius(12)
                    }
                }).alert(isPresented: $isAlertActualizarDatosViewActive){
                    Alert(title: Text(tituloAlerta), message: Text(textoAlerta), dismissButton: .default(Text("Entendido")))
                }
                
                
                //                Button(action: {isMostrarPopOver.toggle()}, label: {
                //                    Text(String("Mostrar popup").uppercased())
                //                        .fontWeight(.bold)
                //                        .foregroundColor(.white).frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .center)
                //                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                //
                //                }).popover(isPresented: $isMostrarPopOver) {
                //                    VentanaPopUp(isCerrarPopOver: $isMostrarPopOver, isCameraSelected: $isCameraSelectedReturned, isLibrarySelected: $isLibrarySelectedReturned)
                //                }
                
                
                //                    .popover(isPresented: $isMostrarPopOver, attachmentAnchor: .point(UnitPoint(x: 20, y: 20)), arrowEdge: .top, content: {
                //                        VStack { // just example
                //                            Text("Test").padding(.top)
                //                            TextField("Placeholder", text: $nombre_input)
                //                                .padding(.horizontal)
                //                                .padding(.bottom)
                //                                .frame(width: 200)
                //                        }
                //                    }
                //                )
                //
                
                //
                
                
                //                    .popover(isPresented: $isMostrarPopOver, attachmentAnchor: .rect(.bounds), arrowEdge: .bottom, content: {
                //                    VentanaPopUp().frame(width: 100, height: 100)
                //                    Text(String("Texto").uppercased())
                //                        .fontWeight(.bold)
                //                        .foregroundColor(.white).frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .center)
                //                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                //                    Text(String("Texto").uppercased())
                //                        .fontWeight(.bold)
                //                        .foregroundColor(.black).frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .center)
                //                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                //                })
                
            }
            Spacer()
            
        }.padding(.horizontal, 26)
            .onAppear {
                recuperarDatos()
            }
    }
    
    func actualizarDatos() {
        
        tituloAlerta = "ERROR :("
        
        if nombre_input.isEmpty { ////this must to be refactored to
            textoAlerta = "Debe ingresar un nombre"
        }else{
            
            if correo_input.isEmpty {
                textoAlerta = "Debe ingresar un correo electornico"
            }else{
                if contrasenia_input.isEmpty {
                    textoAlerta = "Debe ingresar una contraseña"
                } else {
                    if confirmacionContrasenia_input.isEmpty {
                        textoAlerta = "Debe ingresar confirmación de contraseña"
                    } else {
                        if contrasenia_input != confirmacionContrasenia_input {
                            textoAlerta = "La contraseña y la confirmacion deben coincidir"
                        } else {
                            
                            let objetoActualizadorDatos = SaveData()
                            
                            print("antes de evaluar isLoadedFromCamera \(isLoadedFromCamera)")
                            if isLoadedFromCamera {
                                print("Entro a setear isLoadedFromCamera = true")
                                isFotoFromCamera = "true"
                            }else{
                                isFotoFromCamera = "false"
                            }
                            
                            let resultado = objetoActualizadorDatos.guardarDatos(correo: correo_input, contrasenia: contrasenia_input, nombre: nombre_input, isFotoFromCamera: isFotoFromCamera)
                            
                            print("Se guardaron los datos con exito? \(resultado)")
                            
                            if resultado {
                                UIApplication.shared.keyWindow?.endEditing(true)
                                
                                tituloAlerta = "CORRECTO :)"
                                textoAlerta = "Resultado de actualiar datos: Se han guardado los datos correctamente"
                            } else {
                                tituloAlerta = "ERROR :("
                                textoAlerta = "Resultado de actualiar datos: Ha ocurrido un error al intentar guardar los datos, reintente"
                            }
                        }
                    }
                }
            }
        }
        isAlertActualizarDatosViewActive.toggle()
        
    }
    
    func recuperarDatos() {
        
        let objetoActualizadorDatos = SaveData()
        
        let datosUsuario:[String] = objetoActualizadorDatos.recuperarDatos()
        
        if !datosUsuario[0].isEmpty {
            correo_input = datosUsuario[0]
        }
        if !datosUsuario[1].isEmpty {
            contrasenia_input = datosUsuario[1]
            confirmacionContrasenia_input = datosUsuario[1]
        }
        if !datosUsuario[2].isEmpty {
            nombre_input = datosUsuario[2]
        }
        if !datosUsuario[3].isEmpty {
            isFotoFromCameraGlobal = datosUsuario[3]
            if isFotoFromCameraGlobal=="true" {
                isLoadedFromCamera = true
            }
        }
    }
}

struct PantallaPerfilEdit_Previews: PreviewProvider {
    static var previews: some View {
        PantallaPerfilEdit()
    }
}
