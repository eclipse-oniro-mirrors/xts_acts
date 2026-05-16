#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (c) 2023 Huawei Device Co., Ltd.
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

import shutil
import os
import sys
import argparse
import subprocess


def get_names(path: str, names: []):
    for file_name in os.listdir(path):
        full_path = os.path.join(path, file_name)
        if os.path.isfile(full_path):
            names.append(full_path)
        else:
            get_names(full_path, names)


def endswith_check(names: [], suffix: str):
    return any(name.endswith(suffix) for name in names)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--libPath", help="path of libs")
    parser.add_argument("--hapPath", help="path of haps")
    args = parser.parse_args()

    lib_names = []
    get_names(args.libPath, lib_names)

    hap_names = []
    get_names(args.hapPath, hap_names)

    libentry = endswith_check(lib_names, "libentry.so")
    assert libentry, "not found libentry.so"

    default_hap = endswith_check(hap_names, "entry-default.hap")
    assert default_hap, "not found entry-default.hap"


if __name__ == '__main__':
    sys.exit(main())