//
//  LandmarkList.swift
//  landmark
//
//  Created by 황인규 on 10/21/21.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @SwiftUI.State private var showFavoritesOnly = false
    
    var fillteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                ForEach(fillteredLandmarks) { landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)){
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
//        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id:\.self) {deviceName in
//            LandmarkList()
//                .previewDevice(PreviewDevice(rawValue: deviceName ))
//                .previewDisplayName(deviceName)
//
//        }
        LandmarkList()
            .environmentObject(ModelData())
    }
}
