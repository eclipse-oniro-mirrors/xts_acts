/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import hilog from '@ohos.hilog';
import asset from '@ohos.security.asset';

import util from '@ohos.util';

export const assetQueryTrue = 9999;

export const secLong = "0123456789123456".repeat(64);

export const secTooLong = "0123456789123456".repeat(64) + '1';

export const secShort = "1";

export const valueEmpty = "";


export const aliasLong = "0123456789123456".repeat(16);

export const aliasTooLong = "0123456789123456".repeat(16) + '1';


export const labelLong = "0123456789123456".repeat(32);

export const labelTooLong = "0123456789123456".repeat(128) + '1';

export class retAll {
  alias: string = '';
  secret: string = '';
  label1: string = '';
  label2: string = '';
  label3: string = '';
  label4: string = '';
  critical1: string = '';
  critical2: string = '';
  critical3: string = '';
  critical4: string = '';
}

export const aliasNameList = [
  'user01',
  'user02',
  'user03',
  'user04',
  'user05',
]

export const secretList = [
  '11111111',
  '12345678',
  'abcdefg',
  'aaaaaa',
  '#'
]

export const labelList = [
  'tag1',
  'tag1',
  'tag1',
  'tag0',
  'a'
]

export const updateSecret = 'ihadbeenupdated';

export function assetLog(assetLog: string) {
  hilog.info(0x0000, 'asset_service', 'assetXTSlog' + assetLog);
}

export function StringToArray(str: string) {
  let textEncoder = new util.TextEncoder();
  return textEncoder.encodeInto(str);
}

export function ArrayToString(arr: Uint8Array) {
  let textDecoder = util.TextDecoder.create("utf-8", {
    ignoreBOM: true
  });
  let str = textDecoder.decodeWithStream(arr, {
    stream: false
  })
  return str;
}

export async function cleanData() {
  let attr: asset.AssetMap = new Map();
  try {
    await asset.remove(attr);
  }
  catch (e) {
    assetLog('no data to remove')
  }
}

export async function assetAddEasy(alias: string, secret: string) {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias));
  attr.set(asset.Tag.SECRET, StringToArray(secret));
  attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);
  return await assetAddAttr(attr);
}

export async function assetAddAttr(attr: asset.AssetMap) {
  try {
    await asset.add(attr);
    return 0
  } catch (e) {
    return e.code
  }
}

export async function assetAddAll(attr: asset.AssetMap) {
  for (let i = 0; i < aliasNameList.length; i++) {
    attr.set(asset.Tag.ALIAS, StringToArray(aliasNameList[i]));
    attr.set(asset.Tag.SECRET, StringToArray(secretList[i]));
    attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray(labelList[i]));
    await assetAddAttr(attr);
  }
}

export const authList = [
  asset.AuthType.ANY,
  asset.AuthType.NONE,
  asset.AuthType.ANY,
  asset.AuthType.ANY,
  asset.AuthType.ANY,
]

export async function assetAddAllAuth(attr: asset.AssetMap) {
  for (let i = 0; i < aliasNameList.length; i++) {
    attr.set(asset.Tag.ALIAS, StringToArray(aliasNameList[i]));
    attr.set(asset.Tag.SECRET, StringToArray(secretList[i]));
    attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray(labelList[i]));
    attr.set(asset.Tag.AUTH_TYPE, authList[i]);
    await assetAddAttr(attr);
  }
}
