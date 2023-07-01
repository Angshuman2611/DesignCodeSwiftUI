//
//  HomeView.swift
//  DesignCode
//
//  Created by Angshuman Das on 01/07/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showProfile: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Watching")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile) // $ sign is due to binding value
            }
            .padding(.horizontal)
            .padding(.leading, 14)
            .padding(.top, 30)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20), axis: (x: 0, y: 10, z: 0))
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    
    var section: Section
    
    var body: some View {
        VStack {
            HStack {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(section.logo)
            }
            
            
            Text(section.subTitle.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var subTitle: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(
        title: "Prototype design in SwiftUI",
        subTitle: "18 Sections",
        logo: "Logo1",
        image:  Image("Card1"),
        color: Color("card1")
    ),
    Section(
        title: "Prototype design in SwiftUI",
        subTitle: "18 Sections",
        logo: "Logo1",
        image:  Image("Card1"),
        color: Color("card4")
    ),
    Section(
        title: "Prototype design in SwiftUI",
        subTitle: "18 Sections",
        logo: "Logo1",
        image:  Image(uiImage: #imageLiteral(resourceName: "Card4")),
        color: Color("card2")
    ),
    Section(
        title: "Prototype design in SwiftUI",
        subTitle: "18 Sections",
        logo: "Logo1",
        image:  Image(uiImage: #imageLiteral(resourceName: "Card5")),
        color: Color("card3")
    )
]
