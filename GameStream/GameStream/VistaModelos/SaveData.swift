//
//  SaveData.swift
//  GameStream
//
//  Created by Joaquin Segovia on 10/3/22.
//

import Foundation
import SwiftUI

class SaveData{
    var correo: String = ""
    var contrasenia: String = ""
    var nombre: String = ""
    var isFotoFromCamera: String = ""
    
    let llaveParaGuardarYRecuperarDatos = "datosUsuario"
    
    func crearClaveVacia() {
        print("crearClaveVacia")
        if UserDefaults.standard.object(forKey: llaveParaGuardarYRecuperarDatos) == nil {
            UserDefaults.standard.set(["", "", "", "false"], forKey: llaveParaGuardarYRecuperarDatos)
        }
    }
    
    func guardarDatos(correo: String, contrasenia: String, nombre: String, isFotoFromCamera: String) -> Bool {
        print("Dentro de la funcion guardar, datos a guardar desde Vista: \(correo) +  \(contrasenia)  + \(nombre) + \(isFotoFromCamera) ")
        
        UserDefaults.standard.set([correo, contrasenia, nombre, isFotoFromCamera], forKey: llaveParaGuardarYRecuperarDatos)
        return true
    }
    
    func recuperarDatos() -> [String] {
        crearClaveVacia()
        let datosUsuario:[String] = UserDefaults.standard.stringArray(forKey: llaveParaGuardarYRecuperarDatos)!
        print("Estoy en el metodo recuperar datos y obtuve: \(datosUsuario) ")
        return datosUsuario
    }
    
    func validar(correo: String, contrasenia: String) -> Bool {
        var correoGuardado = ""
        var contraseniaGuardada = ""
        
        print("Revisando si tengo datos en user defaults con el correo \(correo) y contrasenia: \(contrasenia) ")
        
        if UserDefaults.standard.object(forKey: llaveParaGuardarYRecuperarDatos) != nil {
            correoGuardado = UserDefaults.standard.stringArray(forKey: llaveParaGuardarYRecuperarDatos)![0]
            contraseniaGuardada = UserDefaults.standard.stringArray(forKey: llaveParaGuardarYRecuperarDatos)![1]
            
            print("Datos recuperados, correo: \(correoGuardado) y contrasenia: \(contraseniaGuardada) ")
            
            if correo == correoGuardado && contrasenia == contraseniaGuardada {
                return true
            } else {
                return false
            }
            
        }else{
            print("No hay datos de usuario guardados en el user default para el correo \(correo) y contrasenia: \(contrasenia) ")
            return true
        }
    }
}
