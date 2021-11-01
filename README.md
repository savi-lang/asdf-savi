<div align="center">

# asdf-savi [![Build](https://github.com/savi-lang/asdf-savi/actions/workflows/build.yml/badge.svg)](https://github.com/savi-lang/asdf-savi/actions/workflows/build.yml) [![Lint](https://github.com/savi-lang/asdf-savi/actions/workflows/lint.yml/badge.svg)](https://github.com/savi-lang/asdf-savi/actions/workflows/lint.yml)


[savi](https://github.com/savi-lang/savi) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add savi
# or
asdf plugin add savi https://github.com/savi-lang/asdf-savi.git
```

savi:

```shell
# Show all installable versions
asdf list-all savi

# Install specific version
asdf install savi latest

# Set a version globally (on your ~/.tool-versions file)
asdf global savi latest

# Now savi commands are available
savi eval 'env.out.print("Savi is installed!")'
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/savi-lang/asdf-savi/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Savi](https://github.com/savi-lang/)
