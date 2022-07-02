//
//  ContentView.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 6/30/22.
//

import SwiftUI

extension View {
    func titleModifer() -> some View {
        self
            .font(.system(.title, design: .serif))
            .foregroundColor(Color("ColorGreenAdaptive"))
            .padding(8)
    }
}

struct ContentScreen: View {
    // MARK: - Properties
    
    var headers: [Header] = headersData
    var facts: [Fact] = factsData
    var recipes: [Recipe] = recipesData
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                
                // MARK: - Header
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(headers) { item in
                            HeaderView(header: item)
                        }
                    } //: HSTACK
                } //: HEADER
                
                // MARK: - Avocado Dishes
                
                Text("Avocado Dishes")
                    .fontWeight(.bold)
                    .titleModifer()
                
                DishesView()
                    .frame(maxWidth: 640)
                
                // MARK: - Avocado Facts
                
                Text("Avocado Facts")
                    .fontWeight(.bold)
                    .titleModifer()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 60) {
                        ForEach(facts) { item in
                            FactsView(fact: item)
                        }
                    } //: HSTACK
                    .padding(.vertical)
                    .padding(.leading, 60)
                    .padding(.trailing, 20)
                } //: Facts
                
                // MARK: - Recipe Cards
                
                Text("Avocado Recipes")
                    .fontWeight(.bold)
                    .titleModifer()
                
                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipes) { item in
                        RecipeCardView(recipe: item)
                    }
                } //: Recipe Cards
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                // MARK: - Footer
                
                VStack(alignment: .center, spacing: 20) {
                    Text("All About Avocados")
                        .fontWeight(.bold)
                        .titleModifer()
                    Text("Everything you wanted to know about avocados but wew afraid to ask")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .frame(minHeight: 60)
                    
                } //: FOOTER
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            } //: VSTACK
        } //:  Vertical Scroll View
        .edgesIgnoringSafeArea(.all)
        .padding(0)
    }
}

struct ContentScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentScreen(headers: headersData, facts: factsData, recipes: recipesData)
    }
}
