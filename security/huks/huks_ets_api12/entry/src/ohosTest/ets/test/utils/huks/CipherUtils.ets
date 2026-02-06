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
import * as huksCallback from './HuksCallbackUtils';
import { GetDataBySize, StringToUint8Array, Uint8ArrayToString } from '../common/CommonUtils';
import { GenParam, SetParam } from './HuksOptionsUtils';
import { Logger } from '../common/Logger';

export function GetGcmNoPaddingOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_GCM),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_NONCE, StringToUint8Array("120123456789")),
      GenParam(huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA, StringToUint8Array("1601234567890123"))
    )
  };
  return huksOptions;
}

export function GetCcmNoPaddingOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CCM),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_NONCE, StringToUint8Array("7012345")),
      GenParam(huks.HuksTag.HUKS_TAG_ASSOCIATED_DATA, StringToUint8Array("1601234567890123"))
    )
  };
  return huksOptions;
}

export function GetCbcNoPaddingOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(size)))
    )
  };
  return huksOptions;
}

export function GetCbcPkcs7Options(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CBC),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(size)))
    )
  };
  return huksOptions;
}

export function GetCtrNoPaddingOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CTR),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(size)))
    )
  };
  return huksOptions;
}

export function GetCfbNoPaddingOptions(ivSize: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(ivSize)))
    )
  };
  return huksOptions;
}

export function GetOfbNoPaddingOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_OFB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(size)))
    )
  };
  return huksOptions;
}

export function GetSm3NoPaddingOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SM3),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
    )
  };
  return huksOptions;
}

export function GetEcbNoPaddingOptions(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
    )
  };
  return huksOptions;
}

export function GetEcbPkcs1Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS1_V1_5),
    )
  };
  return huksOptions;
}

export function GetEcbPkcs7Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_PKCS7),
    )
  };
  return huksOptions;
}

export function GetEcbOaepSha256Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA256),
    )
  };
  return huksOptions;
}

export function GetEcbOaepSha384Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA384),
    )
  };
  return huksOptions;
}

export function GetEcbOaepSha512Options(): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_ECB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_OAEP),
      GenParam(huks.HuksTag.HUKS_TAG_DIGEST, huks.HuksKeyDigest.HUKS_DIGEST_SHA512),
    )
  };
  return huksOptions;
}

export async function Cipher(keyAlias: string, cipherOptions: huks.HuksOptions, cipherData: CipherData): Promise<boolean> {
  let encryptResult: CipherData;
  let decryptResult: CipherData;
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  encryptResult = await DoCipher(keyAlias, cipherOptions, cipherData);
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  PrintCipherData(encryptResult);
  decryptResult = await DoCipher(keyAlias, cipherOptions, encryptResult);
  PrintCipherData(decryptResult);
  return CompareCipherData(cipherData, decryptResult);
}

export async function CipherForGcm(keyAlias: string, cipherOptions: huks.HuksOptions, cipherData: CipherData, tagLength: number): Promise<CipherData> {
  let encryptResult: CipherData;
  let decryptResult: CipherData;
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  PrintCipherData(cipherData);
  encryptResult = await DoCipher(keyAlias, cipherOptions, cipherData);
  PrintCipherData(encryptResult);
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  let offset = encryptResult.finishData!.length - tagLength;
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(offset) as Uint8Array);
  encryptResult.finishData = encryptResult.finishData!.slice(0, offset) as Uint8Array;
  PrintCipherData(encryptResult);
  decryptResult = await DoCipher(keyAlias, cipherOptions, encryptResult);
  PrintCipherData(decryptResult);
  return decryptResult;
}

export async function CipherForCcm(keyAlias: string, cipherOptions: huks.HuksOptions, cipherData: CipherData, tagLength: number): Promise<CipherData> {
  let encryptResult: CipherData;
  let decryptResult: CipherData;
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  PrintCipherData(cipherData);
  encryptResult = await DoCipher(keyAlias, cipherOptions, cipherData);
  PrintCipherData(encryptResult);
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  encryptResult.updateDataArr = new Array();
  let offset = encryptResult.finishData!.length - tagLength;
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_AE_TAG, encryptResult.finishData!.slice(offset) as Uint8Array);
  encryptResult.finishData = encryptResult.finishData!.slice(0, offset) as Uint8Array;
  PrintCipherData(encryptResult);
  decryptResult = await DoCipher(keyAlias, cipherOptions, encryptResult);
  PrintCipherData(decryptResult);
  return decryptResult;
}

