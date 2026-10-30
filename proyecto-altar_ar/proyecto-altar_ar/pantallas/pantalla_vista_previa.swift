//
//  pantalla_vista_previa.swift
//  proyecto-altar_ar
//
//  Created by alumno on 10/30/26.
//

import SwiftUI

// Esta pantalla funciona en el simulador y en Mac. No requiere cámara.
// Agrega un render del altar a Assets.xcassets con el nombre
// "vista_previa_altar" para sustituir el recuadro temporal.
struct PantallaVistaPrevia: View {
    let alRegresar: () -> Void

    @AppStorage("altar.escala") private var escala = 0.70
    @AppStorage("altar.altura") private var altura = 0.01
    @AppStorage("altar.rotacion") private var rotacion = 90.0

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Vista previa")
                    .font(.custom("Bangers-Regular", size: 32, relativeTo: .title))

                RenderAltarTemporal()
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 20))

                Text("Homenaje a Ángel Reyes")
                    .font(.title2.bold())

                Text("Esta ficha es una base visual. Agreguen solamente datos, imágenes y créditos que el equipo haya verificado antes de la entrega final.")
                    .foregroundStyle(Color("texto_secundario"))

                Text("Ajustes para AR")
                    .font(.title2.bold())

                AjusteDeslizable(
                    titulo: "Escala del altar",
                    valor: $escala,
                    rango: 0.20...1.20,
                    formato: "%.2f"
                )
                AjusteDeslizable(
                    titulo: "Altura sobre la imagen",
                    valor: $altura,
                    rango: 0.00...0.10,
                    formato: "%.2f m"
                )
                AjusteDeslizable(
                    titulo: "Rotación al detectar imagen",
                    valor: $rotacion,
                    rango: -180...180,
                    formato: "%.0f°"
                )

                Text("Los valores se guardan en este dispositivo. Cuando el modelo aparezca en AR, copiaremos escala, altura y rotación aprobadas a la vista de cámara.")
                    .font(.footnote)
                    .foregroundStyle(Color("texto_secundario"))

                Button("Regresar al menú", action: alRegresar)
                    .buttonStyle(.borderedProminent)
                    .tint(Color("acento_rojo"))
            }
            .padding(24)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("fondo").ignoresSafeArea())
        .foregroundStyle(Color("texto_principal"))
    }
}

private struct RenderAltarTemporal: View {
    var body: some View {
        ZStack {
            Color("superficie")
            Image("vista_previa_altar")
                .resizable()
                .scaledToFit()
                .padding(12)

            VStack {
                Spacer()
                Text("Render del altar")
                    .font(.caption.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.black.opacity(0.55), in: Capsule())
                    .padding(12)
            }
        }
    }
}

private struct AjusteDeslizable: View {
    let titulo: String
    @Binding var valor: Double
    let rango: ClosedRange<Double>
    let formato: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(titulo)
                Spacer()
                Text(String(format: formato, valor))
                    .monospacedDigit()
                    .foregroundStyle(Color("acento_cempasuchil"))
            }
            Slider(value: $valor, in: rango)
                .tint(Color("acento_cempasuchil"))
        }
    }
}

#Preview {
    PantallaVistaPrevia { }
        .preferredColorScheme(.dark)
}
