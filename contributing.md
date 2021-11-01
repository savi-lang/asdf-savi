# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

#
asdf plugin test savi https://github.com/savi-lang/asdf-savi.git "savi eval 'env.out.print("Savi is installed!")'"
```

Tests are automatically run in GitHub Actions on push and PR.
