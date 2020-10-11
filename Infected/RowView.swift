//
//  RowView.swift
//  Infected
//
//  Created by marko on 9/27/20.
//

import SwiftUI

struct RowView: View {
    let captionText: String?
    let value: Int?
    let diffValue: Int?

    private static let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    private static let differenceNumberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.positivePrefix = "+"
        formatter.negativePrefix = "-"
        return formatter
    }()

    var body: some View {
        VStack(alignment: .leading) {
            if let captionText = captionText {
                Text(captionText)
                    .font(Font.system(size: 12, weight: .regular))
                    .foregroundColor(.secondary)
            }
            HStack {
                Text(value.flatMap(Self.numberFormatter.string) ?? "--")
                    .font(Font.system(size: 17, weight: .regular))
                if let diffNumber = diffValue {
                    Spacer()
                    HStack {
                        Text(Self.differenceNumberFormatter.string(from: NSNumber(value: diffNumber)) ?? "--")
                        Image(systemName: diffNumber.imageName)
                    }
                    .foregroundColor(diffNumber.color)
                }
            }
        }
    }

}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RowView(captionText: "This", value: 23904823, diffValue: 3724)
            RowView(captionText: nil, value: nil, diffValue: nil)
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

private extension Int {

    var imageName: String {
        switch signum() {
        case -1:
            return "arrow.down.square.fill"
        case 0:
            return "minus.square.fill"
        case 1:
            return "arrow.up.square.fill"
        default:
            fatalError()
        }
    }

    var color: Color {
        switch signum() {
        case -1:
            return .green
        case 0:
            return .orange
        case 1:
            return .red
        default:
            fatalError()
        }
    }

}
