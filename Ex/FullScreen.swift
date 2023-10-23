//
//  AsyncCanvas.swift
//  Ex
//
//  Created by Константин Лопаткин on 23.10.2023.
//

import SwiftUI

struct FullScreen: View {
    @State var show = false
    @State var fullScreen = false
    var body: some View {
        NavigationStack {
            VStack {
                Button("show") {
                    show.toggle()
                }
                .buttonStyle(.borderedProminent)
                .fullScreenCover(isPresented: $show) {
                    Group {
                        if fullScreen {
                            VStack {
                                Button("dismiss") {
                                    show.toggle()
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .background(Color.white)
                            .onDisappear {
                                fullScreen = false
                            }
                            .transition(.move(edge: .trailing))
                        }
                    }
                    .onAppear {
                        fullScreen = true
                    }
                }
            }
            .preferredColorScheme(.dark)
            .transaction({ transaction in
                transaction.disablesAnimations = !fullScreen
                transaction.animation = .easeInOut
        })
            .navigationTitle("FullscreenCover")
        }
    }
    
}

#Preview {
    FullScreen()
}
