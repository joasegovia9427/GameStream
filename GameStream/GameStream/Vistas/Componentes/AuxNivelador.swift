//
//  AuxNivelador.swift
//  GameStream
//
//  Created by Joaquin Segovia on 12/2/22.
//

import SwiftUI

struct AuxNivelador: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        //        EmptyView()
        Text("Hola")
    }
    
    init(){
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AuxNivelador_Previews: PreviewProvider {
    static var previews: some View {
        AuxNivelador()
    }
}
