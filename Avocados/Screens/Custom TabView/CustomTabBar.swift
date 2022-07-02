//
//  CustomTabBar.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 7/1/22.
//

import SwiftUI

struct CustomTabBar: View {
    // MARK: - Property
    
    @Binding var selectedTab: String
    @State var tabPoints: [CGFloat] = []
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: 0) {
            
            // MARK: - Tab Bar Buttons
            
            TabBarButton(image: "tabicon-branch", text: "Avocados", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "tabicon-book", text: "Recipes", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "tabicon-avocado", text: "Ripening", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "tabicon-settings", text: "Settings", selectedTab: $selectedTab, tabPoints: $tabPoints)

        }
        .padding()
        .background(
            Color("TabBarColor")
                .clipShape(TabCurve(tabPoint: getCurvedPoint() - 15))
        )
        .overlay(
            
            Circle()
                .fill(Color("TabBarColor"))
                .frame(width: 10, height: 10)
                .offset(x: getCurvedPoint() - 20)
            
            , alignment: .bottomLeading
        )
        .cornerRadius(30)
        .padding(.horizontal)
    }
    
    func getCurvedPoint() -> CGFloat {
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case "Avocados":
                return tabPoints[0]
                
            case "Recipes":
                return tabPoints[1]
                
            case "Ripening":
                return tabPoints[2]
                
            default:
                return tabPoints[3]
            }
        }
    }
    
}

struct TabBarButton: View {
    // MARK: - Property
    
    var image: String
    var text: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]

    // MARK: - Body
    
    var body: some View {
        
        // getting midpoint for each animation
        
        GeometryReader { reader -> AnyView in
            
            // extracting MidPoint and Storing
            let midx = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                if tabPoints.count <= 4 {
                    tabPoints.append(midx)

                }
            }
            
            return AnyView(
            
                Button(action: {
                    
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selectedTab = text
                    }
                    
                }, label: {
                    VStack {
                        
                        Image(image)
                            .font(.system(size: 25, weight: .semibold))
                            .offset(y: selectedTab == text ? -10 : 0)
                        Text(text)
                            .font(.system(size: 10))
                            .offset(y: selectedTab == text ? -10 : 0)
                    } //: VSTACK
                    .accentColor(.primary)
                   
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        // maxHeight
        .frame(height: 40)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        AppScreen()
    }
}
