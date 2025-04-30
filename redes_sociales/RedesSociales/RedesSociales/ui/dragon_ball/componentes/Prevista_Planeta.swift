//
//  Prevista_Planeta.swift
//  RedesSociales
//
//  Created by Astrid C. Sanchez L. on 4/28/25.
//

import SwiftUI

struct PrevistaPlaneta: View {
    var mundo: Planeta
    
    var body: some View {
        Text("Este es \(String(describing: mundo.name))")
    }
}
