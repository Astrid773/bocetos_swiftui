//
//  dragonball_api.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 4/2/25.
//
import SwiftUI

class DragonballAPI: Codable {
    let url_base = "https://dragonball-api.com/api"
    
    func descargar_pagina_personajes() async -> PaginaResultados? {
        let ubicacion_recurso = "/characters"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico? {
        do {
            guard let url = URL(string: "\(url_base)\(recurso)") else {throw ErroresDeRed.badUrl}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus}
            do{
            let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                
                return respuesta_decodificada
            }
            catch let error as NSError{
                    print("EL ERROR EN TU MODELO ES:\(error.debugDescription)")
                throw ErroresDeRed.fallaAlConvertirLaRespuesta
                }
            //return respuesta_decodificada
        }
            
        catch ErroresDeRed.badUrl {
            print("Tener mal la url capo, cambiala")
        }
        catch ErroresDeRed.badResponse {
            print("Algo salio mal con la respuesta, revisa por favor")
        }
        catch ErroresDeRed.badStatus {
            print("Como consigues un estatus negativo de algo que nisiquiera de mueve")
            print("En DragonballAPI")
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
