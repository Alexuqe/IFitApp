    //
    //  Model.swift
    //  IFitApp
    //
    //  Created by Sasha on 20.11.24.
    //
import Foundation


struct LoginedApp {
    let nameApp: String
    let id = UUID()
    let textOnScreen: [ScreenData]
    let typesOfTraine: [TypeTraine]
    let slogan: String

    static func getAllLoginedApps() -> [LoginedApp] {
        TypeTraine.allCases.map { LoginedApp(typeTraine: $0) }
    }

    init(typeTraine: TypeTraine) {
        let localDB = LocalDatabase.shared

        self.nameApp = localDB.trainingDescriptions[.login]?["headerText"] ?? "IFit"
        self.slogan = localDB.trainingDescriptions[.login]?["bodyText"] ?? "Everybody"
        self.typesOfTraine = [typeTraine]

            // Фильтруем ScreenData для конкретного типа тренировки
        self.textOnScreen = ScreenData.getArray().filter { $0.type == typeTraine }
    }
}

struct ScreenData {
    let type: TypeTraine
    let text: TextOnAScreen

    static func getArray() -> [ScreenData] {
        let localDB = LocalDatabase.shared

        return TypeTraine.allCases.map { trainType in
            let headerText = localDB.trainingDescriptions[trainType]?["headerText"] ?? ""
            let bodyText = localDB.trainingDescriptions[trainType]?["bodyText"] ?? ""
            let image = localDB.trainingDescriptions[trainType]?["imageName"] ?? ""

            return ScreenData(
                type: trainType,
                text: TextOnAScreen(
                    headerText: headerText,
                    bodyText: bodyText,
                    image: image
                )
            )
        }
    }
}

enum TypeTraine: CaseIterable {
    case track, burn, eat, sleep, login
}

struct TextOnAScreen {
    let headerText: String
    let bodyText: String
    let image: String
}






struct User {
    let id = UUID()
    let login: String
    let password: String
    let person: Person

    static func getUser() -> User {
        User(
            login: "user@mail.ru",
            password: "Tel214383411!",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let photo: String
    let bio: String
    let job: Company

    var fullName: String {
        "\(name) \(surname)"
    }

    static func getPerson() -> Person {
        Person(
            name: "",
            surname: "",
            photo: "",
            bio: "",
            job: Company.getCompany()
        )
    }
}

struct Company {
    let title: String
    let jobTitle: JobTitle
    let department: Department

    static func getCompany() -> Company {
        Company(
            title: "",
            jobTitle: .ceo,
            department: .management
        )
    }
}

enum JobTitle: String {
    case ceo = "2"
    case cto = "1"
}

enum Department: String {
    case management = "1"
    case marketing = "3"
}

