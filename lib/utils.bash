#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/savi-lang/savi"
TOOL_NAME="savi"
TOOL_TEST="savi eval 'env.out.print(\"Savi is installed!\")'"

fail() {
  echo -e "asdf-$TOOL_NAME: $*"
  exit 1
}

# We support a limited set of platforms in our binary builds.
# Other platforms will need to build from source instead of using asdf.
if uname | grep -iq 'Linux'; then
  if uname -m | grep -iq 'x86_64'; then
    if getconf GNU_LIBC_VERSION > /dev/null 2>&1; then
      platform_triple='x86_64-unknown-linux-gnu'
    elif ldd --version 2>&1 | grep -iq musl; then
      platform_triple='x86_64-unknown-linux-musl'
    else
      fail "On Linux, the supported libc variants are: gnu, musl"
    fi
  else
    fail "On Linux, the only curently supported arch is: x86_64"
  fi
  # TODO: Add FreeBSD when binary builds for it are supported.
elif uname | grep -iq 'Darwin'; then
  if uname -m | grep -iq 'x86_64'; then
    platform_triple='x86_64-apple-macosx'
  else
    # TODO: Add arm64 (M1) when binary builds for it are supported.
    fail "On Darwin, the only curently supported arch is: x86_64"
  fi
else
  fail "The only supported operating systems are: Linux, Darwin"
fi

curl_opts=(-fsSL)

if [ -n "${GITHUB_API_TOKEN:-}" ]; then
  curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" |
    grep -o 'refs/tags/.*' | cut -d/ -f3-
}

list_all_versions() {
  list_github_tags
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  # TODO: Adapt the release URL convention for savi
  url="$GH_REPO/releases/download/${version}/${platform_triple}-savi.tar.gz"

  echo "* Downloading $TOOL_NAME release $version for $platform_triple..."
  curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-$TOOL_NAME supports release installs only"
  fi

  (
    mkdir -p "$install_path"
    cp -r "$ASDF_DOWNLOAD_PATH"/* "$install_path"

    local tool_cmd
    tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
    test -x "$install_path/bin/$tool_cmd" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "$TOOL_NAME $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing $TOOL_NAME $version."
  )
}
