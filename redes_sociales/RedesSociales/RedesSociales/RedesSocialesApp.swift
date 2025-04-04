//
//  RedesSocialesApp.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/24/25.
//

import SwiftUI

@main
struct RedesSocialesApp: App {
    @State var controlador = ControladorAplicacion()
    
    var body: some Scene {
        WindowGroup {
            MenuNavegacion()
                .environment(controlador)
        }
    }
}
