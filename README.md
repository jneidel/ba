# ba

> Bachelors thesis on developing and evaluating methods for improving the usability of CLI apps

My bachelor thesis in German for my B.Sc. in Angewandte Informatik at HTW Berlin.
The formal title is: Entwicklung und Evaluation von Methoden zur Absenkung der
Nutzungsschwelle von Kommandozeilen-Interfaces.

- [PDF of the thesis](thesis.pdf)
- The associated app where I implemented the methods: [oraclett](https://github.com/jneidel/oraclett)

## Methods

A short run-down off the developed methods. For more detail, theoretical
background, sources and implementation notes see the thesis itself.

1. Use flags, if more than one argument is required.
2. Support all popular forms of version and help flags.
3. Offer relevant default values.
4. Query interactively if a parameter is missing.
5. Support natural language input.
6. Support (suggestive) error correction.
7. Use auto-completion for suggesting flags and subcommands.
8. Offer a menu-based interface.
9. Suggest other relevant (sub-) commandos to the user.

## Latex
### Dependencies

```sh
yay -S texlive-core texlive-latexextra minted biber
```

Additional packages: `csquotes lettrine enumitem minifp fancyhdr titling`

To install one:
```sh
tllocalmgr install NAME
sudo texhash
```

### Build

To build the thesis:

```sh
make
```

To build the slides:

```sh
make slides
```

For watch mode (rebuild on change) and other shenanigans check out the
[Makefile](Makefile).

## Bibliography management

I managed my bibliography with [pubs](https://github.com/pubs/pubs). I used it to:
- create the bibtex for biber from a DOI
- store the sources pdf file
- attach notes to the sources

See [my aliases](https://github.com/jneidel/dotfiles/blob/c62a8bf65285a27dd672ed0df6128be09544a977/.zsh/apps.zsh#L226) for usage.
