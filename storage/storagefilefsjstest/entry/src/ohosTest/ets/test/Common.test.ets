/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import fs from '@ohos.file.fs';
import util from '@ohos.util';
import buffer from '@ohos.buffer';

export const FILE_CONTENT = 'hello world';

export function prepareFile(fpath: string, content: string) {
  try {
    let file = fs.openSync(fpath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE)
    fs.truncateSync(file.fd)
    fs.writeSync(file.fd, content)
    fs.fsyncSync(file.fd)
    fs.closeSync(file)
    return true
  }
  catch (e) {
    console.log('Failed to prepareFile for ' + e)
    return false
  }
}

export async function nextFileName(testName: string) {
  let BASE_PATH = testName + '_' + randomString(FILE_CONTENT.length);
  console.log('filefs_test nextFileName BASE_PATH: ' + BASE_PATH);
  return BASE_PATH;
}

export function randomString(num: number) {
  let len: number = num;
  let $chars = 'aaaabbbbcccc';
  let maxPos = $chars.length;
  let pwd = '';
  for (let i = 0; i < len; i++) {
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
  }
  console.log('filefs_test pwd: ' + pwd);
  return pwd;
}

function isIntNum(val: number) {
  return typeof val === 'number' && val % 1 === 0;
}

function isBigInt(val: bigint) {
  return typeof val === 'bigint';
}

function isString(str: string) {
  return (typeof str == 'string') && str.constructor == String;
}

export {
  fs,
  isIntNum,
  isBigInt,
  isString,
  util,
  buffer
};