//
//  SortedProspectsView.swift
//  HotProspects
//
//  Created by csuftitan on 5/11/24.
//

import SwiftUI

struct SortedProspectsView: View {
    let filter: ProspectsView.FilterType
    @State private var sortOrder = [SortDescriptor(\Prospect.name)]
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ProspectsView(filter: filter, sort: sortOrder)
                .searchable(text: $searchText)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Menu("Sort", systemImage: "arrow.up.arrow.down") {
                            Picker("Sort Order", selection: $sortOrder) {
                                Text("Date Added")
                                    .tag([SortDescriptor(\Prospect.dateAdded),
                                          SortDescriptor(\Prospect.name)
                                         ])
                                Text("Name")
                                    .tag([SortDescriptor(\Prospect.name),
                                          SortDescriptor(\Prospect.dateAdded)])
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    SortedProspectsView(filter: .none)
}
