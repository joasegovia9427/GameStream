//
//  PantallaInicio.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI
import AVKit

var imagenNameToLoadBG:String=""
//var urlGlobal:String=""
//var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
//    0 the witcher
//    1 subnautica
//    2 crash
//    3 death stranding
//    4 cuphead
//    5 hades de anime
//    6 gta online

struct PantallaInicio: View {
    @State var isAuxNiveladorActive:Bool = false
    
    var body: some View {
        
        ZStack {
            Color("marine").ignoresSafeArea()
            VStack{
                //                Spacer().frame(height: 10)
                Image("appLogo").resizable().aspectRatio( contentMode: .fit).frame(width: 250).padding(.bottom, 20)
                //                Spacer()
                ScrollView(showsIndicators: false){
                    SubModuloHome()
                    //
                }//.clipped()
                
                //                Spacer()
            }.padding(.horizontal, 18)//.padding(.top, -85)
            
            NavigationLink(isActive: $isAuxNiveladorActive, destination: {AuxNivelador()}, label: {EmptyView()})
        }.onAppear {
            let objetoActualizadorDatos = SaveData()
            objetoActualizadorDatos.crearClaveVaciaIfNil()
        }
    }
}

struct SubModuloHome: View {
    @State var isPlayerActive = false
    @State var textoBusqueda = ""
    @State var isGameInfoEmpty = false
    @State var urlGlobal = ""
    
    @ObservedObject var juegoEncontrado = SearchGame()
    @State var isGameViewActive = false
    
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var calification: String = ""
    @State var anoPublicacion: String = ""
    @State var description: String = ""
    @State var tags: [String] = [""]
    @State var imgUrls: [String] = [""]
    
    @State var medidaCategoriaBoxWidth:CGFloat=160
    @State var medidaCategoriaBoxHeight:CGFloat=120
    @State var medidaCategoriaCornerRadious:CGFloat=8
    @State var medidaCategoriaImageWidth:CGFloat=30
    @State var medidaCategoriaImageHeight:CGFloat=30
    @State var medidaCategoriaFontSizeType:Font=Font.body
    
