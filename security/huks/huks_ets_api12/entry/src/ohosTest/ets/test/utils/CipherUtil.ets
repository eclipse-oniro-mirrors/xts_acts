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
import { stringToUint8Array, uint8ArrayToString } from './CommonUtil';
import { setParam } from './HuksOptionUtil';

export async function cipherWithText(genKeyOption: huks.HuksOptions, cipherOption: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = stringToUint8Array(text);
  let preFinishText: Uint8Array = stringToUint8Array(keyAlias);
  let encryptUpdateData: Uint8Array;
  let encryptFinishData: Uint8Array;
  let postUpdateText: Uint8Array;
  let postFinishText: Uint8Array;
  let handle: number;
  try {
    await huks.generateKeyItem(keyAlias, genKeyOption);
    setParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    cipherOption.inData = preUpdateText;
    encryptUpdateData = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
    cipherOption.inData = preFinishText;
    encryptFinishData = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    setParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    cipherOption.inData = encryptUpdateData;
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    postUpdateText = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
    cipherOption.inData = encryptFinishData;
    postFinishText = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    if (uint8ArrayToString(postUpdateText) + uint8ArrayToString(postFinishText) == text + keyAlias) {
      return true;
    } else {
      return false;
    }
  } catch (err) {
    throw err as Error;
  }
}

export async function cipherWithTextCallback(genKeyOption: huks.HuksOptions, cipherOption: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = stringToUint8Array(text);
  let preFinishText: Uint8Array = stringToUint8Array(keyAlias);
  let encryptUpdateData: Uint8Array;
  let encryptFinishData: Uint8Array;
  let postUpdateText: Uint8Array;
  let postFinishText: Uint8Array;
  let handle: number;
  try {
    await generateKeyItem(keyAlias, genKeyOption);
    setParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    handle = (await initSession(keyAlias, cipherOption)).handle;
    cipherOption.inData = preUpdateText;
    encryptUpdateData = (await updateSession(handle, cipherOption)).outData as Uint8Array;
    cipherOption.inData = preFinishText;
    encryptFinishData = (await finishSession(handle, cipherOption)).outData as Uint8Array;
    setParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    cipherOption.inData = encryptUpdateData;
    handle = (await initSession(keyAlias, cipherOption)).handle;
    postUpdateText = (await updateSession(handle, cipherOption)).outData as Uint8Array;
    cipherOption.inData = encryptFinishData;
    postFinishText = (await finishSession(handle, cipherOption)).outData as Uint8Array;
    if (uint8ArrayToString(postUpdateText) + uint8ArrayToString(postFinishText) == text + keyAlias) {
      return true;
    } else {
      return false;
    }
  } catch (err) {
    throw err as Error;
  }
}

export async function cipherOnlyFinishWithText(genKeyOption: huks.HuksOptions, cipherOption: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preText: Uint8Array = stringToUint8Array(text);
  let encryptData: Uint8Array;
  let postText: Uint8Array;
  let handle: number;
  try {
    await huks.generateKeyItem(keyAlias, genKeyOption);
    setParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    cipherOption.inData = preText;
    encryptData = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    setParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    cipherOption.inData = encryptData;
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    postText = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    if (uint8ArrayToString(postText) == text) {
      return true;
    } else {
      return false;
    }
  } catch (err) {
    throw err as Error;
  }
}

export async function cipherAbortWithText(genKeyOption: huks.HuksOptions, cipherOption: huks.HuksOptions, text: string): Promise<boolean> {
  let keyAlias: string = "cipherKey";
  let preUpdateText: Uint8Array = stringToUint8Array(text);
  let encryptUpdateData: Uint8Array;
  let postUpdateText: Uint8Array;
  let handle: number;
  try {
    await huks.generateKeyItem(keyAlias, genKeyOption);
    setParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    cipherOption.inData = preUpdateText;
    encryptUpdateData = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
    await huks.abortSession(handle, cipherOption);
    setParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    cipherOption.inData = encryptUpdateData;
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    postUpdateText = (await huks.updateSession(handle, cipherOption)).outData as Uint8Array;
    await huks.abortSession(handle, cipherOption);
    if (uint8ArrayToString(postUpdateText) == text) {
      return true;
    } else {
      return false;
    }
  } catch (err) {
    throw err as Error;
  }
}

export async function generateKeyItem(keyAlias: string, option: huks.HuksOptions): Promise<void> {
  return new Promise<void>((resolve, reject) => {
    huks.generateKeyItem(keyAlias, option, (err) => {
      if (err) {
        reject(err);
      } else {
        resolve();
      }
    })
  });
}

export async function initSession(keyAlias: string, option: huks.HuksOptions): Promise<huks.HuksSessionHandle> {
  return new Promise<huks.HuksSessionHandle>((resolve, reject) => {
    huks.initSession(keyAlias, option, (err, data) => {
      if (err) {
        reject(err);
      } else {
        resolve(data);
      }
    })
  });
}

export async function updateSession(handle: number, option: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return new Promise<huks.HuksReturnResult>((resolve, reject) => {
    huks.updateSession(handle, option, (err, data) => {
      if (err) {
        reject(err);
      } else {
        resolve(data);
      }
    })
  });
}

export async function finishSession(handle: number, option: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return new Promise<huks.HuksReturnResult>((resolve, reject) => {
    huks.updateSession(handle, option, (err, data) => {
      if (err) {
        reject(err);
      } else {
        resolve(data);
      }
    })
  });
}

export async function abortSession(handle: number, option: huks.HuksOptions): Promise<huks.HuksReturnResult> {
  return new Promise<huks.HuksReturnResult>((resolve, reject) => {
    huks.updateSession(handle, option, (err, data) => {
      if (err) {
        reject(err);
      } else {
        resolve(data);
      }
    })
  });
}
