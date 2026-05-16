#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) 2025 Huawei Device Co., Ltd.
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

import os
import subprocess
import argparse


def main():
  parser = argparse.ArgumentParser()
  parser.add_argument('--root-path', required = True)
  parser.add_argument('--output', required = True)
  args = parser.parse_args()

  root_path = args.root_path
  jsvm_test_path = os.path.join(
      root_path, 'commonlibrary/ark_runtime/ark_runtime_jsvm_test/')
  jsvm_test_jitless_path = os.path.join(
      root_path, 'commonlibrary/ark_runtime/ark_runtime_jsvm_test_jitless/')

  if os.path.exists(root_path):
    subprocess.run([
        'cp', '-rf',
        os.path.join(jsvm_test_path, 'entry/src/ohosTest/ets'),
        os.path.join(jsvm_test_jitless_path, 'entry/src/ohosTest/')
    ])
    subprocess.run([
        'cp', '-rf',
        os.path.join(jsvm_test_path, 'entry/src/main/ets'),
        os.path.join(jsvm_test_jitless_path, 'entry/src/main/')
    ])
    subprocess.run([
        'cp', '-rf',
        os.path.join(jsvm_test_path, 'entry/src/main/MainAbility'),
        os.path.join(jsvm_test_jitless_path, 'entry/src/main/')
    ])

    with open(args.output, 'w') as f:
      f.write('done')


if __name__ == '__main__':
  main()