    var body: some View {
        
        HStack{
            ZStack(alignment: .leading){
                if(textoBusqueda.isEmpty){
                    Text("Buscar un video juego").font(.caption).foregroundColor(Color("light-grey")).font(.caption)
                }
                TextField("", text: $textoBusqueda).foregroundColor(Color("pure-white"))
            }
            
            if(textoBusqueda.isEmpty){
                Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color("blue-action") : Color("cian"))
            }else{
                Button(action: {watchGame(name: textoBusqueda)}, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color("blue-action") : Color("cian"))
                }).alert(isPresented: $isGameInfoEmpty){
                    Alert(title: Text("Error"), message: Text("No se encontro el juego '\(textoBusqueda)'"), dismissButton: .default(Text("Entendido")))
                }
            }
            
            if(textoBusqueda.isEmpty){
                Image(systemName: "xmark").foregroundColor(textoBusqueda.isEmpty ? Color("blue-action") : Color("cian"))
            }else{
                Button(action: {textoBusqueda=""}, label: {
                    Image(systemName: "xmark").foregroundColor(textoBusqueda.isEmpty ? Color("blue-action") : Color("cian"))
                })
            }
            
        }.padding(.all, 11.0).background(Color("blue-grey")).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
        // .clipShape(Capsule())
        
        ////- 1) LOS M??S POPULARES
        VStack {
            Text("LOS M??S POPULARES").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top).padding(.bottom, -15)
            ZStack{
                Button(action: {
                    url = urlVideos[0]
                    urlGlobal = url
                    print("URL: \(url)")
                    isPlayerActive.toggle()
                    //                    watchGame(name: "The Witcher 3: Wild Hunt")
                    imagenNameToLoadBG = "13-swiftuiapps-2105-thewitcher"
                }, label: {
                    VStack(spacing:0){
                        ZStack{
                            Image(String("13-swiftuiapps-2105-thewitcher")).resizable().scaledToFill()
                            Image(systemName: "play.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("cian")).frame(width: 50, height: 50, alignment: .center)
                        }
                        Text("The witcher 3: Wild Hunt").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top).padding([.leading, .bottom, .trailing])
                    }.background(Color("blue-grey"))
                })
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
        }
        ////-
        
        ////- 2) CATEGOR??AS SUGERIDAS PARA TI
        VStack {
            Text("CATEGOR??AS SUGERIDAS PARA TI").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Button(action: {}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius:medidaCategoriaCornerRadious).fill(Color("blue-grey")).frame(width: medidaCategoriaBoxWidth, height: medidaCategoriaBoxHeight, alignment: .center
                            )
                            VStack(alignment: .center){
                                Image("Vector-shot").resizable().frame(width: medidaCategoriaImageWidth, height: medidaCategoriaImageHeight, alignment: .center).padding(.top, 10)
                                Text("FPS")
                                    .font(medidaCategoriaFontSizeType)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("cian"))
                                    .frame(maxWidth: .infinity, alignment: .center).padding(.bottom,10)
                            }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                        }
                    })
                    
                    Button(action: {}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius:medidaCategoriaCornerRadious).fill(Color("blue-grey")).frame(width: medidaCategoriaBoxWidth, height: medidaCategoriaBoxHeight, alignment: .center
                            )
                            VStack(alignment: .center){
                                Image("rpg-icon").resizable().frame(width: medidaCategoriaImageWidth, height: medidaCategoriaImageHeight, alignment: .center).padding(.top, 10)
                                Text("RPG")
                                    .font(medidaCategoriaFontSizeType)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("cian"))
                                    .frame(maxWidth: .infinity, alignment: .center).padding(.bottom,10)
                            }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                        }
                    })
                    
                    Button(action: {}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius:medidaCategoriaCornerRadious).fill(Color("blue-grey")).frame(width: medidaCategoriaBoxWidth, height: medidaCategoriaBoxHeight, alignment: .center
                            )
                            
                            VStack(alignment: .center){
                                Image("open-world-icon").resizable().frame(width: medidaCategoriaImageWidth, height: medidaCategoriaImageHeight, alignment: .center).padding(.top, 10)
                                Text("OPEN WORLD")
                                    .font(medidaCategoriaFontSizeType)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("cian"))
                                    .frame(maxWidth: .infinity, alignment: .center).padding(.bottom,10)
                            }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                        }
                    })
                    
                }.onAppear(perform: {
                    if(dispositivo=="iPad"){
                        medidaCategoriaBoxWidth=300
                        medidaCategoriaBoxHeight=220
                        medidaCategoriaCornerRadious=18
                        medidaCategoriaImageWidth=70
                        medidaCategoriaImageHeight=70
                        medidaCategoriaFontSizeType=Font.title
                    }else{//iPhone
                        medidaCategoriaBoxWidth=160
                        medidaCategoriaBoxHeight=120
                        medidaCategoriaCornerRadious=8
                        medidaCategoriaImageWidth=30
                        medidaCategoriaImageHeight=30
                        medidaCategoriaFontSizeType=Font.body
                    }
                })
            }
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
        ////-
        
        ////- 3) RECOMENDADO PARA TI
        VStack {
            Text("RECOMENDADO PARA TI").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    Button(action: {
                        //                        url = urlVideos[1]
                        urlGlobal = url
                        print("URL: \(url)")
                        //                        isPlayerActive.toggle()
                        watchGame(name: "Abzu")
                        imagenNameToLoadBG = "Abzu"
                    }, label: {
                        VStack(alignment: .center){
                            ZStack{
                                Image("Abzu").resizable().frame(width: 240, height: 135, alignment: .center)
                                Image(systemName: "magnifyingglass").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("pure-white")).frame(width: 50, height: 50, alignment: .center)
                            }
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                    
                    Button(action: {
                        //                        url = urlVideos[2]
                        urlGlobal = url
                        print("URL: \(url)")
                        //                        isPlayerActive.toggle()
                        watchGame(name: "Crash Bandicoot")
                        imagenNameToLoadBG = "Crash Bandicoot"
                    }, label: {
                        VStack(alignment: .center){
                            ZStack{
                                Image("Crash Bandicoot").resizable().frame(width: 240, height: 135, alignment: .center)
                                Image(systemName: "magnifyingglass").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("pure-white")).frame(width: 50, height: 50, alignment: .center)
                            }
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                    
                    Button(action: {
                        //                        url = urlVideos[3]
                        urlGlobal = url
                        print("URL: \(url)")
                        //                        isPlayerActive.toggle()
                        watchGame(name: "DEATH STRANDING")
                        imagenNameToLoadBG = "DEATH STRANDING"
                    }, label: {
                        VStack(alignment: .center){
                            ZStack{
                                Image("DEATH STRANDING").resizable().frame(width: 240, height: 135, alignment: .center)
                                Image(systemName: "magnifyingglass").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("pure-white")).frame(width: 50, height: 50, alignment: .center)
                            }
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
        ////-
        
        ////- 4) VIDEOS QUE PODR??AN GUSTARTE
        VStack {
            Text("VIDEOS QUE PODR??AN GUSTARTE").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    Button(action: {
                        urlGlobal = urlVideos[4]
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "13-swiftuiapps-2105-battkefield"
                        
                        //                        url = urlVideos[4]
                        //                        urlGlobal = url
                        //                        print("URL: \(url)")
                        //                        isPlayerActive.toggle()
                        ////                        watchGame(name: "DEATH STRANDING")
                        //                        imagenNameToLoadBG = "13-swiftuiapps-2105-battkefield"
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
                        
                        //                        url = urlVideos[5]
                        //                        urlGlobal = url
                        //                        print("URL: \(url)")
                        //                        isPlayerActive.toggle()
                        ////                        watchGame(name: "Cuphead")
                        //                        imagenNameToLoadBG = "13-swiftuiapps-2105-lastofus"
                    }, label: {
                        VStack(alignment: .center){
                            ZStack{
                                Image("13-swiftuiapps-2105-lastofus").resizable().frame(width: 240, height: 135, alignment: .center)
                                Image(systemName: "play.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("pure-white")).frame(width: 50, height: 50, alignment: .center)
                            }
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                    
                    Button(action: {
                        urlGlobal = urlVideos[6]
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "13-swiftuiapps-2105-spiderman"
                        
                        //                        url = urlVideos[6]
                        //                        urlGlobal = url
                        //                        print("urlGlobal: \(urlGlobal)")
                        //                        isPlayerActive.toggle()
                        ////                        watchGame(name: "Halo: The Master Chief Collection")
                        //                        imagenNameToLoadBG = "13-swiftuiapps-2105-spiderman"
                        
                    }, label: {
                        VStack(alignment: .center){
                            ZStack{
                                Image("13-swiftuiapps-2105-spiderman").resizable().frame(width: 240, height: 135, alignment: .center)
                                Image(systemName: "play.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("pure-white")).frame(width: 50, height: 50, alignment: .center)
                            }
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
        ////-
        
        NavigationLink(isActive: $isGameViewActive, destination: {
            PantallaViewJuego(url: url, title: title, studio: studio, calification: calification, anoPublicacion: anoPublicacion, description: description, tags: tags, imgUrls: imgUrls)}, label: {EmptyView()})
        
        NavigationLink(isActive: $isPlayerActive, destination: {PantallaReproductor(in_urlGlobal: urlGlobal, in_imagenNameToLoadBG: imagenNameToLoadBG)}, label: {EmptyView()})
        
        
        //        NavigationLink(isActive: $isPlayerActive, destination: {reproductor()}, label: {EmptyView()})
        
        //        NavigationLink(isActive: $isPlayerActive, destination: {PantallaReproductor(in_urlGlobal: urlGlobal, in_imagenNameToLoadBG: imagenNameToLoadBG)}, label: {EmptyView()})
        
    }
    
    func busqueda() {
        print("buscando")
    }
    
    func watchGame(name: String) {
        //        print("Buscar Juego")
        //        isGameInfoEmpty.toggle()
        
        let nameToSearchTrim = name.trimmingCharacters(in: .whitespaces)
        
        juegoEncontrado.search(gameName: nameToSearchTrim)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3){
            print("Cantidad de elementos encontrados \(juegoEncontrado.gameInfo.count)")
            if juegoEncontrado.gameInfo.count == 0{
                isGameInfoEmpty.toggle()
            }else{
                url = juegoEncontrado.gameInfo[0].videosUrls.mobile
                title = juegoEncontrado.gameInfo[0].title
                studio = juegoEncontrado.gameInfo[0].studio
                calification = juegoEncontrado.gameInfo[0].contentRaiting
                anoPublicacion = juegoEncontrado.gameInfo[0].publicationYear
                description = juegoEncontrado.gameInfo[0].description
                tags = juegoEncontrado.gameInfo[0].tags
                imgUrls = juegoEncontrado.gameInfo[0].galleryImages
                
                print("description recuperado:: \(description)")
                
                if description.isEmpty {
                    isGameInfoEmpty.toggle()
                }else{
                    isGameViewActive = true                    
                }
            }
        }
        
    }
}
//
////esto lo pase a una vista aparte ya que se usa desde otra vista
//struct reproductor:View{
//    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
//    let screenSize: CGRect = UIScreen.main.bounds
//    let screenWidth = UIScreen.main.bounds.width
//    let screenHeight = UIScreen.main.bounds.height
//
//    var body: some View{
//        ZStack {
//            Image(imagenNameToLoadBG).resizable().scaledToFill().blur(radius: /*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/).frame(maxWidth: 400, minHeight: screenHeight+20, alignment: .center).padding(.top, -10)
//            VideoPlayer(player: AVPlayer(url: URL(string: urlGlobal)!))
//                .frame(width: (screenWidth-15), height: 320, alignment: .center).padding(.all, 2.0)
//            VStack {
//                Spacer().frame(height: 500)
//                Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {
//                    Text(String("Volver").uppercased())
//                        .fontWeight(.bold)
//                        .foregroundColor(.white)
//                        .frame(maxWidth: 100, alignment: .center)
//                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
//                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("dark-cian"), lineWidth: 2).shadow(color: .white, radius: 6))
//                }).padding(.bottom, 100)
//            }
//        }.ignoresSafeArea()
//    }
//}

//struct SubModuloLosMasPopulares: View {
//    var body: some View {
//        Text(" ")
//    }
//}
//struct SubModulocategoriasSugeridas: View {
//    var body: some View {
//        Text(" ")
//    }
//}
//struct SubModuloRecomendado: View {
//    var body: some View {
//        VStack {
//
//    }
//}
//struct SubModuloVideosPodrianGustarte: View {
//    var body: some View {
//        Text(" ")
//    }
//}


struct PantallaInicio_Previews: PreviewProvider {
    static var previews: some View {
        PantallaInicio()
    }
}
