/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import { expect } from "../../../../../hypium/index";
import cryptoFramework from "@ohos.security.cryptoFramework";
import {
  stringTouInt8Array,
  uInt8ArrayToShowStr,
  uInt8ArrayToString,
  genGcmParamsSpec,
  genIvParamsSpec,
  genCcmParamsSpec,
} from "../common/publicDoString";

import { createSymKeyGenerator, createSymCipher, } from "./publicSymmetricCommon";

function createGlobalParams(symAlgoName: string, paramType: string): cryptoFramework.ParamsSpec|null {
  let params: cryptoFramework.ParamsSpec|null;
  try {
    if (paramType == "genIvParamsSpec") {
      if (symAlgoName.includes("AES")) {
        params = genIvParamsSpec(16);
      } else if (symAlgoName.includes("3DES")) {
        params = genIvParamsSpec(8);
      } else {
        params = null;
      }
    } else if (paramType == "genGcmParamsSpec") {
      params = genGcmParamsSpec();
    } else if (paramType == "genCcmParamsSpec") {
      params = genCcmParamsSpec();
    } else if (paramType == "null") {
      params = null;
    } else {
      params = null;
    }
    return params;
  } catch (err: BusinessError) {
    throw err as Error;
  }
}

async function generateSymKey(symKeyGenerator: cryptoFramework.SymKeyGenerator): Promise<cryptoFramework.SymKey> {
  return new Promise<cryptoFramework.SymKey>((resolve, reject) => {
    symKeyGenerator
      .generateSymKey()
      .then((symKey: cryptoFramework.SymKey) => {
        console.log("[Promise]generateSymKey success. symKey is " + symKey);
        console.warn("[promise]key algName:" + symKey.algName);
        console.warn("[promise]key format:" + symKey.format);
        let encodeKey: cryptoFramework.DataBlob = symKey.getEncoded();
        console.warn(
          "[promise]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data)
        );
        resolve(symKey);
      })
      .catch((err: Error) => {
        console.error("[Promise]generateSymKey failed. error is " + err);
        reject(err);
      });
  });
}

async function convertSymKey(symKeyGenerator: cryptoFramework.SymKeyGenerator,
  dataBlob: cryptoFramework.DataBlob): Promise<cryptoFramework.SymKey> {
  return new Promise<cryptoFramework.SymKey>((resolve, reject) => {
    symKeyGenerator
      .convertKey(dataBlob)
      .then((symKey: cryptoFramework.SymKey) => {
        console.log("[Promise]convertKey success. symKey is " + symKey);
        resolve(symKey);
      })
      .catch((err: Error) => {
        console.error("[Promise]convertKey failed. error is " + err);
        reject(err);
      });
  });
}

async function initCipher(cipherGenerator: cryptoFramework.Cipher, mode: cryptoFramework.CryptoMode,
  key: cryptoFramework.Key, params: cryptoFramework.ParamsSpec | null): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    cipherGenerator
      .init(mode, key, params)
      .then(() => {
        console.log("[Promise]cipherGenerator init success! mode is : " + mode);
        resolve("init success");
      })
      .catch((err: Error) => {
        console.error(
          "[Promise]cipherGenerator init failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err);
      });
  });
}

async function updateCipher(cipherGenerator: cryptoFramework.Cipher, mode: cryptoFramework.CryptoMode,
  plainText: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    cipherGenerator
      .update(plainText)
      .then((updateData: cryptoFramework.DataBlob|null) => {
        console.log(
          "[Promise]cipherGenerator update success! mode is : " + mode
        );
        if (updateData === null) {
          reject(new Error('[Promise]cipherGenerator update failed!'));
        } else {
          resolve(updateData);
        }
      })
      .catch((err: Error) => {
        console.error(
          "[Promise]cipherGenerator update failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err);
      });
  });
}

