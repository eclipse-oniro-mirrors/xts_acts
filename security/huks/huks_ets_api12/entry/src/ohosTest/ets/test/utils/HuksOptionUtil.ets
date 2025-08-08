/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import huks from '@ohos.security.huks';
import { StringToUint8Array } from './CommonUtil';
import { SignVerify, SignVerifyData } from './SignVerifyUtil';

export function GenParam(paramTag: huks.HuksTag, paramValue: boolean | number | bigint | Uint8Array): huks.HuksParam {
  return {
    tag: paramTag,
    value: paramValue
  } as huks.HuksParam;
}

export function SetParam(huksOption: huks.HuksOptions, paramTag: huks.HuksTag, paramValue: boolean | number | bigint | Uint8Array): huks.HuksOptions {
  let properties: Array<huks.HuksParam> = huksOption.properties as Array<huks.HuksParam>;
  DeleteParam(huksOption, paramTag);
  properties.push(GenParam(paramTag, paramValue));
  return huksOption;
}

export function AddParam(huksOption: huks.HuksOptions, paramTag: huks.HuksTag, paramValue: boolean | number | bigint | Uint8Array): huks.HuksOptions {
  let properties: Array<huks.HuksParam> = huksOption.properties as Array<huks.HuksParam>;
  properties.push(GenParam(paramTag, paramValue));
  return huksOption;
}

export function DeleteParam(huksOption: huks.HuksOptions, paramTag: huks.HuksTag): huks.HuksOptions {
  let properties: Array<huks.HuksParam> = huksOption.properties as Array<huks.HuksParam>;
  for (let i = properties.length - 1; i >= 0; i--) {
    if (properties[i].tag == paramTag) {
      properties.splice(i, 1);
    }
  }
  return huksOption;
}

export function GetDataBySize(size: number): string {
  if (size <= 0) {
    return "";
  }
  let strArr: Array<string> = new Array(size);
  strArr.fill("A");
  return strArr.join("");
}

export function MergeOption(huksOption: huks.HuksOptions, huksOptionAdd: huks.HuksOptions): huks.HuksOptions {
  let properties: Array<huks.HuksParam> = huksOptionAdd.properties as Array<huks.HuksParam>;
  for (let i = 0; i < properties.length; i++) {
    SetParam(huksOption, properties[i].tag, properties[i].value);
  }
  huksOption.inData = huksOptionAdd.inData;
  return huksOption;
}

export async function CheckSoftware() {
  let dsaAlias = "useDsaToCheckSoftware";
  let dsaOptions: huks.HuksOptions = {
    properties: [
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_DSA),
      GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN)
    ]
  };
  try {
    await huks.generateKeyItem(dsaAlias, dsaOptions);
    await huks.deleteKeyItem(dsaAlias, dsaOptions);
    return true
  } catch (err) {
    return false;
  }
}

export async function CheckWearable() {
  let rsaAlias = "useRsaToCheckWearable";
  let rsaOptions: huks.HuksOptions = {
    properties: [
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_RSA),
      GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, huks.HuksKeySize.HUKS_RSA_KEY_SIZE_1024),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN | huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_ISO_IEC_9796_2),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1),
    ]
  };
  let signVerifyData: SignVerifyData = {
    updateDataArr: null,
    finishData: StringToUint8Array(GetDataBySize(128)),
    signatureData: null
  }
  try {
    await huks.generateKeyItem(rsaAlias, rsaOptions);
    await SignVerify(rsaAlias, rsaOptions, signVerifyData);
    await huks.deleteKeyItem(rsaAlias, rsaOptions);
    return true
  } catch (err) {
    return false;
  }
}