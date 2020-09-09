:
wasm_build_kit(){
    set -x -e
    #IMAGE=zloymult/wasm-build-kit
    IMAGE=wasm-build-kit:2020-09-03
    WORKDIR="${WORKDIR-$(pwd)}"
    mkdir -p "$HOME/.rustup" "$HOME/.cargo"
    exec docker run --name wasm-build-kit -it --rm \
        -u $(id -u):$(id -g) \
        -v /etc/localtime:/etc/localtime:ro \
        -v $(pwd):$(pwd) \
        -w "$WORKDIR" \
        -e "USER=$(whoami)" \
        "$IMAGE" \
        "$@"
}
return 0 >/dev/null 2>&1
wasm_build_kit "$@"
