//
//  PantallaViewJuego.swift
//  GameStream
//
//  Created by Joaquin Segovia on 13/2/22.
//
//
import SwiftUI
import AVKit
import Kingfisher
import UIKit


struct PantallaViewJuego: View {
    var juegoPorParametroIn: GameViewObject?
    
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
    
    var texto:String?=" "
    
    var body: some View {
        ZStack{
            Color("marine").ignoresSafeArea()
            VStack {
                ScrollView {
                    inicio()
                    
                    video(url: url).frame(height: 200).padding(.top,-60)
                    
                    
                    videoInfo(title: juegoPorParametroIn!.title, studio: studio, calification: calification, anoPublicacion: anoPublicacion, description: description, tags: tags).padding(.bottom, 30)
                    
//                    videoInfo(title: title, studio: studio, calification: calification, anoPublicacion: anoPublicacion, description: description, tags: tags).padding(.bottom, 30)
                    videoGallery(imgUrls: imgUrls).padding(.bottom, 30)
                    
                    videoComentarios().padding(.bottom, 30)
                    juegosSimilares().padding(.bottom, 30)
                    
                    //                    Spacer().frame(height:50)
                }.frame(maxWidth: .infinity)
            }
        }
    
    }
    
    func inicio() -> some View{
        print("Datos desde la otra pantalla: \(juegoPorParametroIn?.title)")
        
        return VStack{}
    }

    
}


struct video: View {
    var url : String
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}
//Utilizando el método onDissapear arreglé un bug en el que el video se seguía reproduciendo al salir del VideoPlayer:
//struct GameVideo: View {
//
//    let url: String
//
//    init(url: String) {
//        self.url = url
//    }
//
//    var body: some View {
//        let player = AVPlayer(url: URL(string: url)!)
//        VideoPlayer(player: player)
//            .ignoresSafeArea()
//            .onDisappear(perform: {
//                player.pause()
//            })
//    }
//}

struct videoInfo: View {
    var title: String
    var studio: String
    var calification: String
    var anoPublicacion: String
    var description: String
    var tags: [String]
    
    @State var isFavouriteActive:Bool = true
    
    
    var body: some View {
        VStack(alignment: .leading  ) {
            
            HStack {
                Text("\(title)").fontWeight(.bold).foregroundColor(Color("cian")).font(.largeTitle).padding(.leading)
                Spacer()
                Button(action: {isFavouriteActive.toggle()}, label: {
                    
                    if isFavouriteActive{
                        Image(systemName: "heart.fill").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("amarello")).frame(width: 30, height: 30, alignment: .center)
                    }else{
                        Image(systemName: "heart").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("pure-white")).frame(width: 30, height: 30, alignment: .center)
                    }
                }).padding(.leading)
            }
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

struct videoGallery: View {
    var imgUrls: [String]
    
