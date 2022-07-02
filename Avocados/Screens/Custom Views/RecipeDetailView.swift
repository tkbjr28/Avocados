//
//  RecipeDetailView.swift
//  Avocados
//
//  Created by Tornelius Broadwater, Jr on 7/2/22.
//

import SwiftUI

struct RecipeDetailView: View {
    // MARK: - Properties
    
    var recipe: Recipe
    
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 0) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    
                    // MARK: - Title
                    
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(.top, 10)
                    
                    // MARK: - Rating
                    
                    RecipeRatingView(recipe: recipe)
                    
                    // MARK: - Cooking
                    
                    RecipeCookingView(recipe: recipe)
                    
                    // MARK: - Ingredients
                    
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .titleModifer()
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self) { item in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    } //: Ingredients
                    
                    // MARK: - Instructions
                     
                    
                    Text("Instructions")
                        .fontWeight(.bold)
                        .titleModifer()
                    
                    ForEach(recipe.instructions, id: \.self) { item in
                        VStack(alignment: .center, spacing: 5) {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 42, height: 42, alignment: .center)
                                .imageScale(.large)
                                .font(Font.title.weight(.ultraLight))
                                .foregroundColor(Color("ColorGreenAdaptive"))
                            
                            Text(item)
                                .lineLimit(nil)
                                .multilineTextAlignment(.center)
                                .font(.system(.body, design: .serif))
                                .frame(minHeight: 100)
                        } //: Instructions
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            } //: VStack
        } //: Scroll View
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack {
                Spacer()
                VStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.down.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .opacity(pulsate ? 1 : 0.6)
                            .scaleEffect(pulsate ? 1.2 : 0.8, anchor: .center)
                            .animation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true))
                }) //: Button
                    .padding(.trailing, 20)
                    .padding(.top, 24)
                    Spacer()
                } //: VSTACK
            } //: HSTACK
        ) //: Close Button
        .onAppear {
            pulsate.toggle()
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData[0])
    
    }
}
