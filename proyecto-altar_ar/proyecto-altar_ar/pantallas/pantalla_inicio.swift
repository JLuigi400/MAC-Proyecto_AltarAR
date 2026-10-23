//
//  pantalla_inicio.swift
//  proyecto-altar_ar
//
//  Created by alumno on 21/10/26.
//

import SwiftUI

struct PantallaInicio: View {
    var body: some View {
        NavigationStack {
            VStack (spacing: 24){
                Spacer()
                Image(systemName: "camera.macro")
                    .font(.system(size: 70))
                    .bold()
                    .foregroundStyle(.orange)
                
                Text("Altar de Recuerdo")
                    .font(.custom("Bangers-Regular", size: 32))
                    .foregroundStyle(Color("texto_principal"))
                
                Text("Un homenaje a Alexis Ortega")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                
                Text("Conoce su historia y descubre el altar")
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                // Al pulsarlo, abrimos la pantalla de selecciones
                NavigationLink {
                    PantallaSelecciones()
                } label: {
                    Text("Comenzar")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .tint(Color("acento_rojo"))
                .foregroundStyle(Color("texto_principal"))
            }
            .padding(24)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("fondo").ignoresSafeArea())
            .foregroundStyle(Color("texto_principal"))
        }
        
    }
}

#Preview {
    PantallaInicio()
}
