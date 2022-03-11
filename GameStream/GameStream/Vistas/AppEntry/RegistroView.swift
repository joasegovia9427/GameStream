//
//  RegistroView.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI

struct RegistroView: View {
    @State var correo_input:String = ""
    @State var contrasenia_input:String = ""
    @State var confirmacionContrasenia_input:String = ""
    @State var nombre_input:String = ""
    @State var isContraseniaVisible:Bool = false
    
    @State var isAlertActualizarDatosViewActive = false
    @State var tituloAlerta = ""
    @State var textoAlerta = ""
        
    var body: some View{
        ScrollView{
            VStack(alignment: .center){
                Text("Elije una foto de perfil").font(.subheadline).fontWeight(.bold).foregroundColor(.white).frame(width: 250, alignment: .center)
                Text("Puedes cambiar o elegirla mas adelante").fontWeight(.light).font(.footnote).foregroundColor(Color("light-grey")).frame(width: 300, alignment: .center).padding(.bottom)
                Button(action: tomarFoto) {
                    ZStack{
                        Image("40-profile-picture").resizable().aspectRatio(contentMode: .fill).frame(width: 68, height: 68, alignment: .center).clipShape(Circle())
                        Image(systemName: "camera").resizable().aspectRatio(contentMode: .fit).frame(width: 20, height:20, alignment: .center).foregroundColor(Color("pure-white"))
                    }
                }
            }.padding(.bottom, 5)
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
                
                ////CAMPO PARA CORREO
                Text("Correo electronico*").foregroundColor(Color("dark-cian"))
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
                VStack{
                    Button(action: registro, label: {
                        Text(String("Resgistrate").uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("dark-cian"), lineWidth: 2).shadow(color: .white, radius: 6))
                    }).padding(.bottom, 30)
                }
                VStack {
                    Text("Resgistrate con redes sociales").foregroundColor(.white).frame(width: 300, alignment: .center).padding(.bottom)
                    HStack{
                        Button(action: {}, label: {
                            HStack(alignment: .center) {
                                Image("facebook").resizable().frame(width: 20, height: 20, alignment: .center).padding(.trailing,5).padding(.leading,5)
                                Text("Facebook")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                        }).background(Color("blue-grey")).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                        
                        Spacer().frame(width: 20, alignment: .center)
                        
                        Button(action: {}, label: {
                            HStack(alignment: .center){
                                Image("twitter").resizable().frame(width: 20, height: 20, alignment: .center).padding(.trailing,5).padding(.leading,10)
                                Text("Twitter")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                        }).background(Color("blue-grey")).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    }
                }
            }.padding(.horizontal, 77)
        }.background(Color("marine"))
        
    }
    
    func tomarFoto() {
        print("Estoy editando la foto")
    }
    
    func registro() {
        print("Estoy registrando")
    }
}

struct RegistroView_Previews: PreviewProvider {
    static var previews: some View {
        RegistroView()
    }
}
