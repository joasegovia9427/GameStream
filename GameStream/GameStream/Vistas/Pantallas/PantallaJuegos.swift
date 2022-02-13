//
//  PantallaJuegos.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI
import Kingfisher

struct PantallaJuegos: View {
    @State var gameVO: GameViewObject? = nil
    
    
    @ObservedObject var todosLosVideoJuegos = ViewModel()
    
    @State var gameViewIsActive: Bool = false
    
    //    @State var url: String = ""
    //    @State var title: String = ""
    //    @State var studio: String = ""
    //    @State var calification: String = ""
    //    @State var anoPublicacion: String = ""
    //    @State var description: String = ""
    //    @State var tags: [String] = [""]
    //    @State var imgUrls: [String] = [""]
    
    let formaGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack{
                Text("Juegos").font(.title2).fontWeight(.bold).foregroundColor(Color("cian")).padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                ScrollView{
                    LazyVGrid(columns: formaGrid, spacing: 8){
                        ForEach(todosLosVideoJuegos.gamesInfo, id: \.self){
                            juego in
                            
                            //                            Button(action: {
                            //                                url = juego.videosUrls.mobile
                            //                                title = juego.title
                            //                                studio = juego.studio
                            //                                calification = juego.contentRaiting
                            //                                anoPublicacion = juego.publicationYear
                            //                                description = juego.description
                            //                                tags = juego.tags
                            //                                imgUrls = juego.galleryImages
                            //
                            //                                print("Pulse el juego \(title)")
                            //
                            //                            }, label: {
                            //                                Text("\(juego.title)").font(.title2).fontWeight(.bold).foregroundColor(.white).padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                            //
                            //                            })
                            
                            Button(action: {
                                gameVO = GameViewObject(game: juego)
                                print("Pulse el juego \(gameVO!.title)")
                            }, label: {
                                
                                VStack {
                                    KFImage(URL(string: juego.galleryImages[0])!).resizable().aspectRatio(contentMode: .fit).clipShape(RoundedRectangle.init(cornerRadius: 4)).padding(.bottom, -15)
                                    
//                                    Text("\(juego.title)")
                                    Text(cortarString(24, textoIn:juego.title)).font(.footnote).foregroundColor(.white).padding(EdgeInsets(top: 16, leading: 0, bottom: 30, trailing: 0))
                                    
                                }
                                
                            })
                            
                        }
                    }.padding(.horizontal, 10.0)
                }
            }.padding(.horizontal, 6)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: {
                print("Primer elemento del json: \(todosLosVideoJuegos.gamesInfo[0])")
                print("Titulo del primer videojuego del json: \(todosLosVideoJuegos.gamesInfo[0].title)")
                
            })
        
    }
}

func cortarString(_ cantidad: Int, textoIn:String) -> String {
    var stringToReturn:String = ""
    let mySubstring = textoIn.prefix(cantidad)

    stringToReturn = String(mySubstring)
    
    if textoIn.count > cantidad {
        stringToReturn = stringToReturn + "..."
    }

//    print("Texto entero \(textoIn)")
//    print("Texto cortado \(mySubstring)")
//    print("Texto a retornar \(stringToReturn)")
    return String(stringToReturn)
}

struct GameViewObject {
    let url: String
    let title: String
    let studio: String
    let calification: String
    let pubYear: String
    let description: String
    let tags: [String]
    let imgUrls: [String]
    
    init(game: Game) {
        url = game.videosUrls.mobile
        title = game.title
        studio = game.studio
        calification = game.contentRaiting
        pubYear = game.publicationYear
        description = game.description
        tags = game.tags
        imgUrls = game.galleryImages
    }
}


struct PantallaJuegos_Previews: PreviewProvider {
    static var previews: some View {
        PantallaJuegos()
    }
}
