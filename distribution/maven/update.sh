#!/usr/bin/env bash
#
# GRAKN.AI - THE KNOWLEDGE GRAPH
# Copyright (C) 2018 Grakn Labs Ltd
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#

# Script for updating Maven dependencies after the dependency list in //dependencies/maven/dependencies.yaml.

[[ $(readlink $0) ]] && path=$(readlink $0) || path=$0
WORKSPACE_HOME=$(cd "$(dirname "${path}")" && pwd -P)/../../
pushd "$WORKSPACE_HOME" > /dev/null

bazel build //distribution/maven:rules
install -m 644 $(bazel info bazel-genfiles)/distribution/maven/rules.bzl $WORKSPACE_HOME/distribution/maven/rules.bzl

popd > /dev/null