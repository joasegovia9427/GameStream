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
                Text("Perfil").font(.title2).fontWeight(.bold).foregroundColor(Color("cian")).padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
                
                VStack{
                    Image("08-swiftuiapps-2105-goto-prueba").resizable().aspectRatio( contentMode: .fill).frame(width: 118, height: 118, alignment: .center).clipShape(Circle())
                    
                    Text("Lanie Janecki").fontWeight(.bold).foregroundColor(.white).frame(width: 300, alignment: .center)
                    
                }.padding(EdgeInsets(top: 26, leading: 0, bottom: 32, trailing: 0))
                
                
                
                Text("AJUSTES").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
                
                ModuloAjustes()
                
            }.padding(.horizontal, 16)
            
            
//            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
            
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                
                print("Revisando si tengo datos de usuario en mis UserDefaults")
                
            })
    }
}

struct ModuloAjustes:View {
    var body: some View{
        Text("hola").foregroundColor(.white)
        
        
        
    }
}

struct PantallaPerfil_Previews: PreviewProvider {
    static var previews: some View {
        PantallaPerfil()
    }
}
