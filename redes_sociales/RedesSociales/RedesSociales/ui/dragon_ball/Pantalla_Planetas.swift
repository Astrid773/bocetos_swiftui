//
//  Pantalla_Planetas.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 4/28/25.
//

import SwiftUI

struct PantallaPlanetas: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        ZStack{
            backgroundGradient1
            /*VStack{
             Text("\(controlador.personajes.description)")
             NavigationLink{
             PantallaPersonajes()
             } label: {
             Text("Ver personaje")
             }.simultaneousGesture(TapGesture().onEnded({
             
             }))*/
                if(controlador.pagina_resultados_planetas != nil) {
                    ScrollView{
                        VStack{
                            ForEach(controlador.pagina_resultados_planetas!.items) { planeta in
                                NavigationLink{
                                    PersonajeFoto()
                                } label: {
                                    Text("El planeta es \(planeta.name)")
                                    VStack{
                                        AsyncImage(url: URL(string: planeta.image)) { image in
                                            image
                                                .image?.resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .clipped()
                                                .background(Color.black)
                                        }.simultaneousGesture(TapGesture().onEnded({
                                            controlador.descargar_informacion_planeta(id: planeta.id)
                                        }))
                                }
                            }
                        }
                    }
                }
                }
            Text("gg ez")
                .onAppear{
                    Task{
                        await controlador.descargar_planetas()
                    }
                }
        }
    }
}

#Preview {
    NavigationStack{
        PantallaPlanetas()
            .environment(ControladorAplicacion())
    }
}
