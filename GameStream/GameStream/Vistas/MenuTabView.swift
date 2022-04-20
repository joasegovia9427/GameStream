//
//  MenuTabView.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI
import UIKit

struct MenuTabView: View {
    @State var tabSeleccionado:Int=2
    var body: some View {
        TabView(selection: $tabSeleccionado){
            PantallaPerfil().tabItem{
                Image(systemName: "person")
                Text("Perfil")
            }.tag(0)
            PantallaJuegos().tabItem{
                Image(systemName: "gamecontroller")
                Text("Juegos")
            }.tag(1)
            PantallaInicio().tabItem{
                Image(systemName: "house")
                Text("Inicio")
            }.tag(2)
            //            Text("Inicio").font(.system(size: 30, weight: .bold, design: .rounded))
            //                .tabItem{
            //                    Image(systemName: "house")
            //                    Text("Inicio")
            //                }.tag(2)
            PantallaFavoritos().tabItem{
                Image(systemName: "heart")
                Text("Favoritos")
            }.tag(3)
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).accentColor(Color("pure-white"))
    }
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("tabBar-Color"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("tabBar-InactiveColor"))
        UITabBar.appearance().isTranslucent = true
    }
}

struct MenuTabView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTabView()
    }
}
