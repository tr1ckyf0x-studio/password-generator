import ArgumentParser

@main
struct PasswordGeneratorCommand: ParsableCommand {

    @Option(name: [.short, .long], help: "Length of the password")
    var length: UInt

    func run() throws {
        let passwordGenerator = PasswordGenerator()
        let password = passwordGenerator.generatePassword(
            symbolTypes: [.lowerCaseLetters, .upperCaseLetters, .numbers, .specialSymbols],
            length: length
        )

        print(password)
    }
}
