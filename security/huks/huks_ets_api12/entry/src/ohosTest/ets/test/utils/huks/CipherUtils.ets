import { huks } from '@kit.UniversalKeystoreKit';
import * as huksCallback from './HuksCallbackUtils';
import { GetDataBySize, StringToUint8Array, Uint8ArrayToString } from '../CommonUtils';
import { GenParam, SetParam } from './HuksOptionsUtils';

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

export function GetCfbNoPaddingOptions(size: number): huks.HuksOptions {
  let huksOptions: huks.HuksOptions = {
    properties: new Array(
      GenParam(huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT),
      GenParam(huks.HuksTag.HUKS_TAG_BLOCK_MODE, huks.HuksCipherMode.HUKS_MODE_CFB),
      GenParam(huks.HuksTag.HUKS_TAG_PADDING, huks.HuksKeyPadding.HUKS_PADDING_NONE),
      GenParam(huks.HuksTag.HUKS_TAG_IV, StringToUint8Array(GetDataBySize(size)))
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

export async function Cipher(keyAlias: string, cipherOption: huks.HuksOptions, cipherData: CipherData): Promise<boolean> {
  let encryptResult: CipherData;
  let decryptResult: CipherData;
  SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  encryptResult = await DoCipher(keyAlias, cipherOption, cipherData);
  SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  PrintCipherData(encryptResult);
  decryptResult = await DoCipher(keyAlias, cipherOption, encryptResult);
  PrintCipherData(decryptResult);
  return CompareCipherData(cipherData, decryptResult);
}

export async function DoCipher(keyAlias: string, cipherOption: huks.HuksOptions, cipherData: CipherData): Promise<CipherData> {
  let cipherResult: CipherData = {
    updateDataArr: null,
    finishData: null
  };
  let handle = (await huks.initSession(keyAlias, cipherOption)).handle;
  if (cipherData.updateDataArr != null) {
    let updateData: Array<Uint8Array> = cipherData.updateDataArr;
    cipherResult.updateDataArr = new Array;
    for (let i = 0; i < updateData.length; i++) {
      cipherOption.inData = updateData[i];
      cipherResult.updateDataArr.push((await huks.updateSession(handle, cipherOption)).outData as Uint8Array);
    }
  }
  cipherOption.inData = cipherData.finishData as Uint8Array;
  cipherResult.finishData = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
  return cipherResult;
}

export async function DoCipherCallback(keyAlias: string, cipherOption: huks.HuksOptions, cipherData: CipherData): Promise<CipherData> {
  let cipherResult: CipherData = {
    updateDataArr: null,
    finishData: null
  };
  let handle = (await huksCallback.initSession(keyAlias, cipherOption)).handle;
  if (cipherData.updateDataArr != null) {
    let updateData: Array<Uint8Array> = cipherData.updateDataArr;
    cipherResult.updateDataArr = new Array;
    for (let i = 0; i < updateData.length; i++) {
      cipherOption.inData = updateData[i];
      cipherResult.updateDataArr.push((await huksCallback.updateSession(handle, cipherOption)).outData as Uint8Array);
    }
  }
  cipherOption.inData = cipherData.finishData as Uint8Array;
  cipherResult.finishData = (await huksCallback.finishSession(handle, cipherOption)).outData as Uint8Array;
  return cipherResult;
}

export async function cipherWithText(genKeyOption: huks.HuksOptions, cipherOption: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = StringToUint8Array(text);
  let preFinishText: Uint8Array = StringToUint8Array(keyAlias);
  let encryptUpdateData: Uint8Array;
  let encryptFinishData: Uint8Array;
  let postUpdateText: Uint8Array;
  let postFinishText: Uint8Array;
  let handle: number;
  await huks.generateKeyItem(keyAlias, genKeyOption);
  SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  handle = (await huks.initSession(keyAlias, cipherOption)).handle;
  cipherOption.inData = preUpdateText;
  encryptUpdateData = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
  cipherOption.inData = preFinishText;
  encryptFinishData = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
  SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  cipherOption.inData = encryptUpdateData;
  handle = (await huks.initSession(keyAlias, cipherOption)).handle;
  postUpdateText = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
  cipherOption.inData = encryptFinishData;
  postFinishText = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
  return Uint8ArrayToString(postUpdateText) + Uint8ArrayToString(postFinishText) == text + keyAlias
}

export async function cipherWithTextCallback(genKeyOption: huks.HuksOptions, cipherOption: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = StringToUint8Array(text);
  let preFinishText: Uint8Array = StringToUint8Array(keyAlias);
  let encryptUpdateData: Uint8Array;
  let encryptFinishData: Uint8Array;
  let postUpdateText: Uint8Array;
  let postFinishText: Uint8Array;
  let handle: number;
  await huksCallback.generateKeyItem(keyAlias, genKeyOption);
  SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  handle = (await huksCallback.initSession(keyAlias, cipherOption)).handle;
  cipherOption.inData = preUpdateText;
  encryptUpdateData = (await huksCallback.updateSession(handle, cipherOption)).outData as Uint8Array;
  cipherOption.inData = preFinishText;
  encryptFinishData = (await huksCallback.finishSession(handle, cipherOption)).outData as Uint8Array;
  SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  cipherOption.inData = encryptUpdateData;
  handle = (await huksCallback.initSession(keyAlias, cipherOption)).handle;
  postUpdateText = (await huksCallback.updateSession(handle, cipherOption)).outData as Uint8Array;
  cipherOption.inData = encryptFinishData;
  postFinishText = (await huksCallback.finishSession(handle, cipherOption)).outData as Uint8Array;
  return Uint8ArrayToString(postUpdateText) + Uint8ArrayToString(postFinishText) == text + keyAlias
}

export async function cipherAbortWithText(genKeyOption: huks.HuksOptions, cipherOption: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = StringToUint8Array(text);
  let encryptUpdateData: Uint8Array;
  let postUpdateText: Uint8Array;
  let handle: number;
  await huks.generateKeyItem(keyAlias, genKeyOption);
  SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
  handle = (await huks.initSession(keyAlias, cipherOption)).handle;
  cipherOption.inData = preUpdateText;
  encryptUpdateData = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
  await huks.abortSession(handle, cipherOption);
  SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
  cipherOption.inData = encryptUpdateData;
  handle = (await huks.initSession(keyAlias, cipherOption)).handle;
  postUpdateText = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
  await huks.abortSession(handle, cipherOption);
  return Uint8ArrayToString(postUpdateText) == text;
}

export interface CipherData {
  updateDataArr: Array<Uint8Array> | null,
  finishData: Uint8Array | null,
}

export function CompareCipherData(preData: CipherData, postData: CipherData) {
  if (preData.updateDataArr != null) {
    if (postData.updateDataArr == null) {
      return false;
    }
    for (let i = 0; i < preData.updateDataArr.length; i++) {
      if (Uint8ArrayToString(postData.updateDataArr[i]) != Uint8ArrayToString(preData.updateDataArr[i])) {
        return false;
      }
    }
  }
  return Uint8ArrayToString(postData.finishData as Uint8Array) == Uint8ArrayToString(preData.finishData as Uint8Array);
}

export function PrintCipherData(cipherData: CipherData) {
  if (cipherData.updateDataArr != null) {
    for (let i = 0; i < cipherData.updateDataArr.length; i++) {
      console.log(cipherData.updateDataArr[i].length + ":" + Uint8ArrayToString(cipherData.updateDataArr[i]));
    }
  }
  if (cipherData.finishData != null) {
    console.log(cipherData.finishData.length + ":" + Uint8ArrayToString(cipherData.finishData));
  }
}