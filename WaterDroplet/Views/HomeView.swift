//
//  HomeView.swift
//  WaterDroplet
//
//  Created by Stanley Pan on 2022/02/12.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        VStack {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(10)
                .background(Color.white, in: Circle())
            
            Text("Time to get hydrated!")
                .fontWeight(.semibold)
                .foregroundColor(Color.gray)
                .padding(.bottom, 30)
            
            // MARK: Wave Form
            GeometryReader { proxy in
                let size = proxy.size
                
                ZStack {
                    // MARK: Water Drop
                    Image(systemName: "drop.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.white)
                        .scaleEffect(x: 1.1, y: 1)
                    
                    // MARK: Wave Form Shape
                }
                .frame(width: size.width, height: size.height, alignment: .center)
            }
            .frame(height: 350)
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
