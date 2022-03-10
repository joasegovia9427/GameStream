//
//  PantallaPerfil.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI

struct PantallaPerfil: View {
    @State var nombreUsuario = "Lorem"
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack {
                ScrollView{
                    VStack{
                        Text("Perfil").font(.title2).fontWeight(.bold).foregroundColor(Color("cian")).padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                        
                        VStack{
                            Image("08-swiftuiapps-2105-goto-prueba").resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118, alignment: .center).clipShape(Circle())
                            
                            Text("Lanie Janecki").fontWeight(.bold).foregroundColor(.white).frame(width: 300, alignment: .center)
                            
                        }.padding(EdgeInsets(top: 26, leading: 0, bottom: 32, trailing: 0))
                        
                        
                        
                        Text("AJUSTES").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
                    }.padding(.horizontal, 16)
                    
                    
                    ModuloAjustes()
                }
            }
            
            
            //            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
            
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true).onAppear(perform: {
                
                print("Revisando si tengo datos de usuario en mis UserDefaults")
                
            })
        
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
