//
//  pantalla_creditos.swift
//  proyecto-altar_ar
//
//  Created by alumno on 21/10/26.
//

import SwiftUI

struct PantallaCreditos: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Text("Quienes construimos este recuerdo")
                    .font(
                        .custom("Bangers", size: 32, relativeTo: .title)
                    )

                Text("Altar en homenaje a Alexis Ortega")
                    .font(.headline)

                Text("Equipo creador")
                    .font(.title2)
                    .bold()

                // Sustituye estos textos por sus nombres.
                Text("SARAH JESSICA ESPARZA")
                Text("Nombre del integrante 2")
                Text("Nombre del integrante 3")

                Divider()

                Text("Proyecto académico en desarrollo.")
                    .font(.footnote)

                Text("Tipografía: Bangers, de Vernon Adams.")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(24)
        }
        .background(Color("fondo").ignoresSafeArea())
        .foregroundStyle(Color("texto_principal"))
        .navigationTitle("Créditos")
    }
}

#Preview {
    NavigationStack {
        PantallaCreditos()
    }
}
