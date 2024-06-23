//
//  ContentView.swift
//  PAGAnimationDemo
//
//  Created by shiyanjun on 2024/6/23.
//

import SwiftUI
import libpag

/// - 依赖包地址：https://github.com/libpag/pag-ios.git
struct ContentView: View {
    var body: some View {
        /// - 加载名为`example.pag`的文件
        PAGAnimationView(filePath: Bundle.main.path(forResource: "example", ofType: "pag")!)
            .ignoresSafeArea()
    }
}

struct PAGAnimationView: UIViewRepresentable {
    var filePath: String
    
    func makeUIView(context: Context) -> PAGView {
        let pagView = PAGView()
        if pagView.setPath(filePath) {
            pagView.play()
        } else {
            print("从路径加载PAG文件失败: \(filePath)")
        }
        return pagView
    }
    
    func updateUIView(_ uiView: PAGView, context: Context) {
        // This method can be used to update the view when SwiftUI state changes.
    }
}

#Preview {
    ContentView()
}
