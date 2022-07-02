//
//  AppView.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 7/1/22.
//

import SwiftUI

struct AppScreen: View {
    // MARK: - Properties
    
    @State var selectedTab: String = "Avocados"
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            switch selectedTab {
            case "Avocados":
                AvocadosScreen()
                
            case "Recipes":
                ContentScreen()
                
            case "Ripening":
                RipeningStagesScreen()
                
            default:
                SettingsScreen()
            }

            CustomTabBar(selectedTab: $selectedTab)
            
        }
        
    }
}

struct AppScreen_Previews: PreviewProvider {
    static var previews: some View {
        AppScreen()
    }
}
