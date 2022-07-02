//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 7/1/22.
//

import SwiftUI

struct RipeningStagesScreen: View {
    // MARK: - Properties
    
    var ripeningStages: [Ripening] = ripeningData
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages) {item in
                        RipeningView(ripening: item)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct RipeningStagesScreen_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesScreen(ripeningStages: ripeningData)
    }
}
