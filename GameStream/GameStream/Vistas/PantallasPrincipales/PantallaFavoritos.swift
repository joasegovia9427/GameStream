//
//  PantallaFavoritos.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI
import AVKit

struct PantallaFavoritos: View {
    @ObservedObject var todosLosVideoJuegos = ViewModel()
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack{
                
                Text("Favoritos").font(.title2).fontWeight(.bold).foregroundColor(Color("cian")).padding(EdgeInsets(top: 16, leading: 0, bottom: 44, trailing: 0)).padding(.bottom, -40)
                
                ScrollView(showsIndicators: false){
                    ForEach(todosLosVideoJuegos.gamesInfo, id: \.self){
                        juego in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!)).frame(height: 200)
                            
                            
                            HStack {
                                Text("\(juego.title)").font(.title3).foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).padding(.top).padding([.leading, .bottom, .trailing])
                                Image(systemName: "heart.fill").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color("amarello")).frame(width: 25, height: 25, alignment: .center).padding(.trailing, 16)
                            }.background(Color("blue-grey"))
                            
                        }.frame(minWidth: 0, maxWidth: .infinity, alignment: .center).padding(.vertical)
                        
                    } //for each
                    
                }.padding(.bottom, 8) //scroll view
            }.padding(.horizontal, 16)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct PantallaFavoritos_Previews: PreviewProvider {
    static var previews: some View {
        PantallaFavoritos()
    }
}
