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
                        Image("08-swiftuiapps-2105-goto-prueba").resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118, alignment: .center).clipShape(Circle())
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
    @State var correo:String = ""
    @State var contrasenia:String = ""
    @State var confirmacionContrasenia:String = ""
    @State var isContraseniaVisible:Bool = false
    
    var body: some View{
        
        VStack(alignment: .leading) {
            ////CAMPO PARA CORREO
            Text("Correo electronico").foregroundColor(Color("dark-cian"))
            ZStack(alignment: .leading){
                if(correo.isEmpty){
                    Text(verbatim: "ejemplo@email.com").font(.caption).foregroundColor(Color("light-grey"))
                }
                TextField("", text: $correo).foregroundColor(Color("pure-white"))
            }
            Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom,10)
            //// -
            
            VStack(alignment: .leading){
                ////CAMPO PARA CONTRASE:A
                Text("Contraseña*").foregroundColor(Color("dark-cian"))
                ZStack(alignment: .leading){
                    if(contrasenia.isEmpty){
                        Text(verbatim: "escribe tu contraseña").font(.caption).foregroundColor(Color("light-grey"))
                    }
                    HStack{
                        if isContraseniaVisible{
                            TextField("", text: $contrasenia).foregroundColor(Color("pure-white"))
                        }else{
                            SecureField("", text: $contrasenia).foregroundColor(Color("pure-white"))
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
                    if(!contrasenia.isEmpty && !isContraseniaVisible){
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
                    if(confirmacionContrasenia.isEmpty){
                        Text(verbatim: "confirmar contraseña").font(.caption).foregroundColor(Color("light-grey"))
                    }
                    if isContraseniaVisible{
                        TextField("", text: $confirmacionContrasenia).foregroundColor(Color("pure-white"))
                    }else{
                        SecureField("", text: $confirmacionContrasenia).foregroundColor(Color("pure-white"))
                    }
                }
                VStack{
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom,10)
                    if(!confirmacionContrasenia.isEmpty && !isContraseniaVisible){
                        Spacer().frame(height: 8)
                    }
                    if isContraseniaVisible{
                        Spacer().frame(width: 0.0, height: 6.4)
                    }
                }
                //// -
            }
            
            Spacer().padding(5)
            VStack{
                Button(action: registro, label: {
                    Text(String("Actualizar datos").uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("dark-cian"), lineWidth: 2).shadow(color: .white, radius: 6))
                })
            }
            
            
        }.padding(.horizontal, 26)
    }
    
    func registro() {
        print("Estoy actualizando")
    }
}


struct PantallaPerfilEdit_Previews: PreviewProvider {
    static var previews: some View {
        PantallaPerfilEdit()
    }
}
