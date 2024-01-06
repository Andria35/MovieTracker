//
//  TVSeriesOnAirDetailsView.swift
//  MovieTracker
//
//  Created by Andria Inasaridze on 06.01.24.
//

import SwiftUI

struct TVSeriesOnAirDetailsView: View {
    
    // MARK: - Properties
    let id: Int
    // MARK: - Body
    var body: some View {
        Text("\(id)")
    }
}

#Preview {
    TVSeriesOnAirDetailsView(id: 5)
}
