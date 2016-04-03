1. You must have bash installed and it should be on your path.
2. If you get package/file not found errors, try `M-x package-install use-package` and then restart emacs.
3. To use flycheck (on-the-fly syntax checker) in C or C++ mode you must install LLVM.
4. To use autocompletion in python-mode you must `pip install jedi virtualenv`, then run `M-x jedi:install-server` after Emacs loads.
5. To choose a color theme run `M-x customize-themes` I personally am fond of tango-dark.