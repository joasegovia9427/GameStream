//
//  PantallaViewJuego.swift
//  GameStream
//
//  Created by Joaquin Segovia on 13/2/22.
//

import SwiftUI
import AVKit

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
        ZStack{
            Color("marine").ignoresSafeArea()
            VStack {
                ScrollView {
                    video(url: url).frame(height: 300)//.padding(.top,-100)
                    videoInfo(title: title, studio: studio, calification: calification, anoPublicacion: anoPublicacion, description: description, tags: tags).padding(.bottom)
                }.frame(maxWidth: .infinity)
                
                
                
            }
            
            
        }
        
        
        
        
    }
}


struct video: View {
    var url : String
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}

struct videoInfo: View {
    var title: String
    var studio: String
    var calification: String
    var anoPublicacion: String
    var description: String
    var tags: [String]
    
    var body: some View {
        VStack(alignment: .leading  ) {
            
            Text("\(title)").fontWeight(.bold).foregroundColor(Color("cian")).font(.largeTitle).padding(.leading)
            HStack{
                Text("\(studio)").fontWeight(.bold).foregroundColor(.white).font(.subheadline).padding(.top, 5).padding(.leading)
                Text("\(calification)").foregroundColor(.white).font(.subheadline).padding(.top, 5)
                Text("\(anoPublicacion)").foregroundColor(.white).font(.subheadline).padding(.top, 5)
            }
            
            Text("\(description)").foregroundColor(.white).font(.subheadline).padding(.top, 5).padding(.leading)
            
            HStack{
                ForEach(tags, id:\.self){
                    tag in
                    Text("#\(tag)").foregroundColor(.white).font(.subheadline).padding(.top, 4).padding(.leading)
                    
                }
            }
            
            
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.trailing)
    }
}

//struct NombreDeVista: View {
//    var body: some View {
//        Text(" ")
//    }
//}


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
        PantallaViewJuego(url: "ejemplo.com", title: "Sonic The Hedgehog", studio: "Sega", calification: "E+", anoPublicacion: "1991", description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", tags: ["plataformas","mascota"], imgUrls: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
        
    }
    
}
