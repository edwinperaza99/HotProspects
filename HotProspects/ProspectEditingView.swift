//
//  ProspectEditingView.swift
//  HotProspects
//
//  Created by Edwin on 5/10/24.
//

import SwiftData
import SwiftUI

struct ProspectEditingView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var prospect: Prospect
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    var body: some View {
        Form {
            Section("Name:") {
                TextField(prospect.name, text: $prospect.name)
            }
            Section("Email:"){
                TextField(prospect.emailAddress, text: $prospect.emailAddress)
            }
            Section("Contacted?"){
                Toggle(prospect.isContacted ? "Contacted" : "Not contacted", isOn: $prospect.isContacted)
            }
        }
        .navigationTitle("Edit Prospect")
        .alert("Delete prospect", isPresented: $showingDeleteAlert) {
             Button("Delete", role: .destructive, action: deleteProspect)
             Button("Cancel", role: .cancel) { }
         } message: {
             Text("Are you sure?")
         }
        .toolbar {
               ToolbarItem(placement: .navigationBarTrailing) {
                   Button("Save") {
                       dismiss()
                   }
               }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Delete this prospect", systemImage: "trash") {
                        showingDeleteAlert = true
                    }
                }
        }
    }
    func deleteProspect() {
        modelContext.delete(prospect)
        dismiss()
    }
}

#Preview {
    do {
       let config = ModelConfiguration(isStoredInMemoryOnly: true)
       let container = try ModelContainer(for: Prospect.self, configurations: config)
        let example = Prospect(name: "Edwin", emailAddress: "Edwin@gmail.com", isContacted: false)

       return ProspectEditingView(prospect: example)
           .modelContainer(container)
  } catch {
       return Text("Failed to create preview: \(error.localizedDescription)")
  }
}
