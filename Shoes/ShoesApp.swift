//
//  TeslaApp.swift
//  Tesla
//
//  Created by mishu on 27.07.2022.
//

import SwiftUI

@main
struct ShoesApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack{
                APP()
                Opener()
                
            }
            .transition(.identity.animation(.easeInOut))
        }
    }
}
