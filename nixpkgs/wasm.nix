{ config, lib, pkgs, ...}:
{
  home.packages = with pkgs; [
    wabt
    wasmtime
    wasm-bindgen-cli
    wasm-pack
  ];
}
