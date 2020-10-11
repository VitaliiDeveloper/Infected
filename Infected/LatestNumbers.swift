//
//  LatestNumbers.swift
//  Infected
//
//  Created by marko on 10/11/20.
//

import Foundation

struct LatestNumbers {

    let date: Date
    let cases: Int?
    let hospitalizations: Int?
    let deaths: Int?
    let previousDayCases: Int?
    let previousDayHospitalizations: Int?
    let previousDayDeaths: Int?
    let totalCases: Int?
    let totalHospitalizations: Int?
    let totalDeaths: Int?

}

extension LatestNumbers {

    var casesDifference: Int? {
        guard let cases = cases, let previousDayCases = previousDayCases else {
            return nil
        }
        return cases - previousDayCases
    }

    var hospitalizationsDifference: Int? {
        guard let hospitalizations = hospitalizations, let previousDayHospitalizations = previousDayHospitalizations else {
            return nil
        }
        return hospitalizations - previousDayHospitalizations
    }

    var deathsDifference: Int? {
        guard let deaths = deaths, let previousDayDeaths = previousDayDeaths else {
            return nil
        }
        return deaths - previousDayDeaths
    }

    static var demo: LatestNumbers {
        LatestNumbers(date: Date(),
                      cases: 123,
                      hospitalizations: 45,
                      deaths: 6,
                      previousDayCases: 78,
                      previousDayHospitalizations: 9,
                      previousDayDeaths: 0,
                      totalCases: 123456,
                      totalHospitalizations: 78901, totalDeaths: 23456
        )
    }

}