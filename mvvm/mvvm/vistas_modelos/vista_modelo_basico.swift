//
//  File.swift
//  mvvm
//
//  Created by Astrid C. Sanchez L. on 3/14/25.
//

import Foundation

@Observable
class VistaModeloBasico {
    var estado_actual_de_la_aplicacion: EstadosDeLaAplicacion = .mostrando_series
    
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie(serie: InformacionSerie? = nil) -> Bool {
        if let serie_nueva = serie {
            if serie_nueva.nombre == "" {
                return false
            }
            series_registradas.append(serie_nueva)
        }
        else {
            series_registradas.append(InformacionSerie(nombre: "Prueba", tipo: "Prueba", fecha_estreno: 2017, Sinopsis: "Aqui va una sinopsis muy larga", caratula: "imagen_fake_1"))
        }
        estado_actual_de_la_aplicacion = .mostrando_series
        
        return true
    }
    
    func cambiar_a_agregar_serie() -> Void{
        estado_actual_de_la_aplicacion = .agragando_series
    }
}
