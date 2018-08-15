#!/usr/bin/env bash

#
# Copyright 2018 Thomas Boerger <thomas@webhippie.de>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -eo pipefail

if ! hash ghi 2>/dev/null; then
    echo "failed to find ghi, please install that first!"
    exit 1
fi

repos=(
    homebrew-gopad
    gopad-ui
    gopad-api
    gopad-cli
    gopad-docs
    gopad-scripts
    gopad-android
    gopad-ios
    gopad-go
    gopad-js
    gopad-php
    gopad-python
    gopad-ruby
    gopad-infra
)

labels=(
    bug:fc2929
    duplicate:cccccc
    enhancement:84b6eb
    hacktoberfest:d4c5f9
    help\ wanted:159818
    in\ progress:ededed
    infra:006b75
    invalid:e6e6e6
    lint:fbca04
    poc:c2e0c6
    question:cc317c
    ready:ededed
    third-party:e99695
    translation:b60205
    wontfix:5319e7
)

for repo in "${repos[@]}"; do
    echo "> updating ${repo} labels"

    for label in "${labels[@]}"; do
        title="${label%%:*}"
        color="${label##*:}"

        ghi label -a -c "${color}" "${title}" -- "gopad/${repo}"
    done
done
