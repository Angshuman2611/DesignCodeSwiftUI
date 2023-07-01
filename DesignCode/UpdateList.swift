//
//  UpdateList.swift
//  DesignCode
//
//  Created by Angshuman Das on 01/07/23.
//

import SwiftUI

struct UpdateList: View {
    
    @ObservedObject var store = UpdateStore()
    
    func addUpdate() {
        store.updates.append(
            Update(
                image: "Card1",
                title: "New Item",
                text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
                date: "5 Nov"
            )
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { updates in
                    NavigationLink(destination: UpdateDetail(update: updates)) {
                        HStack {
                            Image(updates.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(.black)
                                .cornerRadius(20)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(updates.title)
                                    .font(.system(size: 20, weight: .bold))
                                
                                Text(updates.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color.gray)
                                
                                Text(updates.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                                    
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { value in
                    guard let index = value.first else { return }
                    self.store.updates.remove(at: index)
                }
                .onMove { (source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle(Text("Updates"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        addUpdate()
                    } label: {
                        Text("Add Update")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
            
        }
        
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(
        image: "Card1",
        title: "SwiftUI Advance",
        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
        date: "5 Nov"
    ),
    Update(
        image: "Card2",
        title: "Webflow",
        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
        date: "5 Nov"
    ),
    Update(
        image: "Card3",
        title: "Protopie",
        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
        date: "5 Nov"
    ),
    Update(
        image: "Card4",
        title: "SwiftUI",
        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
        date: "5 Nov"
    ),
    Update(
        image: "Card5",
        title: "Framer playground",
        text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
        date: "5 Nov"
    )
]
