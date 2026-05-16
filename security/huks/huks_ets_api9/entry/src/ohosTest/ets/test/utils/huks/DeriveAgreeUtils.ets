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
import huks from '@ohos.security.huks';
import { StringToUint8Array } from '../common/CommonUtils';
import { GenParam } from './HuksOptionsUtils';
import * as huksCallback from './HuksCallbackUtils';
import { CipherData } from './CipherUtils';

export function GetEcdhAgreeOptions(keySize: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_ECDH),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_AGREE),
      GenParam(huks.HuksTag.HUKS_TAG_KEY_SIZE, keySize),
    )
  }
  return huksOptions;
}

export function GetPbkdf2DeriveOptions(keySize: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_PBKDF2),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE),
      GenParam(huks.HuksTag.HUKS_TAG_ITERATION, 1000),
      GenParam(huks.HuksTag.HUKS_TAG_SALT, StringToUint8Array("1234567812345678")),
      GenParam(huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE, keySize),
    )
  }
  return huksOptions;
}

export function GetHkdfDeriveOptions(keySize: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_HKDF),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE),
      GenParam(huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE, keySize),
    )
  }
  return huksOptions;
}

export function GetHmacDeriveOptions(keySize: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_ALGORITHM, huks.HuksKeyAlg.HUKS_ALG_HMAC),
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DERIVE),
      GenParam(huks.HuksTag.HUKS_TAG_DERIVE_KEY_SIZE, keySize),
    )
  }
  return huksOptions;
}


export function GetNoDigestOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_NONE)
    )
  };
  return huksOptions;
}

export function GetMd5Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_MD5)
    )
  };
  return huksOptions;
}

export function GetSha1Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA1),
    )
  }
  return huksOptions;
}

export function GetSha224Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA224),
    )
  }
  return huksOptions;
}

export function GetSha256Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256),
    )
  }
  return huksOptions;
}

export function GetSha384Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384),
    )
  }
  return huksOptions;
}

export function GetSha512Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512),
    )
  }
  return huksOptions;
}

export function GetSm3Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SM3),
    )
  }
  return huksOptions;
}

export function GetDeriveAgreeFinishOptions(keyAlias: string): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_DERIVED_AGREED_KEY_STORAGE_FLAG, huks.HuksKeyStorageType.HUKS_STORAGE_ONLY_USED_IN_HUKS),
      GenParam(huks.HuksTag.HUKS_TAG_KEY_ALIAS, StringToUint8Array(keyAlias))
    )
  }
  return huksOptions;
}

export async function Derive(keyAlias: string, initOption: huks.HuksOptions, finishOption: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  let handle: number = (await huks.initSession(keyAlias, initOption)).handle;
  await huks.updateSession(handle, initOption);
  return await huks.finishSession(handle, finishOption);
}

export async function DeriveCallback(keyAlias: string, initOption: huks.HuksOptions, finishOption: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  let handle: number = (await huksCallback.initSession(keyAlias, initOption)).handle;
  await huksCallback.updateSession(handle, initOption);
  return await huksCallback.finishSession(handle, finishOption);
}

export async function DeriveEndWithAbort(keyAlias: string, initOption: huks.HuksOptions, finishOption: huks.HuksOptions): Promise<void> {
  let handle: number = (await huks.initSession(keyAlias, initOption)).handle;
  await huks.updateSession(handle, initOption);
  return await huks.abortSession(handle, finishOption);
}

export async function DeriveCallbackEndWithAbort(keyAlias: string, initOption: huks.HuksOptions, finishOption: huks.HuksOptions): Promise<void> {
  let handle: number = (await huksCallback.initSession(keyAlias, initOption)).handle;
  await huksCallback.updateSession(handle, initOption);
  return await huksCallback.abortSession(handle, finishOption);
}

export async function Agree(keyAlias: string, initOption: huks.HuksOptions, finishOption: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return await Derive(keyAlias, initOption, finishOption);
}

export async function Mac(keyAlias: string, macOptions: huks.HuksOptions, macData: CipherData): Promise<Uint8Array> {
  let handle = (await huks.initSession(keyAlias, macOptions)).handle;
  if (macData.updateDataArr != null) {
    for (let i = 0; i < macData.updateDataArr.length; i++) {
      macOptions.inData = macData.updateDataArr[i];
      await huks.updateSession(handle, macOptions);
    }
  }
  macOptions.inData = macData.finishData as Uint8Array;
  return (await huks.finishSession(handle, macOptions)).outData as Uint8Array;
}

export async function MacCallback(keyAlias: string, macOptions: huks.HuksOptions, macData: CipherData): Promise<Uint8Array> {
  let handle = (await huksCallback.initSession(keyAlias, macOptions)).handle;
  if (macData.updateDataArr != null) {
    for (let i = 0; i < macData.updateDataArr.length; i++) {
      macOptions.inData = macData.updateDataArr[i];
      await huksCallback.updateSession(handle, macOptions);
    }
  }
  macOptions.inData = macData.finishData as Uint8Array;
  return (await huksCallback.finishSession(handle, macOptions)).outData as Uint8Array;
}

export async function MacEndWithAbort(keyAlias: string, macOptions: huks.HuksOptions, macData: CipherData): Promise<void> {
  let handle = (await huks.initSession(keyAlias, macOptions)).handle;
  if (macData.updateDataArr != null) {
    for (let i = 0; i < macData.updateDataArr.length; i++) {
      macOptions.inData = macData.updateDataArr[i];
      await huks.updateSession(handle, macOptions);
    }
  }
  macOptions.inData = macData.finishData as Uint8Array;
  return await huks.abortSession(handle, macOptions);
}

export async function MacCallbackEndWithAbort(keyAlias: string, macOptions: huks.HuksOptions, macData: CipherData): Promise<void> {
  let handle = (await huksCallback.initSession(keyAlias, macOptions)).handle;
  if (macData.updateDataArr != null) {
    for (let i = 0; i < macData.updateDataArr.length; i++) {
      macOptions.inData = macData.updateDataArr[i];
      await huksCallback.updateSession(handle, macOptions);
    }
  }
  macOptions.inData = macData.finishData as Uint8Array;
  return await huksCallback.abortSession(handle, macOptions);
}