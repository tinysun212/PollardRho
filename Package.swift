import PackageDescription

let package = Package(
	dependencies: [
		.Package(url: "../CGmp", majorVersion: 1)
	]
)

