/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { BusinessError } from '@ohos.base';
import cpFw from '@ohos.security.cryptoFramework';
import { stringToUint8Array } from "../common/commonUtils.test"

async function initCipher(cipherGenerator: cpFw.Cipher, mode: cpFw.CryptoMode, key: cpFw.Key, params: cpFw.ParamsSpec | null):
  Promise<string> {
  return new Promise<string>((resolve, reject) => {
    cipherGenerator.init(mode, key, params, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.error("[Callback]cipherGenerator init failed. error is " + err + ". mode is " + mode);
        reject(err as Error);
      } else {
        console.log("[Callback]cipherGenerator init succeed! mode is : " + mode);
        resolve("init success");
      }
    });
  });
}

async function doFinalCipher(cipherGenerator: cpFw.Cipher, mode: cpFw.CryptoMode, dataBlob: cpFw.DataBlob): Promise<cpFw.DataBlob> {
  return new Promise<cpFw.DataBlob>((resolve, reject) => {
    cipherGenerator.doFinal(dataBlob, (err: BusinessError<void>|null, finalData: cpFw.DataBlob|null|undefined) => {
      if (err || finalData === undefined || finalData === null) { // success: error is null, failed: data is undefined
        console.error("[Callback]cipherGenerator doFinal failed. error is " + err + ". mode is " + mode);
        reject(err as Error);
      } else {
        console.log("[Callback]cipherGenerator doFinal succeed! mode is : " + mode);
        resolve(finalData as cpFw.DataBlob);
      }
    });
  });
}

async function normalProcess(cipherAlgName: string, spec: cpFw.AsyKeySpec, params: cpFw.ParamsSpec | null): Promise<boolean> {
  let input: cpFw.DataBlob = { data: stringToUint8Array("This is a cipher test.") };
  let encryptedText: cpFw.DataBlob;
  let decryptedText: cpFw.DataBlob;
  let cipherKeyPair: cpFw.KeyPair;
  // let encryptMode: number = cpFw.CryptoMode.ENCRYPT_MODE;
  // let decryptMode: number = cpFw.CryptoMode.DECRYPT_MODE;
  let encrypt = cpFw.createCipher(cipherAlgName);
  let decrypt = cpFw.createCipher(cipherAlgName);
  let isTrue: boolean;
  try {
    cipherKeyPair = await cpFw.createAsyKeyGeneratorBySpec(spec).generateKeyPair();
    await initCipher(encrypt, cpFw.CryptoMode.ENCRYPT_MODE, cipherKeyPair.pubKey, params);
    console.log("[Callback] cipherCallbackNormalProcess encrpt init succeed");
    encryptedText = await doFinalCipher(encrypt, cpFw.CryptoMode.ENCRYPT_MODE, input);
    console.log("[Callback] cipherCallbackNormalProcess encypt succeed");
    await initCipher(decrypt, cpFw.CryptoMode.DECRYPT_MODE, cipherKeyPair.priKey, params);
    console.log("[Callback] cipherCallbackNormalProcess decrypt init succeed.");
    decryptedText = await doFinalCipher(decrypt, cpFw.CryptoMode.DECRYPT_MODE, encryptedText);
    console.log("[Callback] cipherCallbackNormalProcess decrypt success.");
    if (decryptedText.data.toString() == input.data.toString()) {
      isTrue = true;
    } else {
      isTrue = false;
    }
    return isTrue;
  }
  catch (err: BusinessError) {
    console.log("[Callback] cipherCallbackNormalProcess catch err:" + err);
    throw err as Error;
  }
}

export {
  normalProcess,
  initCipher,
  doFinalCipher
}