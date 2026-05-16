/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
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

export const Sleep = (ms: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
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

export function cleanData() {
  let attr: asset.AssetMap = new Map();
  try {
    asset.removeSync(attr);
  }
  catch (e) {
    assetLog('no data to remove')
  }
}

export function addSome() {
  assetAddEasy('qwert', '000000');
}


export function assetAddTask(times: number, attr: asset.AssetMap, testAlias: string): number {
  let textEncoder = new util.TextEncoder();
  let beginTime = new Date().getTime();
  for (let i = 0; i < times; i++) {
    let alias = textEncoder.encodeInto(testAlias + String(i))
    attr.set(asset.Tag.ALIAS, alias);
    try {
      asset.addSync(attr);
    } catch (e) {
      return e.code
    }

  }
  let endTime = new Date().getTime();
  return (endTime - beginTime) / times;
}


export function assetQueryTask(times: number, attr: asset.AssetMap, testAlias: string): number {
  let textEncoder = new util.TextEncoder();
  let beginTime = new Date().getTime();
  for (let i = 0; i < times; i++) {
    let alias = textEncoder.encodeInto(testAlias + String(i))
    attr.set(asset.Tag.ALIAS, alias);
    try {
      asset.querySync(attr);
    } catch (e) {
      return e.code
    }
  }
  let endTime = new Date().getTime();
  return (endTime - beginTime) / times;
}

export function assetUpdateTask(times: number, attr1: asset.AssetMap, attr2: asset.AssetMap, testAlias: string): number {
  let textEncoder = new util.TextEncoder();
  let beginTime = new Date().getTime();
  for (let i = 0; i < times; i++) {
    let alias = textEncoder.encodeInto(testAlias + String(i))
    attr1.set(asset.Tag.ALIAS, alias);
    try {
      asset.updateSync(attr1, attr2);
    } catch (e) {
      return e.code
    }
  }
  let endTime = new Date().getTime();
  return (endTime - beginTime) / times;
}


export function assetRemoveTask(times: number, attr: asset.AssetMap, testAlias: string): number {
  let textEncoder = new util.TextEncoder();
  let beginTime = new Date().getTime();
  for (let i = 0; i < times; i++) {
    let alias = textEncoder.encodeInto(testAlias + String(i))
    attr.set(asset.Tag.ALIAS, alias);
    try {
      asset.removeSync(attr);
    } catch (e) {
      return e.code
    }
  }
  let endTime = new Date().getTime();
  return (endTime - beginTime) / times;
}

export function assetAddEasy(alias: string, secret: string) {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias));
  attr.set(asset.Tag.SECRET, StringToArray(secret));

  attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);

  return assetAddAttr(attr);
}

export function assetAddAttr(attr: asset.AssetMap): number {
  try {
    asset.addSync(attr);
    return 0
  } catch (e) {
    return e.code
  }
}

export function assetAddAll(attr: asset.AssetMap) {
  for (let i = 0; i < aliasNameList.length; i++) {
    attr.set(asset.Tag.ALIAS, StringToArray(aliasNameList[i]));
    attr.set(asset.Tag.SECRET, StringToArray(secretList[i]));
    attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray(labelList[i]));
    assetAddAttr(attr);
  }
}

export function assetRemove(alias: string) {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias));
  return assetRemoveAttr(attr);
}

export function assetRemoveAttr(attr: asset.AssetMap): number {
  try {
    asset.removeSync(attr);
    return 0
  } catch (e) {
    return e.code
  }
}

export function assetQueryAttr(attr: asset.AssetMap): asset.AssetMap[] | number {
  try {
    return asset.querySync(attr);
  } catch (e) {
    return e.code
  }
}


export function assetQueryEasy(attr: asset.AssetMap) {
  let re = assetQueryAttr(attr);
  if (typeof re == typeof 1) {
    return re;
  } else {
    let re0 = (re as asset.AssetMap[])[0] as asset.AssetMap;
    let ret: retAll = {
      alias: ArrayToString(re0.get(asset.Tag.ALIAS) as Uint8Array),
      secret: ArrayToString(re0.get(asset.Tag.SECRET) as Uint8Array),
      label1: ArrayToString(re0.get(asset.Tag.DATA_LABEL_NORMAL_1) as Uint8Array),
      label2: ArrayToString(re0.get(asset.Tag.DATA_LABEL_NORMAL_2) as Uint8Array),
      label3: ArrayToString(re0.get(asset.Tag.DATA_LABEL_NORMAL_3) as Uint8Array),
      label4: ArrayToString(re0.get(asset.Tag.DATA_LABEL_NORMAL_4) as Uint8Array),
      critical1: ArrayToString(re0.get(asset.Tag.DATA_LABEL_CRITICAL_1) as Uint8Array),
      critical2: ArrayToString(re0.get(asset.Tag.DATA_LABEL_CRITICAL_2) as Uint8Array),
      critical3: ArrayToString(re0.get(asset.Tag.DATA_LABEL_CRITICAL_3) as Uint8Array),
      critical4: ArrayToString(re0.get(asset.Tag.DATA_LABEL_CRITICAL_4) as Uint8Array),
    }

    return ret;
  }
}

