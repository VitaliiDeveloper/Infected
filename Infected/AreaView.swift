//
//  AreaView.swift
//  Infected
//
//  Created by marko on 9/26/20.
//

import SwiftUI

struct AreaView: View {

    let area: Area

    var body: some View {
        Section(header: Header(text: area.name)) {
            RowView(
                representation: .cases,
                dailyNumber: area.latest.cases ?? 0,
                totalNumber: area.total.cases ?? 0,
                trendNumber: area.casesDifferenceToPreviousDay ?? 0
            )
            RowView(
                representation: .hospitalizations,
                dailyNumber: area.latest.hospitalizations ?? 0,
                totalNumber: area.total.hospitalizations ?? 0,
                trendNumber: area.hospitalizationsDifferenceToPreviousDay ?? 0
            )
            RowView(
                representation: .deaths,
                dailyNumber: area.latest.deaths ?? 0,
                totalNumber: area.total.deaths ?? 0,
                trendNumber: area.deathsDifferenceToPreviousDay ?? 0
            )
        }
        .textCase(.none)
    }

    struct Header: View {
        let text: String

        var body: some View {
            Text(text.capitalized)
                .font(.title2).bold()
                .foregroundColor(.primary)
        }
    }

}

struct DaySectionView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            AreaView(area: NationalNumbers.random)
            AreaView(area: NationalNumbers.demo)
        }
        .listStyle(InsetGroupedListStyle())
        .previewLayout(.sizeThatFits)
    }
}
