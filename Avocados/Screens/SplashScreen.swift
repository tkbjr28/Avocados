//
//  SplashScreen.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 6/30/22.
//

import SwiftUI

struct SplashScreen: View {
    // MARK: - Property
    
    @State private var isSplashScreenActive: Bool = true
    @State private var isAnimating: Bool = false
    @State private var size: Double = 0.8
    @State private var opacity: Double = 0.5
    
    
    // MARK: - Body
    
    var body: some View {
        if isSplashScreenActive {
            
            ZStack {
                Image("background")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    // MARK: - Header
                    
                    Text("AVOCADOS")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .offset(y: -75)
                        .scaleEffect(isAnimating ? 1 : size)
                        .opacity(isAnimating ? 1 : opacity)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                    
                    // MARK: - Center
                    
                    Image("avocado")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .offset(y: -50)
                        .scaleEffect(isAnimating ? 1 : size)
                        .opacity(isAnimating ? 1 : opacity)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)

                    
                } //: VSTACK
            } //: ZSTACK
            .onAppear {
                isAnimating = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.75, execute: {
                    withAnimation {
                        isSplashScreenActive = false
                    }
                })
            }
            
        } else {
            ContentView()
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
