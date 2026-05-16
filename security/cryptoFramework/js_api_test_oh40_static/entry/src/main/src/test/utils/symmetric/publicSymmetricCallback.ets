/*
 * Copyright (C) 2022-2024 Huawei Device Co., Ltd.
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
    symKeyGenerator.generateSymKey((err: BusinessError<void>|null, tmp: cryptoFramework.SymKey|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback]generateSymKey failed. error is " + err);
        reject(err as Error);
      } else {
        let symKey: cryptoFramework.SymKey = tmp as cryptoFramework.SymKey;
        console.log("[Callback]generateSymKey success. symKey is " + symKey);
        console.warn("[Callback]key algName:" + symKey.algName);
        console.warn("[Callback]key format:" + symKey.format);
        let encodeKey: cryptoFramework.DataBlob = symKey.getEncoded();
        console.warn(
          "[Callback]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data)
        );
        resolve(symKey);
      }
    });
  });
}

async function convertSymKey(symKeyGenerator: cryptoFramework.SymKeyGenerator,
  dataBlob: cryptoFramework.DataBlob): Promise<cryptoFramework.SymKey> {
  return new Promise<cryptoFramework.SymKey>((resolve, reject) => {
    symKeyGenerator.convertKey(dataBlob, (err: BusinessError<void>|null, tmp: cryptoFramework.SymKey|undefined) => {
      if (err || tmp === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback]convertKey failed. error is " + err);
        reject(err as Error);
      } else {
        let symKey: cryptoFramework.SymKey = tmp as cryptoFramework.SymKey;
        console.log("[Callback]convertKey success. symKey is " + symKey);
        resolve(symKey);
      }
    });
  });
}

async function initCipher(cipherGenerator: cryptoFramework.Cipher, mode: cryptoFramework.CryptoMode,
  key: cryptoFramework.Key, params: cryptoFramework.ParamsSpec | null): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    cipherGenerator.init(mode, key, params, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback]cipherGenerator init failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err as Error);
      } else {
        console.log(
          "[Callback]cipherGenerator init success! mode is : " + mode
        );
        resolve("init success");
      }
    });
  });
}

async function updateCipher(cipherGenerator: cryptoFramework.Cipher, mode: cryptoFramework.CryptoMode,
  plainText: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
    cipherGenerator.update(plainText, (err: BusinessError<void>|null, updateData: cryptoFramework.DataBlob|null|undefined) => {
      if (err || updateData === undefined || updateData === null) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback]cipherGenerator update failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err as Error);
      } else {
        console.log(
          "[Callback]cipherGenerator update success! mode is : " + mode
        );
        resolve(updateData as cryptoFramework.DataBlob);
      }
    });
  });
}

async function doFinalCipher(cipherGenerator: cryptoFramework.Cipher, mode: cryptoFramework.CryptoMode,
  plainText: cryptoFramework.DataBlob|null): Promise<cryptoFramework.DataBlob|null> {
  return new Promise<cryptoFramework.DataBlob|null>((resolve, reject) => {
    cipherGenerator.doFinal(plainText, (err: BusinessError<void>|null, finalData: cryptoFramework.DataBlob|null|undefined) => {
      if (err || finalData === undefined) { // success: error is null, failed: data is undefined
        console.error(
          "[Callback]cipherGenerator doFinal failed. error is " +
            err +
            "mode is " +
            mode
        );
        reject(err as Error);
      } else {
        console.log(
          "[Callback]cipherGenerator doFinal success! mode is : " + mode
        );
        resolve(finalData as cryptoFramework.DataBlob|null);
      }
    });
  });
}

async function encryptAndDecryptNormalProcess(
  symAlgoName: string,
  cipherAlgoName: string,
  paramType: string
): Promise<void> {
  let updateOutputdata: string;
  let globalCipherText: cryptoFramework.DataBlob;
  let globalKey: cryptoFramework.SymKey;
  let globalText: string = "aaa this is test! this is test! bbb";
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise<void>((resolve, reject) => {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    let cipherGenerator: cryptoFramework.Cipher = createSymCipher(cipherAlgoName);
    expect(cipherGenerator != null).assertTrue();
    let globalParams: cryptoFramework.ParamsSpec|null = createGlobalParams(symAlgoName, paramType);

    generateSymKey(symKeyGenerator)
      .then<string>((CallbackKey: cryptoFramework.SymKey) => {
        expect(CallbackKey != null).assertTrue();
        globalKey = CallbackKey;
        return initCipher(
          cipherGenerator,
          encryptMode,
          CallbackKey,
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
          "[Callback]encrypt update out hex:" +
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
              "[Callback]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr((finalOutput as cryptoFramework.DataBlob).data)
            );
            if (globalParams != null && paramType == "genGcmParamsSpec") {
              (globalParams as cryptoFramework.GcmParamsSpec).authTag = finalOutput as cryptoFramework.DataBlob;
            } else if (globalParams != null && paramType == "genCcmParamsSpec") {
              (globalParams as cryptoFramework.CcmParamsSpec).authTag = finalOutput as cryptoFramework.DataBlob;
            }
          } else {
            console.warn(
              "[Callback]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr((finalOutput as cryptoFramework.DataBlob).data)
            );
            // globalCipherText = Array.from(globalCipherText.data);
            // finalOutput = Array.from(finalOutput.data);
            // globalCipherText = globalCipherText.concat(finalOutput);
            // globalCipherText = new Uint8Array(globalCipherText);
            // globalCipherText = { data: globalCipherText };
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
          "[Callback]decrypt update out: " +
          uInt8ArrayToString(updateOutput.data)
        );
        return doFinalCipher(cipherGenerator, decryptMode, null);
      })
      .then((finalOutput: cryptoFramework.DataBlob|null) => {
        if (finalOutput == null) {
          console.error("[Callback]decrypt doFinal out is null");
        } else {
          console.log(
            "[Callback]decrypt doFinal out hex: " +
            uInt8ArrayToString((finalOutput as cryptoFramework.DataBlob).data)
          );
          console.log(
            "[Callback]Decrypt plaintext data: " +
              updateOutputdata +
            uInt8ArrayToString((finalOutput as cryptoFramework.DataBlob).data)
          );
          expect(
            updateOutputdata + uInt8ArrayToString((finalOutput as cryptoFramework.DataBlob).data) ==
              globalText
          ).assertTrue();
        }
        resolve(undefined);
      })
      .catch((err: Error) => {
        console.error("[Callback] encryptProcess catch err:" + err);
        reject(err);
      });
  });
}

async function convertKeyEncryptAndDecryptProcess(
  symAlgoName: string,
  cipherAlgoName: string,
  paramType: string
): Promise<void> {
  let updateOutputdata: string;
  let globalCipherText: cryptoFramework.DataBlob;
  let globalKey: cryptoFramework.SymKey;
  let globalText: string = "aaa this is test! this is test! bbb";
  let encryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
  let decryptMode: cryptoFramework.CryptoMode = cryptoFramework.CryptoMode.DECRYPT_MODE;

  return new Promise<void>((resolve, reject) => {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = createSymKeyGenerator(symAlgoName);
    expect(symKeyGenerator != null).assertTrue();
    let cipherGenerator: cryptoFramework.Cipher = createSymCipher(cipherAlgoName);
    expect(cipherGenerator != null).assertTrue();
    let globalParams: cryptoFramework.ParamsSpec|null = createGlobalParams(symAlgoName, paramType);

    generateSymKey(symKeyGenerator)
      .then<cryptoFramework.SymKey>((CallbackKey: cryptoFramework.SymKey) => {
        expect(CallbackKey != null).assertTrue();
        globalKey = CallbackKey;
        let encodeKey: cryptoFramework.DataBlob = CallbackKey.getEncoded();
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
          "[Callback]encrypt update out hex:" +
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
              "[Callback]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr((finalOutput as cryptoFramework.DataBlob).data)
            );
            if (globalParams != null && paramType == "genGcmParamsSpec") {
              (globalParams as cryptoFramework.GcmParamsSpec).authTag = finalOutput as cryptoFramework.DataBlob;
            } else if (globalParams != null && paramType == "genCcmParamsSpec") {
              (globalParams as cryptoFramework.CcmParamsSpec).authTag = finalOutput as cryptoFramework.DataBlob;
            }
          } else {
            console.warn(
              "[Callback]encrypt authTag(finalOutput) hex: " +
              uInt8ArrayToShowStr((finalOutput as cryptoFramework.DataBlob).data)
            );
            // globalCipherText = Array.from(globalCipherText.data);
            // finalOutput = Array.from(finalOutput.data);
            // globalCipherText = globalCipherText.concat(finalOutput);
            // globalCipherText = new Uint8Array(globalCipherText);
            // globalCipherText = { data: globalCipherText };
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
          "[Callback]decrypt update out: " +
          uInt8ArrayToString(updateOutput.data)
        );
        return doFinalCipher(cipherGenerator, decryptMode, null);
      })
      .then((finalOutput: cryptoFramework.DataBlob|null) => {
        if (finalOutput == null) {
          console.error("[Callback]decrypt doFinal out is null");
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
        resolve(undefined);
      })
      .catch((err: Error) => {
        console.error("[Callback] encryptProcess catch err:" + err);
        reject(err);
      });
  });
}

async function encryptAndDecryptNormalSM4Process(symKeyPair: cryptoFramework.SymKey,
  cipherAlgoName: string): Promise<boolean> {
  let updateOutputdata: string;
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
          "[Callback] encrypt update out hex:" +
          uInt8ArrayToShowStr(updateOutput.data)
        );
        globalCipherText = updateOutput;
        return doFinalCipher(cipherGenerator, encryptMode, null);
      })
      .then<string>((finalOutput: cryptoFramework.DataBlob|null) => {
        if (finalOutput == null) {
        } else {
          // globalCipherText = Array.from(globalCipherText.data);
          // finalOutput = Array.from(finalOutput.data);
          // globalCipherText = globalCipherText.concat(finalOutput);
          // globalCipherText = new Uint8Array(globalCipherText);
          // globalCipherText = { data: globalCipherText };
          let mergeText = new Uint8Array((finalOutput as cryptoFramework.DataBlob).data.length + globalCipherText.data.length);
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
          "[Callback] decrypt update out: " +
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
        console.error("[Callback] encryptProcess catch err:" + err);
        reject(err);
      });
  });
}

export { encryptAndDecryptNormalProcess, convertKeyEncryptAndDecryptProcess, encryptAndDecryptNormalSM4Process, };
