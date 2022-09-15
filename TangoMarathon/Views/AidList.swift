//
//  AidList.swift
//  TangoMarathon
//
//  Created by 竹田智哉 on 2022/09/15.
//

import SwiftUI

struct AidList: View {
    var body: some View {
        NavigationView {
            List(aids) { aid in
                NavigationLink {
                    AidDetail(aid: aid)
                } label: {
                    HStack {
                        Text(aid.dist.fromStart.description)

                        Text(aid.name)
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("ウルトラマラソン")
        }
    }
}

struct AidList_Previews: PreviewProvider {
    static var previews: some View {
        AidList()
    }
}
