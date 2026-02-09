/*
 * Copyright (C) 2023-2026 Huawei Device Co., Ltd.
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
import crypto from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString } from "../common/publicDoString.test";
import { createSymKeyGenerator, createSymCipher } from "./publicSymmetricCommon.test";
import { createGcmParam } from '../common/gcmParamsSpec.test';

async function generateSymKey(symKeyGenerator: crypto.SymKeyGenerator): Promise<crypto.SymKey> {
  return new Promise<crypto.SymKey>((resolve, reject) => {
    symKeyGenerator.generateSymKey((err: BusinessError<void>|null, symKey: crypto.SymKey|undefined) => {
      if (err || symKey === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback]generateSymKey failed. error is " + err);
        reject(err as Error);
      } else {
        if (symKey !== undefined) {
          console.log("[Callback]generateSymKey success. symKey is " + symKey);
          console.log("[Callback]key algName:" + symKey.algName);
          console.log("[Callback]key format:" + symKey.format);
          let encodeKey = symKey.getEncoded();
          console.log("[Callback]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data));
          resolve(symKey as crypto.SymKey);
        }
      }
    });
  });
}

async function initCipher(cipherGenerator: crypto.Cipher, mode: crypto.CryptoMode,
  key: crypto.SymKey, params: crypto.ParamsSpec): Promise<string> {
  return new Promise<string>((resolve, reject) => {
    cipherGenerator.init(mode, key, params, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[Callback]cipherGenerator init failed. error is " + err + "mode is " + mode);
        reject(err as Error);
      } else {
        console.log("[Callback]cipherGenerator init success! mode is : " + mode);
        resolve("init success");
      }
    });
  });
}

async function updateCipher(cipherGenerator: crypto.Cipher, mode: crypto.CryptoMode,
  plainText: crypto.DataBlob): Promise<crypto.DataBlob> {
  return new Promise<crypto.DataBlob>((resolve, reject) => {
    cipherGenerator.update(plainText, (err: BusinessError<void>|null, updateData: crypto.DataBlob|null|undefined) => {
      if (err || updateData === undefined || updateData === null) { // success: error is null, failed: data is undefined
        console.error("[Callback]cipherGenerator update failed. error is " + err + "mode is " + mode);
        reject(err as Error);
      } else {
        console.log("[Callback]cipherGenerator update success! mode is : " + mode);
        resolve(updateData as crypto.DataBlob);
      }
    });
  });
}

async function doFinalCipher(cipherGenerator: crypto.Cipher, mode: crypto.CryptoMode,
  dataBlob: crypto.DataBlob|null): Promise<crypto.DataBlob|null> {
  return new Promise<crypto.DataBlob|null>((resolve, reject) => {
    cipherGenerator.doFinal(dataBlob, (err: BusinessError<void>|null, finalData: crypto.DataBlob|null|undefined) => {
      if (err || finalData === undefined) { // success: error is null, failed: data is undefined
        console.error("[Callback]cipherGenerator doFinal failed. error is " + err + "mode is " + mode);
        reject(err as Error);
      } else {
        const modeName: string = cipherGenerator.algName.split("|")[1];
        if (finalData === null && (modeName === "ECB" || modeName === "CBC")) {
          reject(new Error("[Callback] doFinal failed."));
        }
        console.log("[Callback]cipherGenerator doFinal success! mode is : " + mode);
        resolve(finalData as crypto.DataBlob|null);
      }
    });
  });
}

async function encryptAndDecryptNormalProcess(symAlgoName: string, cipherAlgoName: string, paramType: string,
  aadLength: number = 0, ivLength: number = 0) {
  let globalText: string = "aaa this is test! this is test! bbb";
  // let encryptMode = crypto.CryptoMode.ENCRYPT_MODE;
  // let decryptMode = crypto.CryptoMode.DECRYPT_MODE;
  try {
    let symKeyGenerator: crypto.SymKeyGenerator = createSymKeyGenerator(symAlgoName);
    let cipherGenerator: crypto.Cipher = createSymCipher(cipherAlgoName);
    let globalParams: crypto.GcmParamsSpec = createGcmParam(paramType, aadLength, ivLength);
    let symKey = await generateSymKey(symKeyGenerator);
    await initCipher(cipherGenerator, crypto.CryptoMode.ENCRYPT_MODE, symKey, globalParams);
    let plainText: crypto.DataBlob = { data: stringTouInt8Array(globalText) };
    let updateOutputEncry: crypto.DataBlob = await updateCipher(cipherGenerator, crypto.CryptoMode.ENCRYPT_MODE, plainText);
    let finalOutputEncry: crypto.DataBlob|null = await doFinalCipher(cipherGenerator, crypto.CryptoMode.ENCRYPT_MODE, null);
    if (finalOutputEncry == null) {
      console.log("[Callback]encrypt finalOutputEncry is null! paramType is: " + paramType);
    } else {
      console.log(paramType + " [Callback]encrypt finalOutput is: " + uInt8ArrayToShowStr(finalOutputEncry.data));
      switch (paramType) {
        case "genGcmParamsSpecWithVariableLength":
        case "genGcmParamsSpecNullAAD":
        case "genGcmParamsSpecEmptyAAD":
        case "genGcmParamsSpecAADNullData":
        case "genGcmParamsSpecWithoutAAD":
        case "genGcmParamsSpecWithoutAADData":
          globalParams.authTag = finalOutputEncry;
          break;
        default:
          let updateArray: Array<number> = Array.from(updateOutputEncry.data);
          let finalArray: Array<number> = Array.from(finalOutputEncry.data);
          let tempCipherArray: Array<number> = updateArray.concat(finalArray);
          updateOutputEncry = { data: new Uint8Array(tempCipherArray) };
          break;
      }
    }
    await initCipher(cipherGenerator, crypto.CryptoMode.DECRYPT_MODE, symKey, globalParams);
    let updateOutputDecry: crypto.DataBlob = await updateCipher(cipherGenerator, crypto.CryptoMode.DECRYPT_MODE, updateOutputEncry);
    let updateOutputdata: string = uInt8ArrayToString(updateOutputDecry.data);
    let finalOutputDecry: crypto.DataBlob|null = await doFinalCipher(cipherGenerator, crypto.CryptoMode.DECRYPT_MODE, null);
    if (finalOutputDecry == null) {
      expect(updateOutputdata == globalText).assertTrue();
    } else {
      expect(updateOutputdata + uInt8ArrayToString(finalOutputDecry.data) == globalText).assertTrue();
    }
  } catch (err) {
    throw err as Error;
  }
}

export { encryptAndDecryptNormalProcess };
