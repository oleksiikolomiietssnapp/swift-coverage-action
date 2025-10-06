import Foundation

#if canImport(FoundationModels)
import FoundationModels

guard CommandLine.arguments.count > 1,
      let coverage = Double(CommandLine.arguments[1]) else {
    print("No AI analysis available")
    exit(0)
}

let prompt = """
The code test coverage is \(String(format: "%.2f", coverage))%.
Provide a brief assessment (1-2 sentences) of this coverage percentage.
Focus on whether it's good, acceptable, or needs improvement.
"""

do {
    let session = LanguageModelSession()
    let response = try await session.respond(to: prompt)
    print(response.content)
} catch {
    print("AI analysis unavailable: \(error.localizedDescription)")
}
#else
print("AI analysis requires macOS 26+")
#endif
