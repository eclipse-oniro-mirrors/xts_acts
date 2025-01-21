/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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

import fileIO from '@ohos.file.fs';
import util from '@ohos.util';
import featureAbility from '@ohos.ability.featureAbility';

export const FILE_CONTENT = 'hello world';

import {
  describe, it, expect
}
from '@ohos/hypium'

export function prepareFile(fpath, content) {
  try {
    let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE)
    fileIO.truncateSync(file.fd)
    fileIO.writeSync(file.fd, content)
    fileIO.fsyncSync(file.fd)
    fileIO.closeSync(file)
    return true
  } 
  catch (e) {
    console.log('Failed to prepareFile for ' + e)
    return false
  }
}

export function prepare200MFile(fpath) {
  try {
    let file = fileIO.openSync(fpath, fileIO.OpenMode.CREATE | fileIO.OpenMode.READ_WRITE)
    fileIO.truncateSync(file.fd)
    let bf = new ArrayBuffer(1024 * 1024 * 20);
    for (let i = 0; i < 10; i++) {
      let offset = bf.byteLength * i;
      let writeLen = fileIO.writeSync(file.fd, bf, { offset: offset, length: bf.byteLength, encoding: 'utf-8' });
    }
    fileIO.fsyncSync(file.fd)
    fileIO.closeSync(file)
    return true
  }
  catch (e) {
    console.log('Failed to prepare200MFile for ' + e)
    return false
  }
}

export async function nextFileName(testName) {
  let context = featureAbility.getContext();
  let data = await context.getCacheDir();
  let BASE_PATH = data + '/';
  return BASE_PATH + testName + '_' + randomString(testName.length);
}

export async function fileName(testName) {
  let context = featureAbility.getContext();
  let data = await context.getFilesDir();
  let BASE_PATH = data + '/';
  return BASE_PATH + testName + '_' + randomString(testName.length);
}

export function randomString(num) {
  let len= num;
  var $chars = 'aaaabbbbcccc';
  var maxPos = $chars.length;
  var pwd = '';
  for (var i = 0; i < len; i++) {
    pwd += $chars.charAt(Math.floor(Math.random() * maxPos));
  }
  return pwd;
}

export async function sleep(times) {
  if (!times) {
      times = 10;
  }
  await new Promise((res) => setTimeout(res, times));
}

function isIntNum(val) {
  return typeof val === 'number' && val % 1 === 0;
}

function isBigInt(val) {
  return typeof val === 'bigint';
}

function isString(str) {
  return (typeof str == 'string') && str.constructor == String;
}

export {
  fileIO,
  isIntNum,
  isBigInt,
  isString,
  describe,
  it,
  expect,
  util
};