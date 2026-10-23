//
//  pantalla_inicio.swift
//  proyecto-altar_ar
//
//  Created by alumno on 21/10/26.
//

import SwiftUI

struct PantallaInicio: View {
    let alComenzar: () -> Void
    
    var body: some View {
        
        VStack (spacing: 24){
            Spacer()
            Image(systemName: "camera.macro")
                .font(.system(size: 70))
                .foregroundStyle(Color("acento_cempasuchil"))
                
            Text("Altar de Recuerdo")
                .font(.custom("Bangers-Regular", size: 38, relativeTo: .largeTitle))
                .multilineTextAlignment(.center)
                
            Text("Un homenaje a Alexis Ortega")
                .font(.title3)
                
            Text("Conoce su historia y descubre el altar")
                .multilineTextAlignment(.center)
                
            Spacer()
            
            Button("Comenzar") {
                alComenzar()
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(Color("acento_rojo"))
        }
        .padding(24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("fondo").ignoresSafeArea())
        .foregroundStyle(Color("texto_principal"))
        
    }
}

#Preview {
    PantallaInicio { }
        .preferredColorScheme(.dark)
}