async function doFinalCipher(cipherGenerator: cryptoFramework.Cipher, mode: cryptoFramework.CryptoMode,
  dataBlob: cryptoFramework.DataBlob|null): Promise<cryptoFramework.DataBlob|null> {
  return new Promise<cryptoFramework.DataBlob|null>((resolve, reject) => {
    cipherGenerator
      .doFinal(dataBlob)
      .then((finalData: cryptoFramework.DataBlob|null) => {
        console.log(
          "[Promise]cipherGenerator doFinal success! mode is : " + mode
        );
        const modeName: string = cipherGenerator.algName.split("|")[1];
        if (finalData === null && (modeName === "ECB" || modeName === "CBC")) {
          reject(new Error('[Promise]cipherGenerator doFinal failed!'));
        } else {
          resolve(finalData as cryptoFramework.DataBlob|null);
        }
      })
      .catch((err: Error) => {
        console.error(
          "[Promise]cipherGenerator doFinal failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err);
      });
  });
}

async function encryptAndDecryptNormalProcess(
  symAlgoName: string,
  cipherAlgoName: string,
  paramType: string
): Promise<boolean> {
  let updateOutputdata: string = '';
  let globalCipherText: cryptoFramework.DataBlob;
  let globalKey: cryptoFramework.SymKey;
  let globalText: string = "aaa this is test! this is test! bbb";
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
  let cipherGenerator: cryptoFramework.Cipher;

  return new Promise<boolean>((resolve, reject) => {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    try {
      cipherGenerator = createSymCipher(cipherAlgoName);
    } catch (err: BusinessError) {
      reject(err as Error);
    }
    expect(cipherGenerator != null).assertTrue();
    let globalParams: cryptoFramework.ParamsSpec|null = createGlobalParams(symAlgoName, paramType);

    generateSymKey(symKeyGenerator)
      .then<string>((promiseKey: cryptoFramework.SymKey) => {
        expect(promiseKey != null).assertTrue();
        globalKey = promiseKey;
        return initCipher(
          cipherGenerator,
          encryptMode,
          promiseKey,
          globalParams
        );
      })
      .then<cryptoFramework.DataBlob>((initData: string) => {
        expect(initData === "init success").assertTrue();
        let plainText: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
        return updateCipher(cipherGenerator, encryptMode, plainText);
      })
      .then<cryptoFramework.DataBlob|null>((updateOutput: cryptoFramework.DataBlob) => {
        console.warn(
          "[promise]encrypt update out hex:" +
          uInt8ArrayToShowStr(updateOutput.data)
        );
        globalCipherText = updateOutput;
        expect(globalCipherText != null).assertTrue();
        return doFinalCipher(cipherGenerator, encryptMode, null);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob|null) => {
        if (finalOutput == null) {
        } else {
          if (
            paramType == "genGcmParamsSpec" ||
              paramType == "genCcmParamsSpec"
          ) {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr((finalOutput as cryptoFramework.DataBlob).data)
            );
            if (globalParams != null && paramType == "genGcmParamsSpec") {
              (globalParams as cryptoFramework.GcmParamsSpec).authTag = finalOutput as cryptoFramework.DataBlob;
            } else if (globalParams != null && paramType == "genCcmParamsSpec") {
              (globalParams as cryptoFramework.CcmParamsSpec).authTag = finalOutput as cryptoFramework.DataBlob;
            }
          } else {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr((finalOutput as cryptoFramework.DataBlob).data)
            );
            let mergeText = new Uint8Array((finalOutput as cryptoFramework.DataBlob).data.length + globalCipherText.data.length);
            mergeText.set(globalCipherText.data);
            mergeText.set((finalOutput as cryptoFramework.DataBlob).data, globalCipherText.data.length);
            globalCipherText = { data: mergeText};
          }
        }
        return initCipher(
          cipherGenerator,
          decryptMode,
          globalKey,
          globalParams
        );
      })
      .then<cryptoFramework.DataBlob>((initData: string) => {
        expect(initData === "init success").assertTrue();
        return updateCipher(cipherGenerator, decryptMode, globalCipherText);
      })
      .then<cryptoFramework.DataBlob|null>((updateOutput: cryptoFramework.DataBlob) => {
        updateOutputdata = uInt8ArrayToString(updateOutput.data);
        console.warn(
          "[promise]decrypt update out: " +
          uInt8ArrayToString(updateOutput.data)
        );
        return doFinalCipher(cipherGenerator, decryptMode, null);
      })
      .then((finalOutput: cryptoFramework.DataBlob|null) => {
        if (finalOutput == null) {
          const modeName: string = cipherGenerator.algName.split("|")[1];
          if (modeName === "ECB" || modeName === "CBC") {
            resolve(false);
          } else {
            resolve(true);
          }
        } else if(
          updateOutputdata + uInt8ArrayToString((finalOutput as cryptoFramework.DataBlob).data) ==
            globalText
        ) {
          resolve(true);
        }
        resolve(false);
      })
      .catch((err: Error) => {
        console.error("[promise] encryptProcess catch err:" + err);
        reject(err);
      });
  });
}

