/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { huks } from '@kit.UniversalKeystoreKit';
import { GetDataBySize, StringToUint8Array } from '../common/CommonUtils';
import { GenParam, SetParam } from './HuksOptionsUtils';

export function GetSha256SignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
    )
  };
  return huksOptions;
}

export function GetSha384SignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384)
    )
  };
  return huksOptions;
}

export function GetSha512SignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512)
    )
  };
  return huksOptions;
}

export function GetNoDigestSignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE)
    )
  };
  return huksOptions;
}

export function GetSm3SignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SM3)
    )
  };
  return huksOptions;
}

export function GetSha256Pkcs1SignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
    )
  };
  return huksOptions;
}

export function GetSha384Pkcs1SignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384)
    )
  };
  return huksOptions;
}

export function GetSha512Pkcs1SignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512)
    )
  };
  return huksOptions;
}

export function GetNoDigestPkcs1SignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE)
    )
  };
  return huksOptions;
}

export function GetSha256PssSignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256)
    )
  };
  return huksOptions;
}

export function GetSha384PssSignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384)
    )
  };
  return huksOptions;
}

export function GetSha512PssSignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PSS),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512)
    )
  };
  return huksOptions;
}

export function GetNoDigestNoPaddingSignOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE)
    )
  };
  return huksOptions;
}

export async function SignVerify(keyAlias: string, signVerifyOptions: huks.HuksOptions, signVerifyData: SignVerifyData): Promise<boolean> {
  SetParam(signVerifyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_SIGN);
  signVerifyData.signatureData = await DoSign(keyAlias, signVerifyOptions, signVerifyData);
  SetParam(signVerifyOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_VERIFY);
  await DoVerify(keyAlias, signVerifyOptions, signVerifyData);
  return true;
}

export async function DoSign(keyAlias: string, signVerifyOptions: huks.HuksOptions, signVerifyData: SignVerifyData): Promise<Uint8Array> {
  let handle = (await huks.initSession(keyAlias, signVerifyOptions)).handle;
  if (signVerifyData.updateDataArr != null) {
    let updateData: Array<Uint8Array> = signVerifyData.updateDataArr;
    for (let i = 0; i < updateData.length; i++) {
      signVerifyOptions.inData = updateData[i];
      await huks.updateSession(handle, signVerifyOptions);
    }
  }
  signVerifyOptions.inData = signVerifyData.finishData as Uint8Array;
  return (await huks.finishSession(handle, signVerifyOptions)).outData as Uint8Array;
}

export async function DoVerify(keyAlias: string, signVerifyOptions: huks.HuksOptions, signVerifyData: SignVerifyData): Promise<void> {
  let handle = (await huks.initSession(keyAlias, signVerifyOptions)).handle;
  if (signVerifyData.updateDataArr != null) {
    let updateData: Array<Uint8Array> = signVerifyData.updateDataArr;
    for (let i = 0; i < updateData.length; i++) {
      signVerifyOptions.inData = updateData[i];
      await huks.updateSession(handle, signVerifyOptions);
    }
  }
  signVerifyOptions.inData = signVerifyData.finishData as Uint8Array;
  await huks.updateSession(handle, signVerifyOptions);
  signVerifyOptions.inData = signVerifyData.signatureData as Uint8Array;
  await huks.finishSession(handle, signVerifyOptions);
}

export interface SignVerifyData {
  updateDataArr: Array<Uint8Array> | null,
  finishData: Uint8Array | null,
  signatureData: Uint8Array | null
}

export function BuildSignVerifyData(dataLenArr: Array<number>) {
  let signVerifyData: SignVerifyData = {
    updateDataArr: null,
    finishData: null,
    signatureData: null
  }
  if (dataLenArr.length == 0) {
    return signVerifyData;
  } else if (dataLenArr.length > 1) {
    signVerifyData.updateDataArr = new Array();
    for (let i = 0; i < dataLenArr.length - 1; i++) {
      signVerifyData.updateDataArr.push(StringToUint8Array(GetDataBySize(dataLenArr[i])));
    }
  }
  signVerifyData.finishData = StringToUint8Array(GetDataBySize(dataLenArr[dataLenArr.length-1]));
  return signVerifyData;
}