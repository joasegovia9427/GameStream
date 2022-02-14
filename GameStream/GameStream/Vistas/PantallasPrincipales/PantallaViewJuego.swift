//
//  PantallaViewJuego.swift
//  GameStream
//
//  Created by Joaquin Segovia on 13/2/22.
//

import SwiftUI

struct PantallaViewJuego: View {
//    var gameVOFromPantallaJuegos : GameViewObject?
//    var gameFrom : GameViewObject?
    var url: String

    var title: String
    var studio: String
    var calification: String
    var anoPublicacion: String
    var description: String
    var tags: [String]
    var imgUrls: [String]
    
    
    var body: some View {
//        Text("Pantalla de juego: \(gameFrom!.title)")
        Text("Pantalla de juego: \(title)")
    }
}

struct PantallaViewJuego_Previews: PreviewProvider {

    
////url: "ejemplo",titulo:"Sonic The Hedgehog"
////    ,studio:"Sega"
////    ,calificacion:"E+"
////    ,anoPublicacion:"1991"
////    ,descripcion:"Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente"
////    ,tags:["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"]
//
//
//
    static var previews: some View {
        PantallaViewJuego(url: "ejemplo", title: "Sonic The Hedgehog", studio: "Sega", calification: "E+", anoPublicacion: "1991", description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", tags: ["plataformas","mascota"], imgUrls: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])

    }

}
