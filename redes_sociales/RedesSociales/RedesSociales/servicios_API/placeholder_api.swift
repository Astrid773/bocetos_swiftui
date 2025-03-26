//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/24/25.
//

import SwiftUI


class PlaceHolderAPI: Codable {
    let url_de_servicio = "https://jsonplaceholder.typicode.com"
    
    func descargar_publicaciones() async -> [Publicacion]? {
        let ubicacion_recurso = "/posts"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_comentarios(post_id: Int) async -> [Comentario]? {
        let ubicacion_recurso = "/posts/\(post_id)/comments"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar<TipoGenerico: Codable>(recurso: String) async throws -> TipoGenerico? {
        do {
            guard let url = URL(string: "\(url_de_servicio)\(recurso)") else {throw ErroresDeRed.malaDireccionUrl}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {throw ErroresDeRed.badStatus}
            guard let respuesta_decodificada = try? JSONDecoder().decode(TipoGenerico.self, from: datos) else {throw ErroresDeRed.fallaAlConvertirLaRespuesta
            }
            
            return respuesta_decodificada
        }
        catch ErroresDeRed.malaDireccionUrl {
            print("Tener mal la url capo, cambiala")
        }
        catch ErroresDeRed.badResponse {
            print("Algo salio mal con la respuesta, revisa por favor")
        }
        catch ErroresDeRed.badStatus {
            print("Como consigues un estatus negativo de algo que nisiquiera de mueve")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta {
            print("Tienes mal el modelo o la implementacion de esta")
        }
        catch ErroresDeRed.invalidRequest {
            print("Como llegaste aqui?)")
        }
        catch {
            print("Algo terriblemente mal que no se que es, paso. No deberias ver esto")
        }
        return nil
    }
}
