//
//  PantallaPersonajes.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 4/4/25.
//

import SwiftUI

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View{
        ZStack{
            backgroundGradient1
            VStack{
                Text("\(controlador.personaje?.name ?? "Valor por defecto")")
                Text("\(controlador.personaje?.race ?? "Valor por defecto")")
                Text("\(controlador.personaje?.description ?? "Valor por defecto")")
                
                NavigationLink{
                    PantallaPlanetas()
                } label: {
                    Text("Ver planeta")
                }.simultaneousGesture(TapGesture().onEnded({
                    //controlador.ver_perfil(id: controlador.personaje!.id)
                }))
            }
        }.onAppear{
            print("LLEGAMOS")
        }
    }
}
/*
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


#Preview{
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}


/*NavigationLink {
    Text("Hola mundo \(controlador.personaje?.originPlanet?.name)")
} label: {
    Text("El personaje es \(personaje.name)")
    AsyncImage(url: URL(string: personaje.image)) { image in
        image
            .image?.resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .background(Color.blue)
    } .simultaneousGesture(TapGesture()
        .onEnded({
            controlador.descargar_informacion_personaje(id: personaje.id)
        }))
    
    
    /* NavigationStack {
     ScrollView {
     VStack{
     ForEach(controlador.personajes) { personajes in
     NavigationLink {
     PersonajeFoto()
     } label : {
     HStack{
     Text("\(personajes.id)")
     VStack{
     Text("\(personajes.image)")
     Text("\(personajes.description)")
     }
     }
     }.simultaneousGesture(TapGesture().onEnded({
     controlador.personajes_descargados(MonoChino)
     }))
     }
     }
     .background(LinearGradient(
     gradient: Gradient(colors: [.clear, .lila]),
     startPoint: .top, endPoint: .bottom))
     }
     .onAppear {
     print("Hola mundo")
     }
     }
     
     
     //    NavigationLink {
     //      PersonajeFoto()
     //PublicacionVista()
     //} label : {
     //  HStack{
     //    Text("\(personaje.name)")
     //  VStack{
     //    Text("\(personaje.image)")
     //}
     //}
     //}.simultaneousGesture(TapGesture().onEnded({
     //  controlador.seleccionar_personaje(personaje)
     //}))
     //}
     //}
     
     //PersonajeFoto()
     //  .tabItem{
     //    Label{
     //      Text("Imagen completa")
     
     //}icon: {
     //  Circle()
     //.fill(person.profileColor)
     //    .frame(width: 44, height:44, alignment: .center)
     //  .overlay(Text("33 Abarhams"))
     //}
     //}
     
     
     }
     }
     */
 */*/

#Preview {
    NavigationStack{
        PantallaPersonajes()
            .environment(ControladorAplicacion())
    }
}