export async function DoCipher(keyAlias: string, cipherOptions: huks.HuksOptions, cipherData: CipherData): Promise<CipherData> {
  let cipherResult: CipherData = {
    updateDataArr: null,
    finishData: null
  };
  let handle = (await huks.initSession(keyAlias, cipherOptions)).handle;
  if (cipherData.updateDataArr != null) {
    cipherResult.updateDataArr = new Array();
    for (let i = 0; i < cipherData.updateDataArr.length; i++) {
      cipherOptions.inData = cipherData.updateDataArr[i];
      let updateRes = await huks.updateSession(handle, cipherOptions);
      if (updateRes && updateRes.outData) {
        cipherResult.updateDataArr.push(updateRes.outData);
      } else {
        cipherResult.updateDataArr.push(new Uint8Array());
      }
    }
  }
  cipherOptions.inData = cipherData.finishData as Uint8Array;
  cipherResult.finishData = (await huks.finishSession(handle, cipherOptions)).outData as Uint8Array;
  return cipherResult;
}

export async function DoCipherAsUser(userId: number, keyAlias: string, cipherOptions: huks.HuksOptions, cipherData: CipherData): Promise<CipherData> {
  let cipherResult: CipherData = {
    updateDataArr: null,
    finishData: null
  };
  let handle = (await huks.initSessionAsUser(userId, keyAlias, cipherOptions)).handle;
  if (cipherData.updateDataArr != null) {
    let updateData: Array<Uint8Array> = cipherData.updateDataArr;
    cipherResult.updateDataArr = new Array;
    for (let i = 0; i < updateData.length; i++) {
      cipherOptions.inData = updateData[i];
      cipherResult.updateDataArr.push((await huks.updateSession(handle, cipherOptions)).outData as Uint8Array);
    }
  }
  cipherOptions.inData = cipherData.finishData as Uint8Array;
  cipherResult.finishData = (await huks.finishSession(handle, cipherOptions)).outData as Uint8Array;
  return cipherResult;
}

export async function DoCipherCallback(keyAlias: string, cipherOptions: huks.HuksOptions, cipherData: CipherData): Promise<CipherData> {
  let cipherResult: CipherData = {
    updateDataArr: null,
    finishData: null
  };
  let handle = (await huksCallback.initSession(keyAlias, cipherOptions)).handle;
  if (cipherData.updateDataArr != null) {
    let updateData: Array<Uint8Array> = cipherData.updateDataArr;
    cipherResult.updateDataArr = new Array;
    for (let i = 0; i < updateData.length; i++) {
      cipherOptions.inData = updateData[i];
      cipherResult.updateDataArr.push((await huksCallback.updateSession(handle, cipherOptions)).outData as Uint8Array);
    }
  }
  cipherOptions.inData = cipherData.finishData as Uint8Array;
  cipherResult.finishData = (await huksCallback.finishSession(handle, cipherOptions)).outData as Uint8Array;
  return cipherResult;
}

export async function cipherWithText(genKeyOption: huks.HuksOptions, cipherOptions: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = StringToUint8Array(text);
  let preFinishText: Uint8Array = StringToUint8Array(keyAlias);
  let encryptUpdateData: Uint8Array;
  let encryptFinishData: Uint8Array;
  let postUpdateText: Uint8Array;
  let postFinishText: Uint8Array;
  let handle: number;
  await huks.generateKeyItem(keyAlias, genKeyOption);
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  handle = (await huks.initSession(keyAlias, cipherOptions)).handle;
  cipherOptions.inData = preUpdateText;
  encryptUpdateData = (await huks.updateSession(handle, cipherOptions)).outData as Uint8Array;
  cipherOptions.inData = preFinishText;
  encryptFinishData = (await huks.finishSession(handle, cipherOptions)).outData as Uint8Array;
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  cipherOptions.inData = encryptUpdateData;
  handle = (await huks.initSession(keyAlias, cipherOptions)).handle;
  postUpdateText = (await huks.updateSession(handle, cipherOptions)).outData as Uint8Array;
  cipherOptions.inData = encryptFinishData;
  postFinishText = (await huks.finishSession(handle, cipherOptions)).outData as Uint8Array;
  return Uint8ArrayToString(postUpdateText) + Uint8ArrayToString(postFinishText) == text + keyAlias
}

