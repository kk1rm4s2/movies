//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import SwiftUI

struct MoviesListView: View {

    // MARK: - Properties

    @ObservedObject private var viewModel: MoviesListViewModel

    // MARK: - Initialization

    init(viewModel: MoviesListViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View

    var body: some View {
        List {
            ForEach(1..<5) { item in
                Text("Item \(item)")
            }
        }
        .navigationTitle("Movies")
    }
}
