//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Suk Yu on 2021/08/18.
//

import SwiftUI

struct LandmarkList: View {
  // Because you use state properties to hold information that’s specific to a view and its subviews, you always create state as `private`.
  @State private var showFavoritesOnly = false
  @EnvironmentObject var modelData: ModelData
  
  var filteredLandmarks: [Landmark] {
    modelData.landmarks.filter { landmark in
      (!showFavoritesOnly || landmark.isFavorite)
    }
  }
  
  var body: some View {
    NavigationView {
      List {
        Toggle(isOn: $showFavoritesOnly) {
          Text("Favorites only")
        }
        
        ForEach(filteredLandmarks) { landmark in
          NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
            LandmarkRow(landmark: landmark)
          }
        }
      }
      .navigationTitle("Landmarks")
    }
  }
}

struct LandmarkList_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(["iPhone XS Max"], id: \.self) { deviceName in
      LandmarkList()
        .previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
        .environmentObject(ModelData())
    }
  }
}