export async function cipherWithTextCallback(genKeyOption: huks.HuksOptions, cipherOptions: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = StringToUint8Array(text);
  let preFinishText: Uint8Array = StringToUint8Array(keyAlias);
  let encryptUpdateData: Uint8Array;
  let encryptFinishData: Uint8Array;
  let postUpdateText: Uint8Array;
  let postFinishText: Uint8Array;
  let handle: number;
  await huksCallback.generateKeyItem(keyAlias, genKeyOption);
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  handle = (await huksCallback.initSession(keyAlias, cipherOptions)).handle;
  cipherOptions.inData = preUpdateText;
  encryptUpdateData = (await huksCallback.updateSession(handle, cipherOptions)).outData as Uint8Array;
  cipherOptions.inData = preFinishText;
  encryptFinishData = (await huksCallback.finishSession(handle, cipherOptions)).outData as Uint8Array;
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  cipherOptions.inData = encryptUpdateData;
  handle = (await huksCallback.initSession(keyAlias, cipherOptions)).handle;
  postUpdateText = (await huksCallback.updateSession(handle, cipherOptions)).outData as Uint8Array;
  cipherOptions.inData = encryptFinishData;
  postFinishText = (await huksCallback.finishSession(handle, cipherOptions)).outData as Uint8Array;
  return Uint8ArrayToString(postUpdateText) + Uint8ArrayToString(postFinishText) == text + keyAlias
}

export async function cipherAbortWithText(genKeyOption: huks.HuksOptions, cipherOptions: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = StringToUint8Array(text);
  let encryptUpdateData: Uint8Array;
  let postUpdateText: Uint8Array;
  let handle: number;
  await huks.generateKeyItem(keyAlias, genKeyOption);
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  handle = (await huks.initSession(keyAlias, cipherOptions)).handle;
  cipherOptions.inData = preUpdateText;
  encryptUpdateData = (await huks.updateSession(handle, cipherOptions)).outData as Uint8Array;
  await huks.abortSession(handle, cipherOptions);
  SetParam(cipherOptions, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  cipherOptions.inData = encryptUpdateData;
  handle = (await huks.initSession(keyAlias, cipherOptions)).handle;
  postUpdateText = (await huks.updateSession(handle, cipherOptions)).outData as Uint8Array;
  await huks.abortSession(handle, cipherOptions);
  return Uint8ArrayToString(postUpdateText) == text;
}

export interface CipherData {
  updateDataArr: Array<Uint8Array> | null,
  finishData: Uint8Array | null,
}

export function BuildCipherData(dataLenArr: Array<number>) {
  let cipherData: CipherData = {
    updateDataArr: null,
    finishData: null
  }
  if (dataLenArr.length == 0) {
    return cipherData;
  } else if (dataLenArr.length > 1) {
    cipherData.updateDataArr = new Array();
    for (let i = 0; i < dataLenArr.length - 1; i++) {
      cipherData.updateDataArr.push(StringToUint8Array(GetDataBySize(dataLenArr[i])));
    }
  }
  cipherData.finishData = StringToUint8Array(GetDataBySize(dataLenArr[dataLenArr.length - 1]));
  return cipherData;
}

export function ReBuildCipherData(cipherData: CipherData, dataLenArr: Array<number>) {
  let mergedData = MergeCipherData(cipherData);
  let offset = 0;
  if (dataLenArr.length == 0) {
    return cipherData;
  } else if (dataLenArr.length > 1) {
    cipherData.updateDataArr = new Array();
    for (let i = 0; i < dataLenArr.length - 1; i++) {
      cipherData.updateDataArr.push(mergedData.slice(offset, offset + dataLenArr[i]));
      offset += dataLenArr[i];
    }
  }
  cipherData.finishData = mergedData.slice(offset);
  return cipherData;
}

export function CompareCipherData(preData: CipherData, postData: CipherData) {
  return Uint8ArrayToString(MergeCipherData(preData)) == Uint8ArrayToString(MergeCipherData(postData));
}

export function PrintCipherData(cipherData: CipherData) {
  let dataLenArr = GetCipherDataLenArr(cipherData);
  let mergedData = MergeCipherData(cipherData);
  Logger.log(mergedData.length + "(" + dataLenArr.join(", ") + "): " + Uint8ArrayToString(mergedData));
}

export function GetCipherDataLenArr(cipherData: CipherData): Array<number> {
  let dataLenArr: Array<number> = new Array();
  if (cipherData.updateDataArr) {
    for (let i = 0; i < cipherData.updateDataArr.length; i++) {
      dataLenArr.push(cipherData.updateDataArr[i].length);
    }
  }
  if (cipherData.finishData) {
    dataLenArr.push(cipherData.finishData.length);
  }
  return dataLenArr;
}

export function MergeCipherData(cipherData: CipherData): Uint8Array {
  let mergedData = new Uint8Array();
  if (cipherData.updateDataArr != null) {
    for (let i = 0; i < cipherData.updateDataArr.length; i++) {
      mergedData = new Uint8Array([...mergedData, ...cipherData.updateDataArr[i]]);
    }
  }
  if (cipherData.finishData != null) {
    mergedData = new Uint8Array([...mergedData, ...cipherData.finishData]);
  }
  return mergedData;
}