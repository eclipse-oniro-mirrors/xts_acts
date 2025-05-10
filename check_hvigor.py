#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Copyright (c) 2020-2021 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""

import os
import sys
import subprocess
import hashlib
import json5


def get_file_md5(file_path):
    hash_md5 = hashlib.md5()
    with open(file_path, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()


def get_hvigor_version(json_file):
    with open(json_file, 'r') as f:
        data = json5.load(f)
        return data.get('hvigorVersion')
    return "0.0.0"


def output_unmatched_project(prject_list, filename):
    print("")
    print(
        "Error: The {} in the following directory does not meet the requirements:"
        .format(filename))
    for prj in prject_list:
        print(prj[0], prj[1])
    print("")


def check_hvigor_wrapper_js(acts_root_dir, hvigor_prj_list):
    unmatch_info = []
    baseline_file = os.path.join(acts_root_dir, 'arkcompiler/ecmanewfeatures/hvigor/hvigor-wrapper.js')
    baseline_md5 = get_file_md5(os.path.join(baseline_file))
    for dir in hvigor_prj_list:
        filename = os.path.join(dir, 'hvigor', 'hvigor-wrapper.js')
        md5 = get_file_md5(filename)
        if md5 != baseline_md5:
            unmatch_info.append((md5, filename))

    if len(unmatch_info):
        output_unmatched_project(unmatch_info, 'hvigor-wrapper.js')
        print('Please copy from {}'.format(baseline_file))
        return False
    return True

def check_hvigor_version(hvigor_prj_list):
    unmatch_prj_list = []
    baseline_version = '4.0.5'
    for dir in hvigor_prj_list:
        filename = os.path.join(dir, 'hvigor', 'hvigor-config.json5')
        version = get_hvigor_version(filename)
        if version != baseline_version:
            unmatch_prj_list.append((version, filename))

    if len(unmatch_prj_list):
        output_unmatched_project(unmatch_prj_list, 'hvigor-config.json5')
        print("Plesse use {}".format(baseline_version))
        return False
    return True

def check_hvigorw_bat(acts_root_dir, hvigor_prj_list):
    unmatch_info = []
    baseline_file = os.path.join(acts_root_dir, 'arkcompiler/ecmanewfeatures/hvigorw.bat')
    baseline_md5 = get_file_md5(os.path.join(baseline_file))
    for dir in hvigor_prj_list:
        filename = os.path.join(dir, 'hvigorw.bat')
        md5 = get_file_md5(filename)
        if md5 != baseline_md5:
            unmatch_info.append((md5, filename))

    if len(unmatch_info):
        output_unmatched_project(unmatch_info, 'hvigorw.bat')
        print('Please copy from {}'.format(baseline_file))
        return False
    return True


def get_hvigor_prject_list(directory):
    hvigor_prj_list = []
    for root, dirs, files in os.walk(directory):
        if '.cxx' in dirs:
            dirs.remove('.cxx')
        for dir in dirs:
            if dir == 'hvigor':
                hvigor_prj_list.append(root)
    return hvigor_prj_list


if __name__ == "__main__":
    this_file = os.path.realpath(__file__)
    acts_root_dir = os.path.dirname(this_file)
    hvigor_prj_list = get_hvigor_prject_list(acts_root_dir)

    js_valid = check_hvigor_wrapper_js(acts_root_dir, hvigor_prj_list)
    json_valid = check_hvigor_version(hvigor_prj_list)
    bat_valid = check_hvigorw_bat(acts_root_dir, hvigor_prj_list)

    if not js_valid or not json_valid or not bat_valid:
        sys.exit(1)

    sys.exit(0)