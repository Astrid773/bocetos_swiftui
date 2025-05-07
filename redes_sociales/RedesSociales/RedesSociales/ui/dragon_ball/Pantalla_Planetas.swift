//
//  Pantalla_Planetas.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 4/28/25.
//

import SwiftUI

let backgroundGradient3 = LinearGradient(
    colors: [Color.black, Color.clear],
    startPoint: .top, endPoint: .bottom)

struct PantallaPlanetas: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            ZStack{
                backgroundGradient1
                if(controlador.pagina_resultados_planetas != nil) {
                    ScrollView{
                        VStack{
                            ForEach(controlador.pagina_resultados_planetas!.items) { planeta in
                                NavigationLink{
                                    PlanetaUnico()
                                } label: {
                                    VStack(alignment: .center){
                                        Text("El planeta es \(planeta.name)")
                                            .fontWeight(.black)
                                            .fontWidth(.expanded)
                                            .padding(7)
                                            .foregroundStyle(LinearGradient(
                                                gradient: Gradient(colors: [.lila, .black]),
                                                startPoint: .top, endPoint: .bottom))
                                        
                                        VStack{
                                            AsyncImage(url: URL(string: planeta.image)) { image in
                                                image
                                                    .image?.resizable().frame(width: 300, height: 300)
                                                    .aspectRatio(contentMode: .fill)
                                                    .clipShape(Rectangle())
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius:10)
                                                            .stroke(.menta, lineWidth: 10)
                                                    )
                                            }.shadow(color: Color.black, radius:10, x:5, y:5)
                                                .simultaneousGesture(TapGesture().onEnded({
                                                    controlador.descargar_informacion_planeta(id: planeta.id)
                                                }))
                                            VStack{
                                                //Text("\(controlador.mundo?.description ?? "Valor por defecto")")
                                                Text("Esta destruido? \(planeta.isDestroyed)")
                                                    .fontWeight(.black)
                                                    .fontWidth(.compressed)
                                                    .padding(20)
                                                    .foregroundStyle(LinearGradient(
                                                        gradient: Gradient(colors: [.menta, .white]),
                                                        startPoint: .top, endPoint: .bottom))
                                                    .aspectRatio(contentMode: .fill)
                                                    .clipShape(Rectangle())
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius:4)
                                                            .stroke(.indigo, lineWidth: 4)
                                                    )
                                                    .padding(30)
                                                    .shadow(color: Color.black, radius:10, x:5, y:5)
                                                backgroundGradient3
                                            }
                                            .background(Color.black)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Text("")
                    .onAppear{
                        Task{
                            await controlador.descargar_planetas()
                        }
                    }
            }
        }
    }
}

/*
     var body: some View {
         NavigationStack{
             if(controlador.pagina_resultados != nil) {
                 ScrollView{
                     VStack{
                         ForEach(controlador.pagina_resultados!.items) { personaje in
                             NavigationLink {
                                 PantallaPersonajes()
                             } label: {
                                 Text("El personaje es \(personaje.name)")
                                 VStack{
                                     AsyncImage(url: URL(string: personaje.image)) { image in
                                         image
                                             .image?.resizable()
                                             .aspectRatio(contentMode: .fill)
                                             .clipped()
                                             .background(Color.blue)
                                     }
                                 }
                             }.simultaneousGesture(TapGesture().onEnded({
                                 print("Personaje \(personaje.id)")
                                 controlador.descargar_informacion_personaje(id: personaje.id)
                             }))
                         }
                     }
                 }
             }
         }.onAppear{
             Task{
                 await controlador.descargar_monos_chinos()
             }
         }
     }
 }
 */

#Preview {
    PantallaPlanetas()
        .environment(ControladorAplicacion())
}

/*
 FUNCIONA
 
 struct PantallaPlanetas: View {
     @Environment(ControladorAplicacion.self) var controlador
     
     var body: some View {
         ZStack{
             backgroundGradient1
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
 */
