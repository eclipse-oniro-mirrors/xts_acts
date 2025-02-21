/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import { expect } from "@ohos/hypium";
import crypto from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString } from "../common/publicDoString";
import { createSymKeyGenerator, createSymCipher } from "./publicSymmetricCommon";
import { createGcmParam } from '../common/gcmParamsSpec';

async function generateSymKey(symKeyGenerator: crypto.SymKeyGenerator): Promise<crypto.SymKey> {
  return new Promise((resolve, reject) => {
    symKeyGenerator.generateSymKey()
      .then((symKey) => {
        console.log("[Promise]generateSymKey success. symKey is " + symKey);
        console.log("[promise]key algName:" + symKey.algName);
        console.log("[promise]key format:" + symKey.format);
        let encodeKey = symKey.getEncoded();
        console.log("[promise]key getEncoded hex: " + uInt8ArrayToShowStr(encodeKey.data));
        resolve(symKey);
      })
      .catch((err) => {
        console.error("[Promise]generateSymKey failed. error is " + err);
        reject(err);
      });
  });
}

async function initCipher(cipherGenerator: crypto.Cipher, mode: crypto.CryptoMode,
                          key: any, params: crypto.ParamsSpec): Promise<string> {
  return new Promise((resolve, reject) => {
    cipherGenerator.init(mode, key, params)
      .then(() => {
        console.log("[Promise]cipherGenerator init success! mode is : " + mode);
        resolve("init success");
      })
      .catch((err) => {
        console.error("[Promise]cipherGenerator init failed. error is " + err + "mode is " + mode);
        reject(err);
      });
  });
}

async function updateCipher(cipherGenerator: crypto.Cipher, mode: crypto.CryptoMode,
                            plainText: crypto.DataBlob): Promise<crypto.DataBlob> {
  return new Promise((resolve, reject) => {
    cipherGenerator.update(plainText)
      .then((updateData) => {
        console.log("[Promise]cipherGenerator update success! mode is : " + mode);
        resolve(updateData);
      })
      .catch((err) => {
        console.error("[Promise]cipherGenerator update failed. error is " + err + "mode is " + mode);
        reject(err);
      });
  });
}

async function doFinalCipher(cipherGenerator: crypto.Cipher, mode: crypto.CryptoMode,
                             dataBlob: crypto.DataBlob): Promise<crypto.DataBlob> {
  return new Promise((resolve, reject) => {
    cipherGenerator.doFinal(dataBlob)
      .then((finalData) => {
        console.log("[Promise]cipherGenerator doFinal success! mode is : " + mode);
        resolve(finalData);
      })
      .catch((err) => {
        console.error("[Promise]cipherGenerator doFinal failed. error is " + err + "mode is " + mode);
        reject(err);
      });
  });
}

async function encryptAndDecryptNormalProcess(symAlgoName: string, cipherAlgoName: string, paramType: string,
                                              aadLength: number = null, ivLength: number = null) {
  let globalText: string = "aaa this is test! this is test! bbb";
  let encryptMode = crypto.CryptoMode.ENCRYPT_MODE;
  let decryptMode = crypto.CryptoMode.DECRYPT_MODE;
  try {
    let symKeyGenerator: crypto.SymKeyGenerator = createSymKeyGenerator(symAlgoName);
    let cipherGenerator: crypto.Cipher = createSymCipher(cipherAlgoName);
    let globalParams: crypto.GcmParamsSpec = createGcmParam(paramType, aadLength, ivLength);
    let symKey = await generateSymKey(symKeyGenerator);
    await initCipher(cipherGenerator, encryptMode, symKey, globalParams);
    let plainText: crypto.DataBlob = { data: stringTouInt8Array(globalText) };
    let updateOutputEncry: crypto.DataBlob = await updateCipher(cipherGenerator, encryptMode, plainText);
    let finalOutputEncry: crypto.DataBlob = await doFinalCipher(cipherGenerator, encryptMode, null);
    if (finalOutputEncry == null) {
      console.log("[Promise]encrypt finalOutputEncry is null! paramType is: " + paramType);
    } else {
      console.log(paramType + " [Promise]encrypt finalOutput is: " + uInt8ArrayToShowStr(finalOutputEncry.data));
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
    await initCipher(cipherGenerator, decryptMode, symKey, globalParams);
    let updateOutputDecry: crypto.DataBlob = await updateCipher(cipherGenerator, decryptMode, updateOutputEncry);
    let updateOutputdata: string = uInt8ArrayToString(updateOutputDecry.data);
    let finalOutputDecry: crypto.DataBlob = await doFinalCipher(cipherGenerator, decryptMode, null);
    if (finalOutputDecry == null) {
      expect(updateOutputdata == globalText).assertTrue();
    } else {
      expect(updateOutputdata + uInt8ArrayToString(finalOutputDecry.data) == globalText).assertTrue();
    }
  } catch (err) {
    throw err;
  }
}

export { encryptAndDecryptNormalProcess };
