import SwiftUI

struct PantallaInicio: View {
    let alComenzar: () -> Void

    var body: some View {
        ZStack {
            FondoAltar()
            VStack(spacing: 22) {
                Spacer()
                InsigniaAltar()
                Text("ALTAR DE RECUERDO")
                    .font(.custom("Bangers-Regular", size: 40, relativeTo: .largeTitle))
                    .multilineTextAlignment(.center)
                Text("Un homenaje a Alexis Ortega")
                    .font(.title3.weight(.semibold))
                Text("Voces, recuerdos y un altar que cobra vida al mirar su imagen conmemorativa.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("texto_secundario"))
                    .padding(.horizontal, 18)
                Spacer()
                BotonAltar(titulo: "Comenzar", icono: "sparkles", accion: alComenzar)
            }
            .padding(24)
        }
        .foregroundStyle(Color("texto_principal"))
    }
}