    let formaGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack (alignment:.leading){
            Text("GALERÍA").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.leading)//.padding(.top).padding(.bottom, -15)
            ScrollView(.horizontal){
                LazyHGrid(rows: formaGrid, spacing: 8){
                    ForEach(imgUrls, id:\.self){
                        imgUrl in
                        KFImage(URL(string: imgUrl)).resizable().aspectRatio(contentMode: .fit).clipShape(RoundedRectangle.init(cornerRadius: 4)).padding(.leading)//.padding(.bottom, -15)
                        
                    }
                }
            }.frame(height: 180)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct videoComentarios: View {
    let screenWidth = UIScreen.main.bounds.width
    var text1 = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five (...)"
    var text2 = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    @State var textToShow = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five (...)"
    var botonVerMasText1 = "ver mas"
    var botonVerMasText2 = "ver menos"
    @State var botonVerMasText = "ver mas"
    
    @State var textCompleteIsActive : Bool = false
    
    @State var isMostrarMiComentarioActive : Bool = true
    
    
    var body: some View {
        VStack (alignment:.leading){
            HStack{
                Text("COMENTARIOS").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.leading)//.padding(.top).padding(.bottom, -15)
                //                Button(action: {isMostrarMiComentarioActive = true}, label: {
                //                    Image(systemName: "plus.bubble").foregroundColor(.white)
                //                })
                Button(action: {isMostrarMiComentarioActive = true}, label: {
                    Image(systemName: "square.and.pencil").foregroundColor(.white)
                }).padding(.trailing)
                
            }
            
            if(isMostrarMiComentarioActive){
                VStack{
                    HStack{
                        Image("40-profile-picture").resizable().aspectRatio( contentMode: .fit).frame(width: 50, height: 50, alignment: .center)
                        VStack{
                            Text("Geoff Atto").fontWeight(.bold).foregroundColor(Color("dark-cian")).font(.subheadline)//.padding(.top, 5).padding(.leading)
                            Spacer().frame(height: 10)
                            Text("Hace 7 días").foregroundColor(.white).font(.subheadline)//.padding(.top, 5)
                        }.padding(.leading, 10)
                        
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "pencil").foregroundColor(.white).padding()
                        })
                        Button(action: {isMostrarMiComentarioActive.toggle()}, label: {
                            Image(systemName: "trash").foregroundColor(.white)
                        })
                        
                        
                    }.frame(maxWidth: .infinity, alignment: .leading).padding().padding(.bottom,-15).padding(.leading,-5)
                    Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white).font(.subheadline).padding().padding(.top,-15).padding(.leading,-5)
                }.background(Color("blue-grey")).cornerRadius(8.0).frame(width: (screenWidth-30), alignment: .center).padding()
            }
            
            VStack{
                HStack{
                    Image("08-swiftuiapps-2105-goto-prueba").resizable().aspectRatio( contentMode: .fit).frame(width: 50, height: 50, alignment: .center)
                    VStack{
                        Text("Alvy Baack").fontWeight(.bold).foregroundColor(.white).font(.subheadline)//.padding(.top, 5).padding(.leading)
                        Spacer().frame(height: 10)
                        Text("Hace 12 días").foregroundColor(.white).font(.subheadline)//.padding(.top, 5)
                    }.padding(.leading, 10)
                    
                }.frame(maxWidth: .infinity, alignment: .leading).padding().padding(.bottom,-15).padding(.leading,-5)
                Text(textToShow).foregroundColor(.white).font(.subheadline).padding().padding(.top,-15).padding(.leading,-5)
                
                ////IF text > n =>
                Button(action:{
                    textCompleteIsActive.toggle()
                    if !textCompleteIsActive{
                        textToShow = text1
                        botonVerMasText = botonVerMasText1
                    }else{
                        textToShow = text2
                        botonVerMasText = botonVerMasText2
                    }
                    
                } , label: {
                    Text(botonVerMasText)
                        .foregroundColor(.white)
                        .frame(maxWidth: 100, alignment: .center)
                        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                }).background(Color("blue-action")).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/).padding().padding(.top, -30)
                
            }.background(Color("blue-grey")).cornerRadius(8.0).frame(width: (screenWidth-30), alignment: .center).padding()
            
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
        Button(action:{} , label: {
            Text("Cargar mas comentarios")
                .foregroundColor(.white)
                .frame(maxWidth: 250, alignment: .center)
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }).background(Color("blue-action")).cornerRadius(8.0
        ).padding(.top, -20)
    }
}

struct juegosSimilares: View {
    @State var isPlayerActive=false
    @State var urlGlobal = ""
    
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View {
        VStack {
            Text("VIDEOS DE JUEGOS SIMILIARES").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.leading)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{

                    Button(action: {
                        urlGlobal = urlVideos[6]
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "13-swiftuiapps-2105-spiderman"
                    }, label: {
                        VStack(alignment: .center){
                            ZStack{
                                Image("13-swiftuiapps-2105-spiderman").resizable().frame(width: 240, height: 135, alignment: .center)
                                Image(systemName: "play.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("pure-white")).frame(width: 50, height: 50, alignment: .center)
                            }
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                    
                
                    Button(action: {
                        urlGlobal = urlVideos[4]
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "13-swiftuiapps-2105-battkefield"
                    }, label: {
                        VStack(alignment: .center){
                            ZStack{
                                Image("13-swiftuiapps-2105-battkefield").resizable().frame(width: 240, height: 135, alignment: .center)
                                Image(systemName: "play.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("pure-white")).frame(width: 50, height: 50, alignment: .center)
                            }
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                    
                    Button(action: {
                        urlGlobal = urlVideos[5]
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "13-swiftuiapps-2105-lastofus"
                    }, label: {
                        VStack(alignment: .center){
                            ZStack{
                                Image("13-swiftuiapps-2105-lastofus").resizable().frame(width: 240, height: 135, alignment: .center)
                                Image(systemName: "play.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("pure-white")).frame(width: 50, height: 50, alignment: .center)
                            }
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })

                }
            }
        }
        
        NavigationLink(isActive: $isPlayerActive, destination: {PantallaReproductor(in_urlGlobal: urlGlobal, in_imagenNameToLoadBG: imagenNameToLoadBG)}, label: {EmptyView()})
    }
        
}

//
//struct PantallaViewJuego_Previews: PreviewProvider {
//
//
//    ////url: "ejemplo",titulo:"Sonic The Hedgehog"
//    ////    ,studio:"Sega"
//    ////    ,calificacion:"E+"
//    ////    ,anoPublicacion:"1991"
//    ////    ,descripcion:"Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente"
//    ////    ,tags:["plataformas","mascota"], imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"]
//    //
//    //
//    //
//    static var previews: some View {
//        PantallaViewJuego(url: "ejemplo.com", title: "Sonic The Hedgehog", studio: "Sega", calification: "E+", anoPublicacion: "1991", description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", tags: ["plataformas","mascota"], imgUrls: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
//
//    }
//
//}

