//
//  controlador_app.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/26/25.
//

import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion {
    var publicaciones: Array<Publicacion> = []
    var comentarios: Array<Comentario> = []
    
    var publicacion_seleccionada: Publicacion? = nil
    var perfil_a_mostrar: Perfil? = nil
    
    //Seccion Dragon ball
    var pagina_resultados: PaginaResultado? = nil
    var personajes: Array<MonoChino> = []
    var personaje: MonoChino? = nil
    
    //Seccion Planeta
    var pagina_resultados_planetas: PaginaResultadoPlaneta? = nil
    var planetas: Array<Planeta> = []
    var mundo: Planeta? = nil
    
    init() {
        Task.detached(priority: .high) {
            await self.descargar_publicaciones()
            
            //await self.descargar_monos_chinos()
        }
    }
    
    func descargar_publicaciones() async {
        defer{
            print("Esta funcion se mando a llamar despues de todos los awaits en mi funcion \(#function)")
        }
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else {return}
        
        publicaciones = publicaciones_descargadas
    }
    
    func descargar_comentarios() async {
        defer{
            print("Esta funcion se mando a llamar despues de todos los awaits en mi funcion \(#function)")
        }
        guard let comentarios_descargadas: [Comentario] = try? await PlaceHolderAPI().descargar_comentarios(post_id: self._publicacion_seleccionada!.id) else {return}
        
        comentarios = comentarios_descargadas
    }
    
    
    func seleccionar_publicacion(_ publicacion: Publicacion) -> Void {
        publicacion_seleccionada = publicacion
        
        Task.detached(operation: {
            await self.descargar_comentarios()
        })
        
    }
    func descargar_perfil(id: Int) async -> Void {
        guard let perfil: Perfil = try? await PlaceHolderAPI().descargar_perfil(id: id) else { return }
        perfil_a_mostrar = perfil
        
    }
    func ver_perfil(id: Int) -> Void {
        Task.detached {
            await self.descargar_perfil(id: id)
        }
    }
        
    func descargar_monos_chinos() async {
        guard let pagina_descargada: PaginaResultado = try? await DragonballAPI().descargar_pagina_personajes() else {return}
        
        self.pagina_resultados = pagina_descargada
        }
    
    func descargar_info_personaje(id: Int) async{
        guard let mono_chino: MonoChino = try? await DragonballAPI().descargar_informacion_personaje(id: id) else {return}
        
        self.personaje = mono_chino
    }
    /*MINE*/
    func descargar_planetas() async {
        guard let pagina_descargada_p: PaginaResultadoPlaneta = try? await DragonballAPI().descargar_pagina_planetas() else {return}
        
        self.pagina_resultados_planetas = pagina_descargada_p
    }
    
    func descargar_info_planeta(id: Int) async{
        guard let planeta: Planeta = try? await DragonballAPI().descargar_informacion_planeta(id: id) else {return}
        
        self.mundo = planeta
    }
    /*MINE...*/
    
    func descargar_informacion_personaje(id: Int) {
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    /*MINE*/
    func descargar_informacion_planeta(id: Int) {
        Task.detached(operation: {
            await self.descargar_info_planeta(id: id)
        })
    }
    /*MINE...*/
}
