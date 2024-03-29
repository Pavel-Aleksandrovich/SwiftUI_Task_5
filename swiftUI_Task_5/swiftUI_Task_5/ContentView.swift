//
//  ContentView.swift
//  swiftUI_Task_5
//
//  Created by pavel mishanin on 13/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var offset = CGSize.zero
    @State private var dragOffset = CGSize.zero
    
    var gesture: some Gesture {
        DragGesture()
            .onChanged { gesture in
                offset = CGSize(width: offset.width + gesture.translation.width - dragOffset.width,
                                height: offset.height + gesture.translation.height - dragOffset.height)
                dragOffset = gesture.translation
            }
            .onEnded { _ in
                dragOffset = .zero
            }
    }
    
    var rectangle: some View {
        Rectangle()
            .foregroundColor(.white)
            .blendMode(.difference)
            .overlay(Rectangle().blendMode(.hue))
            .overlay(Rectangle().foregroundStyle(.white).blendMode(.overlay))
            .overlay(Rectangle().foregroundStyle(.black).blendMode(.overlay))
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 12,
                    style: .continuous
                ))
            .frame(width: 100, height: 100)
            .offset(offset)
            .gesture(gesture)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Rectangle()
                    .foregroundStyle(.white)
                Rectangle()
                    .foregroundStyle(.pink)
                Rectangle()
                    .foregroundStyle(.yellow)
                Rectangle()
                    .foregroundStyle(.black)
            }
            .ignoresSafeArea()
            rectangle
        }
    }
}
