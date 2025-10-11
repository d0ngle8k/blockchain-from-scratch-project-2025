# Code Map

A quick index of the SHA-256 animation codebase: key files, what they do, and important functions.

## Top-level scripts

- `sha256.rb`
  - Main animation driver for a single SHA-256 hash.
  - Orchestrates: message -> padding -> blocks -> schedule -> initial -> compression (per block) -> final.
  - CLI: `ruby sha256.rb <input> [enter|normal|fast|nodelay]`
  - Accepts: raw strings, `0b` binary, `0x` hex, or file paths.

- `hash256.rb`
  - Double-SHA256 driver (Bitcoin-style). Runs `sha256.rb` twice.
  - Assumes hex input (adds `0x` prefix if missing).

- `README.md`
  - Project overview and usage instructions.

## Core library (pure SHA-256 implementation)

- `sha256lib.rb`
  - Utilities
    - `bits(x, n = 32)` → String: unsigned binary representation (n bits)
    - `hex(i)` → String: 8-hex-char lowercase string
    - `bitstring(string)` → String: binary string for ASCII input
    - `delay(speed)` → sleep/step helper used by animations
    - `input_type(input)` → "file" | "binary" | "hex" | "string"
    - `bytes(input, type)` → Array<Integer>: bytes from input (bin/hex/ascii)
  - Operations (32-bit words)
    - `add(*x)` → Integer: sum mod 2^32
    - `rotr(n, x)` → Integer: rotate right
    - `shr(n, x)` → Integer: logical shift right
  - SHA-256 functions
    - `sigma0(x)`  → ROTR 7,18; SHR 3
    - `sigma1(x)`  → ROTR 17,19; SHR 10
    - `usigma0(x)` → ROTR 2,13,22
    - `usigma1(x)` → ROTR 6,11,25
    - `ch(x,y,z)`  → (x & y) ^ (~x & z)
    - `maj(x,y,z)` → (x & y) ^ (x & z) ^ (y & z)
  - Preprocessing
    - `padding(message)` → String: MD-strengthened padding to multiple of 512 bits
    - `split(message, size = 512)` → Array<String>: chunk message
  - Message schedule & compression
    - `calculate_schedule(block)` → Array<Integer>: 64-word Wt
    - `K` (Array<Integer>): 64 constants (cube roots of first 64 primes)
    - `IV` (Array<Integer>): 8 initial hash values (square roots of first 8 primes)
    - `compression(initial, schedule, constants)` → Array<Integer>: updated hash state
  - Top-level
    - `sha256(string)` → String: 64-hex-char digest

## Animation steps (by stage)

- Preprocessing and structure
  - `message.rb`  — Shows input, bytes, and binary message.
  - `padding.rb`  — Visualizes MD-strengthening padding and bit lengths.
  - `blocks.rb`   — Splits padded message into 512-bit blocks.

- Schedule and constants
  - `schedule.rb`   — Builds and animates the 64-word message schedule W0..W63.
  - `expansion.rb`  — Focused animation for expanding W16..W63 using σ0/σ1.
  - `constants.rb`  — Visualizes deriving K constants from cube roots of primes.

- Compression (per-block state updates)
  - `initial.rb`     — Shows deriving initial hash values (IV) and bit forms.
  - `compression.rb` — Full round function across Wt and Kt, updates a..h, adds to H.
  - `t1.rb`          — Focused animation for T1 = Σ1(e) + Ch(e,f,g) + h + Kt + Wt.
  - `t2.rb`          — Focused animation for T2 = Σ0(a) + Maj(a,b,c).
  - `final.rb`       — Shows final H values and concatenated hex digest.

- Primitive operation demos (standalone)
  - `shr.rb`     — Shift right animation; also defines `shr(n,x)` for the demo.
  - `rotr.rb`    — Rotate right animation; also defines `rotr(n,x)` for the demo.
  - `xor.rb`     — XOR showcase across multiple inputs; includes an internal `rotr` for demo.
  - `add.rb`     — 32-bit modular addition visualization.
  - `sigma0.rb`  — σ0(x) animation using ROTR/SHR.
  - `sigma1.rb`  — σ1(x) animation using ROTR/SHR.
  - `usigma0.rb` — Σ0(x) animation using ROTR.
  - `usigma1.rb` — Σ1(x) animation using ROTR.
  - `ch.rb`      — Choice function animation.
  - `maj.rb`     — Majority function animation.

## Images

- `images/` — GIFs used in README and as conceptual references for each step.

## Quick symbol reference (by file)

- `sha256lib.rb`: bits, hex, bitstring, delay, input_type, bytes, add, rotr, shr, sigma0, sigma1, usigma0, usigma1, ch, maj, padding, split, calculate_schedule, K, IV, compression, sha256
- `sha256.rb`: orchestrating script (uses globals: $input, $delay, $type, $bytes, $message, $blocks, $block, $block_number, $hash, $state, $digest)
- `hash256.rb`: double-hash orchestrator
- `message.rb`: animation only
- `padding.rb`: animation only
- `blocks.rb`: animation only
- `schedule.rb`: builds `$schedule` (Array<Integer>) and updates `$state`
- `expansion.rb`: focused Wt expansion demo
- `initial.rb`: IV derivation animation
- `compression.rb`: main round animation; updates `$hash`
- `final.rb`: produces `$digest` (hex digest string)
- `constants.rb`: K derivation animation
- `shr.rb`, `rotr.rb`, `xor.rb`, `add.rb`, `sigma0.rb`, `sigma1.rb`, `usigma0.rb`, `usigma1.rb`, `ch.rb`, `maj.rb`: standalone operation/function demos

## Notes

- All pure algorithmic logic lives in `sha256lib.rb`. The other Ruby files are for terminal animations and demos.
- Many animation scripts rely on shared global variables (`$input`, `$message`, `$padded`, `$blocks`, `$schedule`, `$hash`, `$state`, `$digest`).
- Use `sha256.rb` for animated hashing; use `hash256.rb` for double SHA-256; or call `sha256(string)` from `sha256lib.rb` in your own scripts for a non-animated hash.
