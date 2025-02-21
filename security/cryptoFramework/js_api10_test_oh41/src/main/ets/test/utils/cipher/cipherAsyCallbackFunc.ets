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
import { stringToUint8Array } from "../common/commonUtils"

async function initCipher(cipherGenerator: cpFw.Cipher, mode: cpFw.CryptoMode, key: cpFw.Key, params: cpFw.ParamsSpec | null):
  Promise<void> {
  return new Promise((resolve, reject) => {
    cipherGenerator.init(mode, key, params, (err) => {
      if (err) {
        console.error("[Callback]cipherGenerator init failed. error is " + err + ". mode is " + mode);
        reject(err);
      } else {
        console.log("[Callback]cipherGenerator init succeed! mode is : " + mode);
        resolve();
      }
    });
  });
}

async function doFinalCipher(cipherGenerator: cpFw.Cipher, mode: cpFw.CryptoMode, dataBlob: cpFw.DataBlob): Promise<cpFw.DataBlob> {
  return new Promise((resolve, reject) => {
    cipherGenerator.doFinal(dataBlob, (err, finalData: cpFw.DataBlob) => {
      if (err) {
        console.error("[Callback]cipherGenerator doFinal failed. error is " + err + ". mode is " + mode);
        reject(err);
      } else {
        console.log("[Callback]cipherGenerator doFinal succeed! mode is : " + mode);
        resolve(finalData);
      }
    });
  });
}

async function normalProcess(cipherAlgName: string, spec: cpFw.AsyKeySpec, params: cpFw.ParamsSpec | null): Promise<boolean> {
  let input: cpFw.DataBlob = { data: stringToUint8Array("This is a cipher test.") };
  let encryptedText: cpFw.DataBlob;
  let decryptedText: cpFw.DataBlob;
  let cipherKeyPair: cpFw.KeyPair;
  let encryptMode: number = cpFw.CryptoMode.ENCRYPT_MODE;
  let decryptMode: number = cpFw.CryptoMode.DECRYPT_MODE;
  let encrypt = cpFw.createCipher(cipherAlgName);
  let decrypt = cpFw.createCipher(cipherAlgName);
  let isTrue: boolean;
  try {
    cipherKeyPair = await cpFw.createAsyKeyGeneratorBySpec(spec).generateKeyPair();
    await initCipher(encrypt, encryptMode, cipherKeyPair.pubKey, params);
    console.log("[Callback] cipherCallbackNormalProcess encrpt init succeed");
    encryptedText = await doFinalCipher(encrypt, encryptMode, input);
    console.log("[Callback] cipherCallbackNormalProcess encypt succeed");
    await initCipher(decrypt, decryptMode, cipherKeyPair.priKey, params);
    console.log("[Callback] cipherCallbackNormalProcess decrypt init succeed.");
    decryptedText = await doFinalCipher(decrypt, decryptMode, encryptedText);
    console.log("[Callback] cipherCallbackNormalProcess decrypt success.");
    if (decryptedText.data.toString() == input.data.toString()) {
      isTrue = true;
    } else {
      isTrue = false;
    }
    return isTrue;
  }
  catch (err) {
    console.log("[Callback] cipherCallbackNormalProcess catch err:" + err);
    throw err as Error;
  }
}

export {
  normalProcess
}