//
//  PantallaPerfilEdit.swift
//  GameStream
//
//  Created by Joaquin Segovia on 9/3/22.
//

import SwiftUI

struct PantallaPerfilEdit: View {
    
    var body: some View {
        ZStack{
            Color("marine").ignoresSafeArea()
            
            ScrollView(showsIndicators: false){
                VStack{
                    ModuloEditarPhoto()
                    ModuloEditarData()
                }
            }
        }
    }
}

struct ModuloEditarPhoto : View{
    
    var body: some View{
        VStack(alignment: .center){
            Text("Editar perfil").font(.title2).fontWeight(.bold).foregroundColor(Color("cian")).padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
            
            VStack{
                Button(action: tomarFoto) {
                    ZStack{
                        Image("40-profile-picture").resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118, alignment: .center).clipShape(Circle())
                        Image(systemName: "camera").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height:40, alignment: .center).foregroundColor(Color("pure-white"))
                    }
                }
            }.padding(EdgeInsets(top: 26, leading: 0, bottom: 32, trailing: 0))
            
        }.padding()
        
    }
    
    func tomarFoto() {
        print("Estoy editando la foto")
    }
}

struct ModuloEditarData : View{
    @State var correo_input:String = ""
    @State var contrasenia_input:String = ""
    @State var confirmacionContrasenia_input:String = ""
    @State var nombre_input:String = ""
    @State var isContraseniaVisible:Bool = false
    
    @State var isAlertActualizarDatosViewActive = false
    @State var tituloAlerta = ""
    @State var textoAlerta = ""
    
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
                TextField("", text: $correo_input).foregroundColor(Color("pure-white"))
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
            }
            Spacer()
            
        }.padding(.horizontal, 26).onAppear {
            recuperarDatos()
        }
    }
    
    func actualizarDatos() {
        
        let objetoActualizadorDatos = SaveData()
        
        let resultado = objetoActualizadorDatos.guardarDatos(correo: correo_input, contrasenia: contrasenia_input, nombre: nombre_input)
        
        print("Se guardaron los datos con exito? \(resultado)")
        
        if resultado {
            tituloAlerta = "CORRECTO :)"
            textoAlerta = "Resultado de actualiar datos: Se han cuardado los datos correctamente"
        } else {
            tituloAlerta = "ERROR :("
            textoAlerta = "Resultado de actualiar datos: Ha ocurrido un error al intentar guardar los datos, reintente"
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
                 
    }
    
    
}


struct PantallaPerfilEdit_Previews: PreviewProvider {
    static var previews: some View {
        PantallaPerfilEdit()
    }
}
