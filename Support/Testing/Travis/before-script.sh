#!/usr/bin/env bash
##
## Copyright (c) 2014-present, Facebook, Inc.
## All rights reserved.
##
## This source code is licensed under the University of Illinois/NCSA Open
## Source License found in the LICENSE file in the root directory of this
## source tree. An additional grant of patent rights can be found in the
## PATENTS file in the same directory.
##

top="$(git rev-parse --show-toplevel)"
source "$top/Support/Scripts/common.sh"

if [[ "$TARGET" = "Android-ARM" && -n "${LLDB_TESTS-}" ]]; then
  case "$(uname)" in
    "Linux")  platform_name="linux";;
    "Darwin") platform_name="macosx";;
  esac
  emulator="/tmp/android-sdk-${platform_name}/tools/emulator64-arm"

  "$emulator" -avd test -no-skin -no-audio -no-window &
  adb wait-for-device
fi
