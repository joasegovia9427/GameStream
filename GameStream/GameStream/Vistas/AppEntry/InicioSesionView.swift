//
//  InicioSesionView.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI

let screenWidth = UIScreen.main.bounds.width
var toRest:CGFloat = 0
var spaceToGrow:CGFloat = 300

struct InicioSesionView: View {
    @State var correo_input:String = ""
    @State var contrasenia_input:String = ""
    @State var isContraseniaVisible:Bool = false
    @State var isActiveHome:Bool = false
    
    @State var isAlertLoginViewActive = false
    @State var tituloAlerta = ""
    @State var textoAlerta = ""
    
    @State var countTwitterTap = 0
    
    var body: some View{
        
        ScrollView{
            
            VStack(alignment: .leading) {
                
                ////CAMPO PARA CORREO
                Text("Correo electronico").foregroundColor(Color("dark-cian"))
                ZStack(alignment: .leading){
                    if(correo_input.isEmpty){
                        Text(verbatim: "ejemplo@email.com").font(.caption).foregroundColor(Color("light-grey"))
                    }
                    TextField("", text: $correo_input).foregroundColor(Color("pure-white")).autocapitalization(UITextAutocapitalizationType.none)
                }
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                //// -
                ///
                ////CAMPO PARA CONTRASE:A
                Text("Contraseña").foregroundColor(Color("dark-cian"))
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
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                    if(!contrasenia_input.isEmpty && !isContraseniaVisible){
                        Spacer().frame(height: 8)
                    }
                    if isContraseniaVisible{
                        Spacer().frame(width: 0.0, height: 6.4)
                    }
                }
                //// -
                VStack{
                    //                    Button(action: {}, label: {
                    //                        Text("Olvidaste tu contraseña?").font(.footnote).foregroundColor(Color("dark-cian")).frame(width: 300, alignment: .trailing).padding(.bottom)
                    //                    })
                    
                    Button(action: {}, label: {
                        Text("Olvidaste tu contraseña?").font(.footnote).foregroundColor(Color("dark-cian")).frame(width: spaceToGrow, alignment: .trailing).padding(.bottom)
                    })
                    
                    Button(action: iniciarSesion, label: {
                        Text(String("Iniciar Sesion").uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("dark-cian"), lineWidth: 2).shadow(color: .white, radius: 6))
                    }).padding(.bottom, 100)
                        .alert(isPresented: $isAlertLoginViewActive){
                            Alert(title: Text(tituloAlerta), message: Text(textoAlerta), dismissButton: .default(Text("Entendido")))
                        }
                }
                VStack {
                    Text("Inicia sesion con redes sociales").foregroundColor(.white).frame(width: 300, alignment: .center).padding(.bottom)
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
                        Button(action: {doTwitterFasterLogin()}, label: {
                            HStack(alignment: .center){
                                Image("twitter").resizable().frame(width: 20, height: 20, alignment: .center).padding(.trailing,5).padding(.leading,10)
                                Text("Twitter")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                        }).background(Color("blue-grey")).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                    }
                    if(countTwitterTap>1){
                        Text("\(countTwitterTap)").foregroundColor(.white).frame(width: 300, alignment: .center).padding(.bottom).font(.footnote)
                    }
                    if(countTwitterTap>2){
                        Text("Tap ones more time to cheat login").foregroundColor(.white).frame(width: 300, alignment: .center).padding(.bottom).font(.footnote)
                    }
                }
            }.padding(.horizontal, 77)
        }.background(Color("marine")).onAppear(
            perform: {
                countTwitterTap = 0
                
                if(screenWidth>300){
                    toRest=200
                }
                spaceToGrow = screenWidth - toRest
            }
        )
        //        NavigationLink(destination: MenuTabView(), isActive: $isActiveHome, label: {
        //            EmptyView()
        //        })
        NavigationLink(isActive: $isActiveHome, destination: {MenuTabView()}, label: {EmptyView()})
        //        NavigationLink(isActive: $isActiveHome, destination: {WelcomeScreen()}, label: {EmptyView()})
    }
    
    func iniciarSesion() {
        tituloAlerta = "ERROR :("
        
        if correo_input.isEmpty {
            textoAlerta = "Debe ingresar un correo electornico"
            isAlertLoginViewActive.toggle()
        }else{
            if contrasenia_input.isEmpty {
                textoAlerta = "Debe ingresar una contraseña"
                isAlertLoginViewActive.toggle()
            } else {
                let objetoActualizadorDatos = SaveData()
                
                let datosUsuario:[String] = objetoActualizadorDatos.recuperarDatos()
                
                if !datosUsuario[0].isEmpty && !datosUsuario[1].isEmpty{
                    if (correo_input == datosUsuario[0]) || (contrasenia_input == datosUsuario[1]) {
                        isActiveHome.toggle()
                    } else {
                        textoAlerta = "El correo o la contraseña no coinciden con los guardados en el dispositivo, reintente nuevamente"
                        isAlertLoginViewActive.toggle()
                    }
                }else{
                    textoAlerta = "No hay datos guardados en el dispositivo, cree una cuenta en REGISTRO"
                    isAlertLoginViewActive.toggle()
                }
            }
        }
    }
    
    func doTwitterFasterLogin() {
        countTwitterTap+=1
        if countTwitterTap==4 {
            isActiveHome.toggle()
        }
    }
}

struct InicioSesionView_Previews: PreviewProvider {
    static var previews: some View {
        InicioSesionView()
    }
}
