//
//  pantalla_creditos.swift
//  proyecto-altar_ar
//
//  Created by alumno on 21/10/26.
//

import SwiftUI

struct PantallaCreditosSimples: View {
    let alRegresar: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Equipo de Desarrollo")
                .font(.custom("Bangers", size: 32, relativeTo: .title))
            
            Text("Altar en homenaje a Alexis Ortega")
                .font(.headline)
            
            Text("SARAH JESSICA ESPARZA MONROY      - 213178")
            Text("JAVIER ENRIQUE VILLASEÑOR VARGAS  - 204581")
            Text("JORGE ANIBAL ESPINOSA PERALES     - 168768")
            
            Spacer()
            
            Button("Regresar al Menú") {
                alRegresar()
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("acento_rojo"))
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("fondo").ignoresSafeArea())
        .foregroundStyle(Color("texto_principal"))
    }
}

#Preview {
    NavigationStack {
        PantallaCreditosSimples()
    }
}
