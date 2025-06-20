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

export const fakeChallenge = "0123456789123456".repeat(2);

export const secLong = "0123456789123456".repeat(64);

export const secTooLong = "0123456789123456".repeat(64) + '1';

export const secShort = "1";

export const valueEmpty = "";


export const aliasLong = "0123456789123456".repeat(16);

export const aliasTooLong = "0123456789123456".repeat(16) + '1';


export const labelLong = "0123456789123456".repeat(32);
export const string2k = "0123456789123456".repeat(128);
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


export const Sleep = (ms: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

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

export async function addSome() {
  assetAddEasy('qwert', '000000');
}

export async function assetAddEasy(alias: string, secret: string) {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias));
  attr.set(asset.Tag.SECRET, StringToArray(secret));

  attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);

  return await assetAddAttr(attr);
}

export async function assetAddFull(attr: asset.AssetMap) {
  attr.set(asset.Tag.SECRET, StringToArray(secLong));
  attr.set(asset.Tag.DATA_LABEL_NORMAL_1, StringToArray(labelLong));
  attr.set(asset.Tag.DATA_LABEL_NORMAL_2, StringToArray(labelLong));
  attr.set(asset.Tag.DATA_LABEL_NORMAL_3, StringToArray(labelLong));
  attr.set(asset.Tag.DATA_LABEL_NORMAL_4, StringToArray(labelLong));
  attr.set(asset.Tag.DATA_LABEL_CRITICAL_1, StringToArray(labelLong));
  attr.set(asset.Tag.DATA_LABEL_CRITICAL_2, StringToArray(labelLong));
  attr.set(asset.Tag.DATA_LABEL_CRITICAL_3, StringToArray(labelLong));
  attr.set(asset.Tag.DATA_LABEL_CRITICAL_4, StringToArray(labelLong));
  attr.set(asset.Tag.ACCESSIBILITY, asset.Accessibility.DEVICE_POWERED_ON);

  return await assetAddAttr(attr);
}

export async function assetAddFullAll(testAlias1: string, times: number) {

  let attr: asset.AssetMap = new Map();
  for (let i = 0; i < times; i++) {
    attr.set(asset.Tag.ALIAS, StringToArray(testAlias1 + String(i)));
    await assetAddFull(attr);
  }
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

export async function assetRemove(alias: string) {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias));
  return await assetRemoveAttr(attr);
}

export async function assetRemoveAttr(attr: asset.AssetMap) {
  try {
    await asset.remove(attr);
    return 0
  } catch (e) {
    return e.code
  }
}

export async function assetQueryAttr(attr: asset.AssetMap): Promise<asset.AssetMap[] | number> {
  try {
    return await asset.query(attr);
  } catch (e) {
    return e.code
  }
}


export async function assetQueryEasy(attr: asset.AssetMap) {
  let re = await assetQueryAttr(attr);
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

export async function assetQueryAll(alias: string, targetSecret: string) {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias));
  attr.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
  let re = await assetQueryAttr(attr);
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

export async function assetQueryNum(attr: asset.AssetMap) {
  try {
    let ret: asset.AssetMap[] = await asset.query(attr);
    return ret.length
  } catch (e) {
    return e.code
  }
}

export async function assetUpdate(alias: string) {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias))
  let attr2: asset.AssetMap = new Map();
  attr2.set(asset.Tag.SECRET, StringToArray(updateSecret));
  try {
    await asset.update(attr, attr2);
    return 0
  } catch (e) {
    return e.code
  }
}

export async function assetUpdateEasy(alias: string, newSecret: string) {
  let attr: asset.AssetMap = new Map();
  attr.set(asset.Tag.ALIAS, StringToArray(alias));
  let attr2: asset.AssetMap = new Map();
  attr2.set(asset.Tag.SECRET, StringToArray(newSecret));
  try {
    await asset.update(attr, attr2);
    return 0
  } catch (e) {
    return e.code
  }
}

export async function assetUpdateAttrs(attr: asset.AssetMap, attr2: asset.AssetMap) {
  try {
    await asset.update(attr, attr2);
    return 0
  } catch (e) {
    return e.code
  }
}

export async function assetPreQuery(attr: asset.AssetMap): Promise<Uint8Array | number> {
  try {
    let challenge: Uint8Array = await asset.preQuery(attr);
    return challenge;
  } catch (e) {
    return e.code
  }
}

export async function assetPreQueryExpect(attr: asset.AssetMap): Promise<Uint8Array | number> {
  try {
    await asset.preQuery(attr);
    return 0;
  } catch (e) {
    return e.code
  }
}

export async function assetPreQueryEasy(): Promise<Uint8Array | number> {
  let attr: asset.AssetMap = new Map();
  try {
    let challenge: Uint8Array = await asset.preQuery(attr);
    return challenge;
  } catch (e) {
    return e.code
  }
}

export async function assetPostQuery(challenge: Uint8Array) {
  try {
    let attr: asset.AssetMap = new Map();
    attr.set(asset.Tag.AUTH_CHALLENGE, challenge)
    await asset.postQuery(attr);
    return 0;
  } catch (e) {
    return e.code
  }
}

export async function basicCRUD(attr: asset.AssetMap) {
  attr.set(asset.Tag.ALIAS, StringToArray(aliasNameList[0]))
  attr.set(asset.Tag.SECRET, StringToArray(secretList[0]));
  let attr2: asset.AssetMap = new Map();
  attr2.set(asset.Tag.ALIAS, StringToArray(aliasNameList[0]))
  let attr4: asset.AssetMap = new Map();
  attr4.set(asset.Tag.SECRET, StringToArray(updateSecret));
  try {
    await asset.add(attr);
    await asset.remove(attr2);
    await asset.add(attr);
    await asset.update(attr2, attr4);
    attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL)
    await asset.query(attr2);
    return 0
  } catch (e) {
    return e.code
  }
}

export async function basicCRUD2(attr: asset.AssetMap) {
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
    await asset.add(attr);
    await asset.query(attr2);
    await asset.update(attr3, attr4);
    await asset.remove(attr2);
    return 0
  } catch (e) {
    return e.code
  }
}

export async function basicCRUDCE(attr: asset.AssetMap) {
  attr.set(asset.Tag.ALIAS, StringToArray(aliasNameList[0]))
  attr.set(asset.Tag.SECRET, StringToArray(secretList[0]));
  let attr2: asset.AssetMap = new Map();
  attr2.set(asset.Tag.ALIAS, StringToArray(aliasNameList[0]))
  attr2.set(asset.Tag.REQUIRE_ATTR_ENCRYPTED, true);
  let attr4: asset.AssetMap = new Map();
  attr4.set(asset.Tag.SECRET, StringToArray(updateSecret));
  try {
    await asset.add(attr);
    await asset.remove(attr2);
    await asset.add(attr);
    await asset.update(attr2, attr4);
    attr2.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL)
    await asset.query(attr2);
    return 0
  } catch (e) {
    return e.code
  }
}