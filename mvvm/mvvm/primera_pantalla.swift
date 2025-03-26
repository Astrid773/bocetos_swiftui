//
//  primera_pantalla.swift
//  mvvm
//
//  Created by Astrid C. Sanchez L. on 3/14/25.
//

import SwiftUI

@main
struct PrimeraPantalla: App{
    
    @State var controlador_basico = VistaModeloBasico()
    
    var body: some Scene{
        WindowGroup(id: "nombre"){
            ContentView()
                .environment(controlador_basico)
        }
        
    }
}
