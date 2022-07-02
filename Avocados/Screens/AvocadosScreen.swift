//
//  AvocadosScreen.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 6/30/22.
//

import SwiftUI

struct AvocadosScreen: View {
    // MARK: - Properties
    
    @State private var isAnimating: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        
        VStack {
            // MARK: - Header
            
            Spacer()
            
            Image("avocado")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 240, height: 240, alignment: .center)
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
                .scaleEffect(isAnimating ? 1 : 0.9)
                .opacity(isAnimating ? 1 : 0.9)
                .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isAnimating)
            
            // MARK: - Center
            
            VStack {
                
                Text("Avocados")
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                    .padding()
                .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)
                
                Text("""
                    Creamy, green, and full of nutrients! Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
                    """)
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color("ColorGreenLight"))
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640, minHeight: 120)
                
            } //: CENTER
            .padding()
            
            Spacer()
            
        } //: VSTACK
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            isAnimating = true
        }
    }
}

struct AvocadosScreen_Previews: PreviewProvider {
    static var previews: some View {
        AvocadosScreen()
            .previewDevice("iPhone 13 Pro")
            .environment(\.colorScheme, .dark)
        
    }
}
