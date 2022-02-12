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
