//
//  PantallaPerfil.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI

struct PantallaPerfil: View {
    @State var nombreUsuario:String = "Lanie Janecki"
    @State var isLogOutViewActive = false
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack {
                ScrollView{
                    VStack{
                        Text("Perfil").font(.title2).fontWeight(.bold).foregroundColor(Color("cian")).padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                        
                        VStack{
                            Image("40-profile-picture").resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118, alignment: .center).clipShape(Circle())
                            
                            Text(nombreUsuario).fontWeight(.bold).foregroundColor(.white).frame(width: 300, alignment: .center)
                            
                        }.padding(EdgeInsets(top: 26, leading: 0, bottom: 32, trailing: 0))
                        
                        
                        
                        Text("AJUSTES").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
                    }.padding(.horizontal, 16)
                    
                    
                    ModuloAjustes()
                    
                    VStack {
                        Button(action: logOut, label: {
                            HStack(alignment: .center) {
                                Text("Cerrar Sesión")
                                    .fontWeight(.medium)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
//                                    Image(systemName: "figure.walk").frame(width: 20, height: 20, alignment: .center).padding(.trailing,5).padding(.leading,5).foregroundColor(.white)
                                    Image(systemName: "rectangle.portrait.and.arrow.right").frame(width: 20, height: 20, alignment: .center).padding(.trailing,5).padding(.leading,5).foregroundColor(.white)
                                
                                
                            }.padding(EdgeInsets(top: 21, leading: 16, bottom: 21, trailing: 16))
                        }).background(Color("blue-grey"))
                    }.padding(.top, 16)//.padding(.horizontal, 16)
                }
            }
            
            Spacer()
            //            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
            
            
            NavigationLink(isActive: $isLogOutViewActive, destination: {ContentView()}, label: {EmptyView()})
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true).onAppear(perform: {
                
                print("Revisando si tengo datos de usuario en mis UserDefaults")
                recuperarNombreDeUsuario()
                
            })
        
    }
    
    func recuperarNombreDeUsuario(){
        let objetoActualizadorDatos = SaveData()
        
        let datosUsuario:[String] = objetoActualizadorDatos.recuperarDatos()
        
        if !datosUsuario[2].isEmpty {
            nombreUsuario = datosUsuario[2]
        }
        
    }
    
    func logOut() {
        isLogOutViewActive.toggle()
    }
}

struct ModuloAjustes:View {
    @State var isToggleOn = true
    @State var isEditProfileVIewActive = false
    
    var body: some View{
        
        VStack(spacing: 3) {
            Button(action: {}, label: {
                HStack(alignment: .center) {
                    Text("Cuenta")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "chevron.right").frame(width: 20, height: 20, alignment: .center).padding(.trailing,5).padding(.leading,5).foregroundColor(.white)
                }.padding(EdgeInsets(top: 21, leading: 16, bottom: 21, trailing: 16))
            }).background(Color("blue-grey"))
            
            Button(action: {}, label: {
                HStack(alignment: .center) {
                    Text("Notificaciones")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Toggle("", isOn: $isToggleOn)
                }.padding(EdgeInsets(top: 21, leading: 16, bottom: 21, trailing: 16))
            }).background(Color("blue-grey"))
            
            Button(action: {isEditProfileVIewActive.toggle()}, label: {
                HStack(alignment: .center) {
                    Text("Editar perfil")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "chevron.right").frame(width: 20, height: 20, alignment: .center).padding(.trailing,5).padding(.leading,5).foregroundColor(Color("cian"))
                }.padding(EdgeInsets(top: 21, leading: 16, bottom: 21, trailing: 16))
            }).background(Color("blue-grey"))
            
            Button(action: {}, label: {
                HStack(alignment: .center) {
                    Text("Califica esta aplicación")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "chevron.right").frame(width: 20, height: 20, alignment: .center).padding(.trailing,5).padding(.leading,5).foregroundColor(.white)
                }.padding(EdgeInsets(top: 21, leading: 16, bottom: 21, trailing: 16))
            }).background(Color("blue-grey"))
            
            NavigationLink(isActive: $isEditProfileVIewActive, destination: {PantallaPerfilEdit()}, label: {EmptyView()})
            
        }
        
    }
}

struct PantallaPerfil_Previews: PreviewProvider {
    static var previews: some View {
        PantallaPerfil()
    }
}
