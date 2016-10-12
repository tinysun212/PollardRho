import GMP

func factor(n: GMP) {
	let t = GMP()
	let diff = GMP()
	let cycle_idx = GMP()
	
	// x_fixed = 2
	let x_fixed = GMP(n:2)
	// x = 2
	let x = GMP(n:2)
	// cycle_size = 2
	let cycle_size = GMP(n:2)
	
	while true {
		let cycle_size_string = cycle_size.toString()
		print("cycle_size=\(cycle_size_string)")

		// for _ in 1 ... cycle_size {
		cycle_idx.setValue(n: 1)
		while true {
			let condition = cycle_idx.compare(v2:cycle_size)
			if (condition > 0) {
				break
			}

			// x = (x*x+1) % n
			x.mul(n:x)
			x.add(n:1)
			x.mod(n:n)

			// t = gcd(x - x_fixed, n)
			diff.assignSub(v1:x, v2:x_fixed)
			t.assignGCD(v1:diff, v2:n)

			// if (t > 1)
			let cmp = t.compare(n:1)
			if (cmp > 0) {
				let result = t.toString()
			    print("\(result)")
				return
			}

			cycle_idx.add(n: 1)
		}

		// cycle_size = cycle_size * 2
		cycle_size.mul(n:2)

		// x_fixed = x
		x_fixed.set(n: x)
	}
}

// n = pow(2,256)+1
let n = GMP()
n.assignPow(base:2, p:256)
//n.assignPow(base:2, p:64)
n.add(n: 1)
factor(n: n)

