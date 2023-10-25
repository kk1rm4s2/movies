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
        Group {
            switch viewModel.content {
            case .loading:
                loadingContent()
            case .list(let items):
                listContent(items: items)
            }
        }
        .navigationTitle("Movies")
        .onAppear { viewModel.onAppear() }
    }

    // MARK: - Private

    private func listContent(items: [MoviesListItem]) -> some View {
        List(items, id: \.self) { item in
            Button {
                viewModel.movieTapped(item.id)
            } label: {
                cell(for: item)
            }
            .buttonStyle(.plain)
            .contentShape(.interaction, Rectangle())
        }
    }

    private func loadingContent() -> some View {
        List(MoviesListView.placeholder, id: \.self) { item in
            cell(for: item)
        }
        .redacted(reason: .placeholder)
        .disabled(true)
    }

    private func cell(for item: MoviesListItem) -> some View {
        HStack(alignment: .top) {
            if let url = item.imageURL {
                moviePoster(url)
            }
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                Text(item.date)
            }
        }
    }

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
        .frame(width: 100, height: 150)
    }

}

extension MoviesListView {

    fileprivate static let placeholder: [MoviesListItem] = [
        .init(id: 1, title: "lorem ipsum", date: "123", imageURL: nil),
        .init(id: 2, title: "lorem lorem ", date: "123", imageURL: nil),
        .init(id: 3, title: "ipsum ipsum ipsum", date: "121", imageURL: nil),
        .init(id: 4, title: "ipsum lorem ipsum", date: "123", imageURL: nil),
        .init(id: 5, title: "lorem ipsu", date: "12345", imageURL: nil),
        .init(id: 6, title: "lorem lor", date: "12363", imageURL: nil),
    ]

}
