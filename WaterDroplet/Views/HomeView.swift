//
//  HomeView.swift
//  WaterDroplet
//
//  Created by Stanley Pan on 2022/02/12.
//

import SwiftUI

struct HomeView: View {
    @State var progress: CGFloat = 0.5
    @State var startAnimation: CGFloat = 0
    
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
                        .offset(y: -1)
                    
                    // MARK: Wave Form Shape
                    WaterWave(progress: progress, waveHeight: 0.1, offset: startAnimation)
                        .fill(Color("waterBlue"))
                    // MARK: Air Bubbles
                        .overlay(content: {
                            ZStack {
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 15, height: 15)
                                    .offset(x: -20)
                                
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 15, height: 15)
                                    .offset(x: 40, y: 30)
                                
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 25, height: 25)
                                    .offset(x: -30, y: 80)
                                
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 25, height: 25)
                                    .offset(x: 50, y: 70)
                                
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 10, height: 10)
                                    .offset(x: 40, y: 100)
                                
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 10, height: 10)
                                    .offset(x: -40, y: 50)
                            }
                        })
                    // Masking into Drop Shape
                        .mask {
                            Image(systemName: "drop.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(20)
                        }
                    // MARK: Button
                        .overlay(alignment: .bottom) {
                            Button {
                                progress += 0.05
                            } label: {
                                Image(systemName: "plus")
                                    .font(.system(size: 40, weight: .black))
                                    .foregroundColor(Color("waterBlue"))
                                    .shadow(radius: 2)
                                    .padding(25)
                                    .background(Color.white, in: Circle())
                            }
                            .offset(y: 40)
                        }
                }
                .frame(width: size.width, height: size.height, alignment: .center)
                .onAppear {
                    // MARK: Looping Animation
                    withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                        startAnimation = size.width + 10
                    }
                }
            }
            .frame(height: 350)
            
            Slider(value: $progress)
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

struct WaterWave: Shape {
    var progress: CGFloat
    var waveHeight: CGFloat
    
    // Initial Animation Start
    var offset: CGFloat
    var animatableData: CGFloat {
        get{ offset }
        set{ offset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.move(to: .zero)
            
            // MARK: Draw Waves utilizing Sine
            let progressHeight: CGFloat = (1 - progress) * rect.height
            let height = waveHeight * rect.height
            
            for value in stride(from: 0, to: rect.width, by: 2) {
                let x: CGFloat = value
                let sine: CGFloat = sin(Angle(degrees: value + offset).radians)
                let y: CGFloat = progressHeight + (height * sine)
                
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            // Bottom Portion
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}
