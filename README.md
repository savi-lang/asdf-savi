<div align="center">

# asdf-savi [![Build](https://github.com/savi-lang/asdf-savi/actions/workflows/build.yml/badge.svg)](https://github.com/savi-lang/asdf-savi/actions/workflows/build.yml) [![Lint](https://github.com/savi-lang/asdf-savi/actions/workflows/lint.yml/badge.svg)](https://github.com/savi-lang/asdf-savi/actions/workflows/lint.yml)


[savi](https://github.com/savi-lang/savi) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.

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

Contributions are welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/savi-lang/asdf-savi/graphs/contributors)!
