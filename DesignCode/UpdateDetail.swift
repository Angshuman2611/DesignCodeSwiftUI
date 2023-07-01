//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by Angshuman Das on 01/07/23.
//

import SwiftUI

struct UpdateDetail: View {
    
    var update: Update = updateData[0]
    
    var body: some View {
        
        List {
            VStack {
                
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20, weight: .medium))
            }
            .navigationTitle(update.title)
        }
        .listStyle(.plain)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