async function convertKeyEncryptAndDecryptProcess(
  symAlgoName: string,
  cipherAlgoName: string,
  paramType: string
): Promise<boolean> {
  let updateOutputdata: string = '';
  let globalCipherText: cryptoFramework.DataBlob;
  let globalKey: cryptoFramework.SymKey;
  let globalText: string = "aaa this is test! this is test! bbb";
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise<boolean>((resolve, reject) => {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    let cipherGenerator: cryptoFramework.Cipher = createSymCipher(cipherAlgoName);
    expect(cipherGenerator != null).assertTrue();
    let globalParams: cryptoFramework.ParamsSpec|null = createGlobalParams(symAlgoName, paramType);

    generateSymKey(symKeyGenerator)
      .then<cryptoFramework.SymKey>((promiseKey: cryptoFramework.SymKey) => {
        expect(promiseKey != null).assertTrue();
        globalKey = promiseKey;
        let encodeKey: cryptoFramework.DataBlob = promiseKey.getEncoded();
        return convertSymKey(symKeyGenerator, encodeKey);
      })
      .then<string>((convertKey: cryptoFramework.SymKey) => {
        expect(convertKey != null).assertTrue();
        return initCipher(
          cipherGenerator,
          encryptMode,
          convertKey,
          globalParams
        );
      })
      .then<cryptoFramework.DataBlob>((initData: string) => {
        expect(initData === "init success").assertTrue();
        let plainText: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
        return updateCipher(cipherGenerator, encryptMode, plainText);
      })
      .then<cryptoFramework.DataBlob|null>((updateOutput: cryptoFramework.DataBlob) => {
        console.warn(
          "[promise]encrypt update out hex:" +
          uInt8ArrayToShowStr(updateOutput.data)
        );
        globalCipherText = updateOutput;
        expect(globalCipherText != null).assertTrue();
        return doFinalCipher(cipherGenerator, encryptMode, null);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob|null) => {
        if (finalOutput == null) {
        } else {
          if (
            paramType == "genGcmParamsSpec" ||
              paramType == "genCcmParamsSpec"
          ) {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr((finalOutput as cryptoFramework.DataBlob).data)
            );
            if (globalParams != null && paramType == "genGcmParamsSpec") {
              (globalParams as cryptoFramework.GcmParamsSpec).authTag = finalOutput as cryptoFramework.DataBlob;
            } else if (globalParams != null && paramType == "genCcmParamsSpec") {
              (globalParams as cryptoFramework.CcmParamsSpec).authTag = finalOutput as cryptoFramework.DataBlob;
            }
          } else {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr((finalOutput as cryptoFramework.DataBlob).data)
            );
            let mergeText: Uint8Array = new Uint8Array((finalOutput as cryptoFramework.DataBlob).data.length + globalCipherText.data.length);
            mergeText.set(globalCipherText.data);
            mergeText.set((finalOutput as cryptoFramework.DataBlob).data, globalCipherText.data.length);
            globalCipherText = { data: mergeText};
          }
        }
        return initCipher(
          cipherGenerator,
          decryptMode,
          globalKey,
          globalParams
        );
      })
      .then<cryptoFramework.DataBlob>((initData: string) => {
        expect(initData === "init success").assertTrue();
        return updateCipher(cipherGenerator, decryptMode, globalCipherText);
      })
      .then<cryptoFramework.DataBlob|null>((updateOutput: cryptoFramework.DataBlob) => {
        updateOutputdata = uInt8ArrayToString(updateOutput.data);
        console.warn(
          "[promise]decrypt update out: " +
          uInt8ArrayToString(updateOutput.data)
        );
        return doFinalCipher(cipherGenerator, decryptMode, null);
      })
      .then((finalOutput: cryptoFramework.DataBlob|null) => {
        if (finalOutput == null) {
          console.error("[promise]decrypt doFinal out is null");
        } else {
          console.log(
            "[promise]decrypt doFinal out hex: " +
            uInt8ArrayToString((finalOutput as cryptoFramework.DataBlob).data)
          );
          console.log(
            "[promise]Decrypt plaintext data: " +
              updateOutputdata +
            uInt8ArrayToString((finalOutput as cryptoFramework.DataBlob).data)
          );
          expect(
            updateOutputdata + uInt8ArrayToString((finalOutput as cryptoFramework.DataBlob).data) ==
              globalText
          ).assertTrue();
        }
        resolve(true);
      })
      .catch((err: Error) => {
        console.error("[promise] encryptProcess catch err:" + err);
        reject(err);
      });
  });
}

