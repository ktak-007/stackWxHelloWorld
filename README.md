# Hello World in wxHaskell on top of Stack technology

This project appeared as part of my self-study by wxHaskell.
Instructions which I found described build process with Cabal.
I could not build any wxHaskell application with Cabal because wxHaskell libs is not compatible with modern Haskell.
The way out is to build application using Stack which lets to point lts (see the site https://www.stackage.org).
Lts-11.8 was the freshiest when I started and hello world was not build.
My helloWorld build is Ok with lts-9.21.

# How to install

1. Install Stack: https://docs.haskellstack.org/en/stable/install_and_upgrade/
2. Download sources of stackWxHelloWorld
3. Cnange dir to stackWxHelloWorld
4. Run setup `stack setup`. It will prepare appropriate lts for project
5. Run build `stack build`. It will build wxHaskell libs and project. You can run on-the-fly builder `stack build --file-watch` if you want to develop project.
6. Run the binary `stack exec stackWxHelloWorld`.
