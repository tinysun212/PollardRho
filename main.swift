import CGmp

func factor(inout n: mpz_t) {
	var x_fixed = mpz_t()
	var x = mpz_t()
	var t = mpz_t()
	var diff = mpz_t()
	var cycle_size = mpz_t()
	var cycle_idx = mpz_t()
	__gmpz_init(&t)
	__gmpz_init(&diff)
	
	// x_fixed = 2
	__gmpz_init_set_ui(&x_fixed, 2)
	// x = 2
	__gmpz_init_set_ui(&x, 2)
	// cycle_size = 2
	__gmpz_init_set_ui(&cycle_size, 2)
	
	while true {
		guard let cycle_size_string = String.fromCString(__gmpz_get_str(nil, 10, &cycle_size)) else {
			fatalError("Could not get result")
		}
		print("cycle_size=\(cycle_size_string)")
		// for _ in 1 ... cycle_size {
		__gmpz_init_set_ui(&cycle_idx, 1)
		while true {
			let condition = __gmpz_cmp(&cycle_idx, &cycle_size)	
			if (condition > 0) {
				break
			}
			// x = (x*x+1) % n
			__gmpz_mul(&x, &x, &x)
			__gmpz_add_ui(&x, &x, 1)
			__gmpz_mod(&x, &x, &n)
			// t = gcd(x - x_fixed, n)
			__gmpz_sub(&diff, &x, &x_fixed)
			__gmpz_gcd(&t, &diff, &n)
			// if (t > 1)
			let cmp = __gmpz_cmp_ui(&t, 1)
			if (cmp > 0) {
				guard let result = String.fromCString(__gmpz_get_str(nil, 10, &t)) else {
					fatalError("Could not get result")
				}
			    print("\(result)")
			//  exit
				return
			}
			__gmpz_add_ui(&cycle_idx, &cycle_idx, 1)
		}
		// cycle_size = cycle_size * 2
		__gmpz_mul_ui(&cycle_size, &cycle_size, 2)
		// x_fixed = x
		__gmpz_set(&x_fixed, &x)
	}
}

// n = pow(2,256)+1
var n = mpz_t()
__gmpz_init(&n)
__gmpz_ui_pow_ui(&n, 2, 256)
__gmpz_add_ui(&n, &n, 1)
factor(&n)

