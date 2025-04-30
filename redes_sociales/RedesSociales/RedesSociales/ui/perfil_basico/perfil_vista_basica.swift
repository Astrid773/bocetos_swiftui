//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 3/28/25.
//

import SwiftUI
//Para usar la galeria
import PhotosUI

let backgroundGradient = LinearGradient(
    colors: [Color.clear, Color.mint],
    startPoint: .top, endPoint: .bottom)

struct PerfilBasicoVista: View {
    @State var foto_seleccionada: PhotosPickerItem? = nil
    @State var foto_a_mostrar: UIImage? = nil
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {

        ZStack{
            backgroundGradient
            VStack{
                PhotosPicker(selection: $foto_seleccionada) {
                    Image(uiImage: foto_a_mostrar ?? UIImage(resource:.avatar2))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(.circle)
                }
                .onChange(of: foto_seleccionada){ valor_anterior, valor_nuevo in
                    Task{
                        if let foto_seleccionada, let datos = try? await foto_seleccionada.loadTransferable(type: Data.self){
                            if let imagen = UIImage(data: datos) {
                                foto_a_mostrar = imagen
                            }
                        }
                    }
                }
                
                Text("User: \(controlador.perfil_a_mostrar?.username ?? "Puede que no")")
                Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "sea bonito ver estas")")
                Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "palabras de error")")
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
