import SwiftUI

struct PantallaMenu: View {
    let abrirPantalla: (PantallaActual) -> Void

    var body: some View {
        ZStack {
            FondoAltar()
            VStack(spacing: 18) {
                InsigniaAltar()
                    .scaleEffect(0.7)
                    .frame(height: 72)
                Text("¿QUÉ QUIERES EXPLORAR?")
                    .font(.custom("Bangers-Regular", size: 32, relativeTo: .largeTitle))
                Text("Un recorrido por el trabajo y el recuerdo de Alexis Ortega.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("texto_secundario"))

                BotonAltar(titulo: "Conoce sus voces", icono: "waveform") {
                    abrirPantalla(.informacion)
                }
                BotonAltar(titulo: "Ver el altar con la cámara", icono: "camera.viewfinder") {
                    abrirPantalla(.realidadAumentada)
                }
                BotonAltar(titulo: "Equipo de desarrollo", icono: "person.3.fill") {
                    abrirPantalla(.creditos)
                }
            }
            .padding(24)
        }
        .foregroundStyle(Color("texto_principal"))
    }
}
