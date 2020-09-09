#
build:	fractal-opt.wasm fractal-opt.wat fractal-em.js

fractal.wasm:	fractal.c interp.c fractal-test interp-test
	bash wasm_hands_on/wasm-build-kit.bash \
	    clang --target=wasm32 -O3 -flto -nostdlib -Wl,--no-entry -Wl,--export-all -Wl,--lto-O3 \
	        -o fractal.wasm fractal.c interp.c

fractal-opt.wasm:	fractal.wasm
	bash wasm_hands_on/wasm-build-kit.bash \
	    wasm-opt -Os fractal.wasm -o fractal-opt.wasm

fractal-opt.wat:	fractal-opt.wasm
	bash wasm_hands_on/wasm-build-kit.bash \
	    wasm2wat fractal-opt.wasm > fractal-opt.wat

fractal-test:	.FORCE
	bash wasm_hands_on/wasm-build-kit.bash \
	    clang -DTEST_FRACTAL_C -g -Wall -Wpedantic -o .fractal.exe fractal.c && ./.fractal.exe

interp-test:	.FORCE
	bash wasm_hands_on/wasm-build-kit.bash \
	    clang -DTEST_INTERP_C -g -Wall -Wpedantic -o .interp.exe interp.c fractal.c && ./.interp.exe

fractal-em.js: fractal.c interp.c
	bash wasm_hands_on/wasm-build-kit.bash \
		emcc fractal.c interp.c -O3 -flto -Wl,--lto-O3 -o fractal-em.js \
		-s EXPORTED_FUNCTIONS='["_c_fractal", "_c_interp", "_malloc", "_free"]' \
		-s EXPORTED_RUNTIME_METHODS='["ccall"]' \
		-s MODULARIZE=1

.FORCE:
.PHONY: .FORCE fractal-test interp-test
