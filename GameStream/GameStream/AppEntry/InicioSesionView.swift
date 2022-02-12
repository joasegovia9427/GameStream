//
//  InicioSesionView.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI

struct InicioSesionView: View {
    @State var correo:String = ""
    @State var contrasenia:String = ""
    @State var isContraseniaVisible:Bool = false
    @State var isActiveHome:Bool = true
    
    var body: some View{
        
        ScrollView{
            
            VStack(alignment: .leading) {
                
                ////CAMPO PARA CORREO
                Text("Correo electronico").foregroundColor(Color("dark-cian"))
                ZStack(alignment: .leading){
                    if(correo.isEmpty){
                        Text(verbatim: "ejemplo@email.com").font(.caption).foregroundColor(Color("light-grey"))
                    }
                    TextField("", text: $correo).foregroundColor(Color("pure-white"))
                }
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                //// -
                ///
                ////CAMPO PARA CONTRASE:A
                Text("Contraseña").foregroundColor(Color("dark-cian"))
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
                    Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                    if(!contrasenia.isEmpty && !isContraseniaVisible){
                        Spacer().frame(height: 8)
                    }
                    if isContraseniaVisible{
                        Spacer().frame(width: 0.0, height: 6.4)
                    }
                }
                //// -
                VStack{
                    Button(action: {}, label: {
                        Text("Olvidaste tu contraseña?").font(.footnote).foregroundColor(Color("dark-cian")).frame(width: 300, alignment: .trailing).padding(.bottom)
                    })
                    Button(action: iniciarSesion, label: {
                        Text(String("Iniciar Sesion").uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("dark-cian"), lineWidth: 2).shadow(color: .white, radius: 6))
                    }).padding(.bottom, 100)
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
        }
        
        NavigationLink(destination: MenuTabView(), isActive: $isActiveHome, label: {
            EmptyView()
        })
    }
    func iniciarSesion() {
        ////aqui van validaciones logicas correspondientes
        isActiveHome.toggle()
    }
}

struct InicioSesionView_Previews: PreviewProvider {
    static var previews: some View {
        InicioSesionView()
    }
}
