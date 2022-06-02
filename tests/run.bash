#!/usr/bin/env bats

@test "first run" {
  repository=$(pwd)
  temporaryDirectory=$(mktemp -d)
  expected=$temporaryDirectory/expected
  cp -r ./tests/first-run/expected/. $expected
  cp -r ./dreck $expected/plugins
  mkdir -p $expected/plugins/html-minifier
  cp -r . $expected/plugins/html-minifier
  actual=$temporaryDirectory/actual
  cp -r ./tests/first-run/input/. $actual
  mkdir -p $actual/plugins/dreck
  cp -r ./dreck $actual/plugins
  mkdir -p $actual/plugins/html-minifier
  cp -r . $actual/plugins/html-minifier
  cd $actual

  make --file ./plugins/dreck/makefile

  rm -r $actual/plugins/html-minifier/node_modules $actual/plugins/html-minifier/npm-install-marker
  cd $repository
  diff --brief --recursive $actual $expected
  rm -rf $temporaryDirectory
}
