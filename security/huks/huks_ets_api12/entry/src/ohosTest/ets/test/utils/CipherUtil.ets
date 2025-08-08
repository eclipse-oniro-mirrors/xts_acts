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
import { StringToUint8Array, Uint8ArrayToString } from './CommonUtil';
import { SetParam } from './HuksOptionUtil';

export async function Cipher(keyAlias: string, cipherOption: huks.HuksOptions, cipherData: CipherData): Promise<boolean> {
  let encryptResult: CipherData;
  let decryptResult: CipherData;
  try {
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    console.log(`do encrypt`)
    encryptResult = await DoCipher(keyAlias, cipherOption, cipherData);
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    console.log(`do decrypt`)
    decryptResult = await DoCipher(keyAlias, cipherOption, encryptResult);
    return CompareCipherData(cipherData, decryptResult);
  } catch (err) {
    throw err as Error
  }
}

export async function DoCipher(keyAlias: string, cipherOption: huks.HuksOptions, cipherData: CipherData): Promise<CipherData> {
  let cipherResult: CipherData = {
    updateDataArr: null,
    finishData: null
  };
  try {
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
    console.log(`HUKS cipher updateDataArr is: ${cipherResult.updateDataArr?.toString()}`)
    console.log(`HUKS cipher finishData is: ${cipherResult.finishData?.toString()}`)
    return cipherResult;
  } catch (err) {
    throw err as Error;
  }
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
  try {
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
    if (Uint8ArrayToString(postUpdateText) + Uint8ArrayToString(postFinishText) == text + keyAlias) {
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
  let preUpdateText: Uint8Array = StringToUint8Array(text);
  let preFinishText: Uint8Array = StringToUint8Array(keyAlias);
  let encryptUpdateData: Uint8Array;
  let encryptFinishData: Uint8Array;
  let postUpdateText: Uint8Array;
  let postFinishText: Uint8Array;
  let handle: number;
  try {
    await generateKeyItem(keyAlias, genKeyOption);
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    handle = (await initSession(keyAlias, cipherOption)).handle;
    cipherOption.inData = preUpdateText;
    encryptUpdateData = (await updateSession(handle, cipherOption)).outData as Uint8Array;
    cipherOption.inData = preFinishText;
    encryptFinishData = (await finishSession(handle, cipherOption)).outData as Uint8Array;
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    cipherOption.inData = encryptUpdateData;
    handle = (await initSession(keyAlias, cipherOption)).handle;
    postUpdateText = (await updateSession(handle, cipherOption)).outData as Uint8Array;
    cipherOption.inData = encryptFinishData;
    postFinishText = (await finishSession(handle, cipherOption)).outData as Uint8Array;
    if (Uint8ArrayToString(postUpdateText) + Uint8ArrayToString(postFinishText) == text + keyAlias) {
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
  let preText: Uint8Array = StringToUint8Array(text);
  let encryptData: Uint8Array;
  let postText: Uint8Array;
  let handle: number;
  try {
    await huks.generateKeyItem(keyAlias, genKeyOption);
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_ENCRYPT);
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    cipherOption.inData = preText;
    encryptData = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    SetParam(cipherOption, huks.HuksTag.HUKS_TAG_PURPOSE, huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_DECRYPT);
    cipherOption.inData = encryptData;
    handle = (await huks.initSession(keyAlias, cipherOption)).handle;
    postText = (await huks.finishSession(handle, cipherOption)).outData as Uint8Array;
    if (Uint8ArrayToString(postText) == text) {
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
  let preUpdateText: Uint8Array = StringToUint8Array(text);
  let encryptUpdateData: Uint8Array;
  let postUpdateText: Uint8Array;
  let handle: number;
  try {
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
    if (Uint8ArrayToString(postUpdateText) == text) {
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

export interface CipherData {
  updateDataArr: Array<Uint8Array> | null,
  finishData: Uint8Array | null
}

export function CompareCipherData(preData: CipherData, postData: CipherData) {
  if (preData.updateDataArr != null) {
    if (postData.updateDataArr == null) {
      return false
    }
    for (let i = 0; i < preData.updateDataArr.length; i++) {
      if (Uint8ArrayToString(postData.updateDataArr[i]) != Uint8ArrayToString(preData.updateDataArr[i])) {
        return false
      }
    }
  }
  return Uint8ArrayToString(postData.finishData as Uint8Array) == Uint8ArrayToString(preData.finishData as Uint8Array)
}
