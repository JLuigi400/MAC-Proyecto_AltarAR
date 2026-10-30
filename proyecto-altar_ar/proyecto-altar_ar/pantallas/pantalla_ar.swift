//
//  pantalla_ar.swift
//  proyecto-altar_ar
//
//  Created by Iris Gabriela Perales Ortiz on 23/10/26.
//

import SwiftUI

struct PantallaARBase: View {
    let alRegresar: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Base de Realidad Aumentada")
                .font(.custom("Bangers", size: 32, relativeTo: .title))
            
            #if os (iOS)
            VistaARPorImagen()
                .clipShape(RoundedRectangle(cornerRadius: 18))
            
            Text("Apunta la cámara a la imagen conmemorativa para colocar la mesa del altar")
                .multilineTextAlignment(.center)
            #else
            Image(systemName: "iphone")
                .font(.system(size: 60))
                .foregroundStyle(Color("acento_azul"))
            
            Text("La cámara y la realidad aumentada se prueban en un iPhone o iPad. Esta plantilla se mantiene visible en Mac para continuar el diseño")
                .multilineTextAlignment(.center)
            
            #endif
            
            Button("Regresar al menú") {
                alRegresar()
            }
            .buttonStyle(.borderedProminent)
            .tint(Color("acento_rojo"))
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("fondo").ignoresSafeArea())
        .foregroundStyle(Color("texto_principal"))
    }
}