async function encryptAndDecryptNormalSM4Process(symKeyPair: cryptoFramework.SymKey,
  cipherAlgoName: string): Promise<boolean> {
  let updateOutputdata: string = '';
  let globalCipherText: cryptoFramework.DataBlob;
  let globalText: string = "abcdefghabcdefghabcdefghabcdefgh";
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
  return new Promise<boolean>((resolve, reject) => {
    let cipherGenerator: cryptoFramework.Cipher = createSymCipher(cipherAlgoName);
    initCipher(cipherGenerator, encryptMode, symKeyPair, null)
      .then<cryptoFramework.DataBlob>((initData: string) => {
        console.log("initData: " + initData);
        let plainText: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
        return updateCipher(cipherGenerator, encryptMode, plainText);
      })
      .then<cryptoFramework.DataBlob|null>((updateOutput: cryptoFramework.DataBlob) => {
        console.log(
          "[promise] encrypt update out hex:" +
          uInt8ArrayToShowStr(updateOutput.data)
        );
        console.log(
          "[promise] encrypt update updateOutput out hex:" +
          uInt8ArrayToShowStr(symKeyPair.getEncoded().data)
        );
        globalCipherText = updateOutput;
        return doFinalCipher(cipherGenerator, encryptMode, null);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob|null) => {
        if (finalOutput == null) {
        } else {
          let mergeText: Uint8Array = new Uint8Array((finalOutput as cryptoFramework.DataBlob).data.length + globalCipherText.data.length);
          mergeText.set(globalCipherText.data);
          mergeText.set((finalOutput as cryptoFramework.DataBlob).data, globalCipherText.data.length);
          globalCipherText = { data: mergeText};
        }
        return initCipher(cipherGenerator, decryptMode, symKeyPair, null);
      })
      .then<cryptoFramework.DataBlob>((initData: string) => {
        console.log("initData: " + initData);
        return updateCipher(cipherGenerator, decryptMode, globalCipherText);
      })
      .then<cryptoFramework.DataBlob|null>((updateOutput: cryptoFramework.DataBlob) => {
        updateOutputdata = uInt8ArrayToString(updateOutput.data);
        console.log(
          "[promise] decrypt update out: " +
          uInt8ArrayToString(updateOutput.data)
        );
        return doFinalCipher(cipherGenerator, decryptMode, null);
      })
      .then((finalOutput: cryptoFramework.DataBlob|null) => {
        console.log("finalOutput: " + finalOutput);
        if (updateOutputdata == globalText) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error("[promise] encryptProcess catch err:" + err);
        reject(err);
      });
  });
}

