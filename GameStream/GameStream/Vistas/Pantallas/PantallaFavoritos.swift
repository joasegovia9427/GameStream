//
//  PantallaFavoritos.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI

struct PantallaFavoritos: View {
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            Text("Favoritos").font(.system(size: 30, weight: .bold, design: .rounded))
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct PantallaFavoritos_Previews: PreviewProvider {
    static var previews: some View {
        PantallaFavoritos()
    }
}
