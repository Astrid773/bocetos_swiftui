//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/31/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        TabView{
            
            GeneralPublicaciones()
            Text("Hola mundo")
                .tabItem{Label("Es esta pantalla", systemImage: "")}
                .badge(controlador.publicaciones.count)
            
            PantallaPersonajes()
                .tabItem{
                    Label{
                        Text("DragonBall DB")
                        
                    }icon: {
                        Circle()
                            //.fill(person.profileColor)
                            .frame(width: 44, height:44, alignment: .center)
                            .overlay(Text("33 Abarhams"))
                    }
                }
            
            Text("Hola desde pantalla 3")
                .tabItem{ Label("Etiqueta de esta label",
                        systemImage: "circle")}
            /*
            Tab("Etiqueta", systemImage: "Perfil") {
                Text("Referencia a la pantalla")
            }
             */
        }
    }
}

#Preview {
    MenuNavegacion()
            .environment(ControladorAplicacion())
}
