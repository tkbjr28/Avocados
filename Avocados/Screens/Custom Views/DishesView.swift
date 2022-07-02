//
//  DishesView.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 7/1/22.
//

import SwiftUI

extension Image {
    func IconModifier() -> some View {
        self
            .resizable()
            .frame(width: 42, height: 42, alignment: .center)
    }
}

struct DishesView: View {
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            
            // MARK: - 1st Column
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image("icon-toasts")
                        .IconModifier()
                    Spacer()
                    Text("Toast")
                } //: Row 1
                
                Divider()
                
                HStack {
                    Image("icon-tacos")
                        .IconModifier()
                    Spacer()
                    Text("Tacos")
                } //: Row 2
                
                Divider()
                
                HStack {
                    Image("icon-salads")
                        .IconModifier()
                    Spacer()
                    Text("Salads")
                } //: Row 3
                
                Divider()
                
                HStack {
                    Image("icon-halfavo")
                        .IconModifier()
                    Spacer()
                    Text("Spreads")
                } //: Row 4
            } //: 1st Column
            
            // MARK: - 2nd Columnn
            
            VStack(alignment: .center, spacing: 16) {
                HStack {
                    Divider()
                }
                
                Image(systemName: "heart.circle")
                    .font(.title.weight(.ultraLight))
                    .imageScale(.large)
                
                HStack {
                    Divider()
                }
            } //: 2nd Column
            
            // MARK: - 3rd Columnn
            
            VStack(alignment: .trailing, spacing: 4) {
                HStack {
                    Text("Guacamole")
                    Spacer()
                    Image("icon-guacamole")
                        .IconModifier()
                } //: Row 1
                
                Divider()
                
                HStack {
                    Text("Sandwich")
                    Spacer()
                    Image("icon-sandwiches")
                        .IconModifier()
                } //: Row 2
                
                Divider()
                
                HStack {
                    Text("soup")
                    Spacer()
                    Image("icon-soup")
                        .IconModifier()
                } //: Row 3
                
                Divider()
                
                HStack {
                    Text("Smoothie")
                    Spacer()
                    Image("icon-smoothies")
                        .IconModifier()
                } //: Row 1
                
            } //: 3rd Column
        } //: HSTACK
        .font(.system(.callout, design: .serif))
        .foregroundColor(.gray)
        .padding(.horizontal)
        .frame(maxHeight: 220)
    }
}

struct DishesView_Previews: PreviewProvider {
    static var previews: some View {
        DishesView()
            .previewLayout(.fixed(width: 414, height: 280))
    }
}
