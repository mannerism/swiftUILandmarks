//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Suk Yu on 2021/08/18.
//

import SwiftUI

@main
struct LandmarksApp: App {
  @StateObject private var modelData = ModelData()
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