export function assetQueryAll(alias: string, targetSecret: string) {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias));
  attr.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
  let re = assetQueryAttr(attr);
  if (typeof re == typeof 1) {
    return re;
  } else {
    let tmpre: asset.AssetMap = (re as asset.AssetMap[])[0];
    let s = ArrayToString(tmpre.get(asset.Tag.SECRET) as Uint8Array);
    if (targetSecret == s) {
      return 0;
    } else {
      return -1;
    }
  }
}

export function assetQueryNum(attr: asset.AssetMap): number {
  try {
    let ret: asset.AssetMap[] = asset.querySync(attr);
    return ret.length
  } catch (e) {
    return e.code
  }
}

export function assetUpdate(alias: string): number {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias))
  let attr2: asset.AssetMap = new Map();
  attr2.set(asset.Tag.SECRET, StringToArray(updateSecret));
  try {
    asset.updateSync(attr, attr2);
    return 0
  } catch (e) {
    return e.code
  }
}

export function assetUpdateEasy(alias: string, newSecret: string): number {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias));
  let attr2: asset.AssetMap = new Map();
  attr2.set(asset.Tag.SECRET, StringToArray(newSecret));
  try {
    asset.updateSync(attr, attr2);
    return 0
  } catch (e) {
    return e.code
  }
}

export function assetUpdateAttrs(attr: asset.AssetMap, attr2: asset.AssetMap): number {
  try {
    asset.updateSync(attr, attr2);
    return 0
  } catch (e) {
    return e.code
  }
}

export function assetPreQuery(attr: asset.AssetMap): Uint8Array | number {
  try {
    let challenge: Uint8Array = asset.preQuerySync(attr);
    return challenge;
  } catch (e) {
    return e.code
  }
}

export function assetPreQueryExpect(attr: asset.AssetMap): Uint8Array | number {
  try {
    asset.preQuerySync(attr);
    return 0;
  } catch (e) {
    return e.code
  }
}

export function assetPreQueryEasy(): Uint8Array | number {
  let attr: asset.AssetMap = new Map();
  try {
    let challenge: Uint8Array = asset.preQuerySync(attr);
    return challenge;
  } catch (e) {
    return e.code
  }
}

export function assetPostQuery(challenge: Uint8Array): number {
  try {
    let attr: asset.AssetMap = new Map();
    attr.set(asset.Tag.AUTH_CHALLENGE, challenge)
    asset.postQuerySync(attr);
    return 0;
  } catch (e) {
    return e.code
  }
}

export function assetPostQueryAttr(attr: asset.AssetMap): number {
  try {
    asset.postQuerySync(attr);
    return 0;
  } catch (e) {
    return e.code
  }
}

export function basicCRUD(attr: asset.AssetMap): number {
  attr.set(asset.Tag.ALIAS, StringToArray(aliasNameList[0]))
  attr.set(asset.Tag.SECRET, StringToArray(secretList[0]));
  let attr2: asset.AssetMap = new Map();
  attr2.set(asset.Tag.ALIAS, StringToArray(aliasNameList[0]))
  let attr4: asset.AssetMap = new Map();
  attr4.set(asset.Tag.SECRET, StringToArray(updateSecret));
  try {
    asset.addSync(attr);
    asset.removeSync(attr2);
    asset.addSync(attr);
    asset.updateSync(attr2, attr4);
    attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL)
    asset.querySync(attr2);
    return 0
  } catch (e) {
    return e.code
  }
}

export function basicCRUD2(attr: asset.AssetMap): number {
  attr.set(asset.Tag.ALIAS, StringToArray(aliasNameList[1]))
  attr.set(asset.Tag.SECRET, StringToArray(secretList[0]));
  let attr2: asset.AssetMap = new Map();
  attr2.set(asset.Tag.ALIAS, StringToArray(aliasNameList[0]))
  attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL)
  let attr3: asset.AssetMap = new Map();
  attr3.set(asset.Tag.ALIAS, StringToArray(aliasNameList[0]))
  let attr4: asset.AssetMap = new Map();
  attr4.set(asset.Tag.SECRET, StringToArray(updateSecret));
  try {
    asset.addSync(attr);
    asset.querySync(attr2);
    asset.updateSync(attr3, attr4);
    asset.removeSync(attr2);
    return 0
  } catch (e) {
    return e.code
  }
}