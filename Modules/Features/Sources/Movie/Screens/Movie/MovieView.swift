//
//  Copyright © 2023 Jakub Kiermasz. All rights reserved.
//

import SwiftUI

struct MovieView: View {

    // MARK: - Properties

    @ObservedObject private var viewModel: MovieViewModel

    // MARK: - Initialization

    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - View

    var body: some View {
        List {
            moviePoster(viewModel.content.imageURL)
                .frame(maxWidth: .infinity)
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.content.title)
                    .font(.title)
                Text(viewModel.content.date)
                    .font(.title3)
                Text(viewModel.content.description)
            }
        }
        .navigationTitle(viewModel.content.title)
    }

    // MARK: - Private

    private func moviePoster(_ url: URL) -> some View {
        AsyncImage(
            url: url,
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            },
            placeholder: {
                ProgressView()
            }
        )
        .frame(width: 150, height: 250)
    }

}
