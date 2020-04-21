#!/usr/bin/env python

#
# GRAKN.AI - THE KNOWLEDGE GRAPH
# Copyright (C) 2020 Grakn Labs Ltd
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

import json
import sys

with open("{workspace_refs_json_path}") as f:
    workspace_refs = json.load(f)

tagged_deps = set("{tagged_deps}".split(','))
snapshot_dependencies = tagged_deps - set(workspace_refs['tags'])

if snapshot_dependencies:
    print('These dependencies are excepted to be declared by tag instead of commit: {}'.format(snapshot_dependencies))
    sys.exit(1)