//
//  vista_ar.swift
//  proyecto-altar_ar
//
//  Created by Iris Gabriela Perales Ortiz on 23/10/26.
//

import SwiftUI

// Esto es para revisar si se esta viendo desde un celular o tableta
#if os(iOS)
import ARKit
import RealityKit
import UIKit

/// Esta vista solo se compila en el destino iPhone/iPad
/// El cubo naranja confirma que la cámara y ARKit funcionan.
/// Más adelante se cambiará por el modelo de la mesa.

struct VistaARBase: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let VistaAR = ARView(frame: .zero)
        let configuracion = ARWorldTrackingConfiguration()
        configuracion.planeDetection = [.horizontal]
        VistaAR.session.run(configuracion)
        
        let ancla = AnchorEntity(plane: .horizontal)
        let material = SimpleMaterial(color: .systemOrange, isMetallic: true)
        let cubo = ModelEntity(mesh: .generateBox(size: 0.10), materials: [material])
        
        cubo.position.y = 0.05
        ancla.addChild(cubo)
        VistaAR.scene.addAnchor(ancla)
        
        return VistaAR
    }
    
    func updateUIView(_ uiView: ARView, context: Context) { }
}

#endif
