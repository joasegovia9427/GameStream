//
//  ContentView.swift
//  GameStream
//
//  Created by Joaquin Segovia on 10/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
//            Color(red: 21/255, green: 27/255, blue: 53/255, opacity: 1).ignoresSafeArea()
            Color("BackGround").ignoresSafeArea()
            
            VStack{
                Image("appLogo").resizable().aspectRatio( contentMode: .fit).frame(width: 250)
                
                InicioYResgistroView()
            }
   
        }
  
        
    }
}

struct InicioYResgistroView: View{
    
    var body: some View{
        VStack{
            HStack{
                Text("INICIA SESION").fontWeight(.bold).foregroundColor(.white)
                Text("REGISTRATE").fontWeight(.bold).foregroundColor(.white)
            }
            
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla1").resizable()
        ContentView()
    }
}
