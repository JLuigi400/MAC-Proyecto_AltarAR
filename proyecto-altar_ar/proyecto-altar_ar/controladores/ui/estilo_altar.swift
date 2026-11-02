//
//  estilo_altar.swift
//  proyecto-altar_ar
//
//  Created by Iris Gabriela Perales Ortiz on 01/11/26.
//

import SwiftUI

/// Fondo común: noche, cempasúchil y detalles de cómic sin usar logotipos.
struct FondoAltar: View {
    var body: some View {
        ZStack {
            Color("fondo")
            Circle()
                .fill(Color("acento_rojo").opacity(0.18))
                .frame(width: 300)
                .blur(radius: 70)
                .offset(x: 150, y: -330)
            Circle()
                .fill(Color("acento_cempasuchil").opacity(0.12))
                .frame(width: 240)
                .blur(radius: 65)
                .offset(x: -130, y: 360)
            Image(systemName: "sparkles")
                .font(.system(size: 140, weight: .thin))
                .foregroundStyle(Color("acento_azul").opacity(0.07))
                .offset(x: 120, y: 250)
        }
        .ignoresSafeArea()
    }
}

struct InsigniaAltar: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("acento_rojo").opacity(0.22))
                .frame(width: 112, height: 112)
            Image(systemName: "camera.macro")
                .font(.system(size: 44, weight: .semibold))
                .foregroundStyle(Color("acento_cempasuchil"))
            Image(systemName: "sparkles")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(Color("acento_azul"))
                .offset(x: 43, y: -38)
        }
        .accessibilityLabel("Altar de recuerdo en realidad aumentada")
    }
}

struct BotonAltar: View {
    let titulo: String
    let icono: String
    let accion: () -> Void

    var body: some View {
        Button(action: accion) {
            HStack(spacing: 14) {
                Image(systemName: icono)
                    .font(.title3.weight(.semibold))
                    .frame(width: 28)
                Text(titulo)
                    .font(.headline)
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.caption.bold())
                    .opacity(0.75)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 17)
            .foregroundStyle(Color("texto_principal"))
            .background(
                LinearGradient(
                    colors: [Color("acento_rojo"), Color("acento_rojo").opacity(0.52)],
                    startPoint: .leading,
                    endPoint: .trailing
                ),
                in: RoundedRectangle(cornerRadius: 22)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color("acento_cempasuchil").opacity(0.35), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

struct TarjetaAltar<Contenido: View>: View {
    let contenido: Contenido

    init(@ViewBuilder contenido: () -> Contenido) {
        self.contenido = contenido()
    }

    var body: some View {
        contenido
            .padding(18)
            .background(Color("superficie").opacity(0.92), in: RoundedRectangle(cornerRadius: 22))
            .overlay(
                RoundedRectangle(cornerRadius: 22)
                    .stroke(Color("acento_azul").opacity(0.28), lineWidth: 1)
            )
    }
}
