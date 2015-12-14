import PackageDescription

let package = Package(
	dependencies: [
		.Package(url: "../CGMP", majorVersion: 1)
	]
)

