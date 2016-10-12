import PackageDescription

let package = Package(
	name: "PollardRho",
	dependencies: [
		.Package(url: "https://github.com/tinysun212/GMP.git", majorVersion: 1)
	]
)

