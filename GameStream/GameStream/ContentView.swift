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
            Spacer()
//            Color(red: 21/255, green: 27/255, blue: 53/255, opacity: 1).ignoresSafeArea()
            Color("BackGround").ignoresSafeArea()
            
            VStack{
                Image("appLogo").resizable().aspectRatio( contentMode: .fit).frame(width: 250).padding(.bottom, 20)
                
                InicioYResgistroView()
            }
   
        }
  
        
    }
}

struct InicioYResgistroView: View{
    @State var tipoInicioSesion = true
    var body: some View{
        VStack{
            HStack{
                Spacer()
                
                Button(action: {tipoInicioSesion = true}) {
                    Text("INICIA SESION").fontWeight(.black).foregroundColor(tipoInicioSesion ? .white : .gray)
                }
                
                
                Spacer()
                
                
                Button(action: {tipoInicioSesion = false}) {
                    Text("REGISTRATE").fontWeight(.black).foregroundColor(tipoInicioSesion ? .gray : .white)
                }
                
                
                Spacer()
                
            }
            Spacer(minLength: 42)
            if tipoInicioSesion == true{
                IncioSesionView()
            }else{
                RegistroView()
            }
            
        }
        
    }
    
}

struct IncioSesionView: View{
    var body: some View{
        Text("login vista").foregroundColor(.white)
        
    }
    
}

struct RegistroView: View{
    var body: some View{
        Text("resgitro vista").foregroundColor(.white)
        
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla1").resizable()
        ContentView()
    }
}
