//
//  PantallaInicio.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI
import AVKit

var imagenNameToLoadBG:String=""
var urlGlobal:String=""
var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
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
    @State var textoBusqueda = ""
    
    var body: some View {
        
        ZStack {
            
            
            Color("marine").ignoresSafeArea()
            VStack{
                
                //                Spacer().frame(height: 10)
                Image("appLogo").resizable().aspectRatio( contentMode: .fit).frame(width: 250).padding(.bottom, 20)
                
                HStack{
                    
                    
                    ZStack(alignment: .leading){
                        if(textoBusqueda.isEmpty){
                            Text("Buscar un video").font(.caption).foregroundColor(Color("light-grey")).font(.caption)
                        }
                        TextField("", text: $textoBusqueda).foregroundColor(Color("pure-white"))
                    }
                    
                    if(textoBusqueda.isEmpty){
                        Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color("blue-action") : Color("cian"))
                    }else{
                        Button(action: {busqueda()}, label: {
                            Image(systemName: "magnifyingglass").foregroundColor(textoBusqueda.isEmpty ? Color("blue-action") : Color("cian"))
                        })
                    }
                    
                    
                }.padding(.all, 11.0).background(Color("blue-grey")).cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
                // .clipShape(Capsule())
                
                
                
                //                Spacer()
                
                ScrollView(showsIndicators: false){
                    SubModuloHome()
                    //
                }//.clipped()
                
                //                Spacer()
                
            }.padding(.horizontal, 18)//.padding(.top, -85)
            
            NavigationLink(isActive: $isAuxNiveladorActive, destination: {AuxNivelador()}, label: {EmptyView()})
        }
        
    }
    
    func busqueda() {
        print("buscando")
    }
}

struct SubModuloHome: View {
    @State var isPlayerActive = false
    
    
    var body: some View {
        ////- 1) LOS MÁS POPULARES
        VStack {
            Text("LOS MÁS POPULARES").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top).padding(.bottom, -15)
            ZStack{
                Button(action: {
                    url = urlVideos[0]
                    urlGlobal = url
                    print("URL: \(url)")
                    isPlayerActive.toggle()
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
        
        ////- 2) CATEGORÍAS SUGERIDAS PARA TI
        VStack {
            Text("CATEGORÍAS SUGERIDAS PARA TI").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    Button(action: {}, label: {
                        VStack(alignment: .center){
                            Image("Vector-shot").resizable().frame(width: 30, height: 30, alignment: .center).padding(.top, 10)
                            Text("FPS")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("cian"))
                                .frame(maxWidth: .infinity, alignment: .center).padding(.bottom,10)
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    }).background(Color("blue-grey")).cornerRadius(8.0).frame(width: 160, height: 120, alignment: .center
                    )
                    
                    Button(action: {}, label: {
                        VStack(alignment: .center){
                            Image("rpg-icon").resizable().frame(width: 30, height: 30, alignment: .center).padding(.top, 10)
                            Text("RPG")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("cian"))
                                .frame(maxWidth: .infinity, alignment: .center).padding(.bottom,10)
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    }).background(Color("blue-grey")).cornerRadius(8.0).frame(width: 160, height: 120, alignment: .center
                    )
                    
                    Button(action: {}, label: {
                        VStack(alignment: .center){
                            Image("open-world-icon").resizable().frame(width: 30, height: 30, alignment: .center).padding(.top, 10)
                            Text("OPEN WORLD")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("cian"))
                                .frame(maxWidth: .infinity, alignment: .center).padding(.bottom,10)
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    }).background(Color("blue-grey")).cornerRadius(8.0).frame(width: 160, height: 120, alignment: .center
                    )
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
        ////-
        
        ////- 3) RECOMENDADO PARA TI
        VStack {
            Text("RECOMENDADO PARA TI").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    Button(action: {
                        url = urlVideos[1]
                        urlGlobal = url
                        print("URL: \(url)")
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "Abzu"
                    }, label: {
                        VStack(alignment: .center){
                            Image("Abzu").resizable().frame(width: 240, height: 135, alignment: .center)
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                    
                    Button(action: {
                        url = urlVideos[2]
                        urlGlobal = url
                        print("URL: \(url)")
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "Crash Bandicoot"
                    }, label: {
                        VStack(alignment: .center){
                            Image("Crash Bandicoot").resizable().frame(width: 240, height: 135, alignment: .center)
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                    
                    Button(action: {
                        url = urlVideos[3]
                        urlGlobal = url
                        print("URL: \(url)")
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "DEATH STRANDING"
                    }, label: {
                        VStack(alignment: .center){
                            Image("DEATH STRANDING").resizable().frame(width: 240, height: 135, alignment: .center)
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
        ////-
        
        ////- 4) VIDEOS QUE PODRÍAN GUSTARTE
        VStack {
            Text("VIDEOS QUE PODRÍAN GUSTARTE").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    
                    Button(action: {
                        url = urlVideos[4]
                        urlGlobal = url
                        print("URL: \(url)")
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "13-swiftuiapps-2105-battkefield"
                    }, label: {
                        VStack(alignment: .center){
                            Image("13-swiftuiapps-2105-battkefield").resizable().frame(width: 240, height: 135, alignment: .center)
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                    
                    Button(action: {
                        url = urlVideos[5]
                        urlGlobal = url
                        print("URL: \(url)")
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "13-swiftuiapps-2105-lastofus"
                    }, label: {
                        VStack(alignment: .center){
                            Image("13-swiftuiapps-2105-lastofus").resizable().frame(width: 240, height: 135, alignment: .center)
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                    
                    Button(action: {
                        url = urlVideos[6]
                        urlGlobal = url
                        print("URL: \(url)")
                        isPlayerActive.toggle()
                        imagenNameToLoadBG = "13-swiftuiapps-2105-spiderman"
                    }, label: {
                        VStack(alignment: .center){
                            Image("13-swiftuiapps-2105-spiderman").resizable().frame(width: 240, height: 135, alignment: .center)
                        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
                    })
                }
            }
        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
        ////-
        
        NavigationLink(isActive: $isPlayerActive, destination: {reproductor()}, label: {EmptyView()})
    }
}

struct reproductor:View{
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let screenSize: CGRect = UIScreen.main.bounds
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View{
        ZStack {
            Image(imagenNameToLoadBG).resizable().scaledToFill().blur(radius: /*@START_MENU_TOKEN@*/6.0/*@END_MENU_TOKEN@*/).frame(maxWidth: 400, minHeight: screenHeight+10, alignment: .center)
            VideoPlayer(player: AVPlayer(url: URL(string: urlGlobal)!))
                .frame(width: (screenWidth-15), height: 320, alignment: .center).padding(.all, 2.0)
            VStack {
                Spacer().frame(height: 500)
                Button(action: {self.presentationMode.wrappedValue.dismiss()}, label: {
                    Text(String("Volver").uppercased())
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: 100, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("dark-cian"), lineWidth: 2).shadow(color: .white, radius: 6))
                }).padding(.bottom, 100)
            }
        }.ignoresSafeArea()
    }
}





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