async function encryptAndDecryptNormalProcessSuperdata(
  symAlgoName: string,
  cipherAlgoName: string,
  paramType: string
): Promise<boolean> {
  let updateOutputdata: string = '';
  let globalCipherText: cryptoFramework.DataBlob;
  let globalKey: cryptoFramework.SymKey;
  let globalText: string = '';
  let globalTextLen: int = 1025;
  let encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode = cryptoFramework.CryptoMode.DECRYPT_MODE;
  let t: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz",n = t.length,s="";
  for (let i = 0; i < globalTextLen; i++) {
    globalText += t.charAt(Math.floor(Math.random() * n).toInt());
  }

  return new Promise<boolean>((resolve, reject) => {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    let cipherGenerator: cryptoFramework.Cipher = createSymCipher(cipherAlgoName);
    expect(cipherGenerator != null).assertTrue();
    let globalParams: cryptoFramework.ParamsSpec|null = createGlobalParams(symAlgoName, paramType);

    generateSymKey(symKeyGenerator)
      .then<string>((promiseKey: cryptoFramework.SymKey) => {
        expect(promiseKey != null).assertTrue();
        globalKey = promiseKey;
        return initCipher(
          cipherGenerator,
          encryptMode,
          promiseKey,
          globalParams
        );
      })
      .then<cryptoFramework.DataBlob>((initData) => {
        expect(initData === "init success").assertTrue();
        let plainText: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };
        return updateCipher(cipherGenerator, encryptMode, plainText);
      })
      .then<cryptoFramework.DataBlob|null>((updateOutput: cryptoFramework.DataBlob) => {
        console.warn(
          "[promise]encrypt update out hex:" +
          uInt8ArrayToShowStr(updateOutput.data)
        );
        globalCipherText = updateOutput;
        expect(globalCipherText != null).assertTrue();
        return doFinalCipher(cipherGenerator, encryptMode, null);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob|null) => {
        if (finalOutput == null) {
        } else {
          if (
            paramType == "genGcmParamsSpec" ||
              paramType == "genCcmParamsSpec"
          ) {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr((finalOutput as cryptoFramework.DataBlob).data)
            );
            if (globalParams != null && paramType == "genGcmParamsSpec") {
              (globalParams as cryptoFramework.GcmParamsSpec).authTag = finalOutput as cryptoFramework.DataBlob;
            } else if (globalParams != null && paramType == "genCcmParamsSpec") {
              (globalParams as cryptoFramework.CcmParamsSpec).authTag = finalOutput as cryptoFramework.DataBlob;
            }
          } else {
            console.warn(
              "[promise]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr((finalOutput as cryptoFramework.DataBlob).data)
            );
            let mergeText: Uint8Array = new Uint8Array((finalOutput as cryptoFramework.DataBlob).data.length + globalCipherText.data.length);
            mergeText.set(globalCipherText.data);
            mergeText.set((finalOutput as cryptoFramework.DataBlob).data, globalCipherText.data.length);
            globalCipherText = { data: mergeText};
          }
        }
        return initCipher(
          cipherGenerator,
          decryptMode,
          globalKey,
          globalParams
        );
      })
      .then<cryptoFramework.DataBlob>((initData: string) => {
        expect(initData === "init success").assertTrue();
        return updateCipher(cipherGenerator, decryptMode, globalCipherText);
      })
      .then<cryptoFramework.DataBlob|null>((updateOutput: cryptoFramework.DataBlob) => {
        updateOutputdata = uInt8ArrayToString(updateOutput.data);
        console.warn(
          "[promise]decrypt update out: " +
          uInt8ArrayToString(updateOutput.data)
        );
        return doFinalCipher(cipherGenerator, decryptMode, null);
      })
      .then((finalOutput: cryptoFramework.DataBlob|null) => {
        if (finalOutput == null) {
          console.error("[promise]decrypt doFinal out is null");
        } else {
          console.log(
            "[promise]decrypt doFinal out hex: " +
            uInt8ArrayToString((finalOutput as cryptoFramework.DataBlob).data)
          );
          console.log(
            "[promise]Decrypt plaintext data: " +
              updateOutputdata + uInt8ArrayToString((finalOutput as cryptoFramework.DataBlob).data)
          );
          expect(
            updateOutputdata + uInt8ArrayToString((finalOutput as cryptoFramework.DataBlob).data) == globalText
          ).assertTrue();
        }
        resolve(true);
      })
      .catch((err: Error) => {
        console.error("[promise] encryptProcess catch err:" + err);
        reject(err);
      });
  });
}

async function ClearMemProcess(symAlgoName: string): Promise<boolean> {
  return new Promise<boolean>((resolve, reject) => {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();

    generateSymKey(symKeyGenerator)
      .then((symKey: cryptoFramework.SymKey) => {
        symKey.clearMem();
        resolve(true);
      })
      .catch((err: Error) => {
        reject(err);
      });
  });
}

export {
  encryptAndDecryptNormalProcess,
  convertKeyEncryptAndDecryptProcess,
  encryptAndDecryptNormalSM4Process,
  ClearMemProcess,
  encryptAndDecryptNormalProcessSuperdata
};
