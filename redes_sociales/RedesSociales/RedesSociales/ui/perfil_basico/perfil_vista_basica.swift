//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/28/25.
//

import SwiftUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Puede que no")")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "sea bonito ver estas")")
             Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "palabras de error")")
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
