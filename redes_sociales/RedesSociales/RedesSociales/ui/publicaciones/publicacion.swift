//
//  publicacion.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/26/25.
//

import SwiftUI

let backgroundGradient1 = LinearGradient(
    colors: [Color.clear, Color.indigo],
    startPoint: .top, endPoint: .bottom)

let publicacion_falsa = Publicacion(userId:1, id:1, title: "Lorem ipsum", body: "Et dolor sit amet")

struct PublicacionVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    
    var body: some View {
        ZStack{
            backgroundGradient1
            VStack{
                Text("\(controlador.publicacion_seleccionada?.title ?? "Valor por defecto")")
                Text("\(controlador.publicacion_seleccionada?.body ?? "Valor por defecto")")
                
                NavigationLink{
                    PerfilBasicoVista()
                } label: {
                    Text("Ver perfil")
                }.simultaneousGesture(TapGesture().onEnded({
                    controlador.ver_perfil(id: controlador.publicacion_seleccionada!.userId)
                }))
                
                ScrollView{
                    VStack{
                        ForEach(controlador.comentarios){ comentario in
                            Text("Usuario: \(comentario.name)")
                            Text("\(comentario.body)")
                        }
                    }
                }
            }
        }
    }
}

    #Preview {
        NavigationStack{
            PublicacionVista()
                .environment(ControladorAplicacion())
        }
    }
