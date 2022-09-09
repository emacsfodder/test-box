# Test-box [![Emacs Test Box](https://github.com/emacsfodder/test-box/actions/workflows/test-box.yml/badge.svg)](https://github.com/emacsfodder/test-box/actions/workflows/test-box.yml)

A space used for running compatibility tests on different Emacs versions.  Also a reasonable template for setting up CI testing for an Emacs Package.

# Usage

Setup at least one test in [`scratch.el`](./scratch.el), commit and let github give you test results.

# Emacs Versions tested against...

- [x] 24.1
- [x] 24.2
- [x] 24.3
- [x] 24.4
- [x] 24.5
- [x] 25.1
- [x] 25.2
- [x] 25.3
- [x] 26.1
- [x] 26.2
- [x] 26.3
- [x] 27.1
- [x] 27.2
- [x] 28.1
- [x] snapshot (29.1 currently)

Add tests / functions to `./scratch.el`.  

Github Workflows actions will test using [purcell/setup-emacs](https://github.com/purcell/setup-emacs)
