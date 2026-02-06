/*
 * Copyright (C) 2023-2026 Huawei Device Co., Ltd.
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

async function initCipher(cipherGenerator: cpFw.Cipher, mode: cpFw.CryptoMode,
  key: cpFw.Key, params: cpFw.ParamsSpec | null): Promise<string> {
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

async function doFinalCipher(cipherGenerator: cpFw.Cipher, mode: cpFw.CryptoMode,
  dataBlob: cpFw.DataBlob|null): Promise<cpFw.DataBlob> {
  return new Promise<cpFw.DataBlob>((resolve, reject) => {
    cipherGenerator
      .doFinal(dataBlob)
      .then((finalData: cpFw.DataBlob|null) => {
        console.log(
          "[Promise]cipherGenerator doFinal success! mode is : " + mode
        );
        if (finalData === null) {
          reject(new Error('[Promise]cipherGenerator doFinal failed!'));
        } else {
          resolve(finalData);
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

async function normalProcess(cipherAlgName: string, spec: cpFw.AsyKeySpec, params: cpFw.ParamsSpec | null): Promise<boolean> {
  let input: cpFw.DataBlob = { data: stringToUint8Array("This is a cipher test.") };
  let encryptedText: cpFw.DataBlob;
  let decryptedText: cpFw.DataBlob;
  let cipherKeyPair: cpFw.KeyPair;
  let encryptMode = cpFw.CryptoMode.ENCRYPT_MODE;
  let decryptMode = cpFw.CryptoMode.DECRYPT_MODE;
  let encrypt = cpFw.createCipher(cipherAlgName);
  let decrypt = cpFw.createCipher(cipherAlgName);
  let res: boolean;
  try {
    cipherKeyPair = await cpFw.createAsyKeyGeneratorBySpec(spec).generateKeyPair();
    await initCipher(encrypt, encryptMode, cipherKeyPair.pubKey, params);
    console.log("[Promise] cipherNormalProcess encrpt init succeed");
    encryptedText = await doFinalCipher(encrypt, encryptMode, input);
    console.log("[Promise] cipherNormalProcess encypt succeed");
    await initCipher(decrypt, decryptMode, cipherKeyPair.priKey, params);
    console.log("[Promise] cipherNormalProcess decrypt init succeed.");
    decryptedText = await doFinalCipher(decrypt, decryptMode, encryptedText);
    console.log("[Promise] cipherNormalProcess decrypt success.");
    if (decryptedText.data.toString() == input.data.toString()) {
      res = true;
    } else {
      res = false;
    }
    return res;
  }
  catch (err) {
    console.log("[Promise] cipherNormalProcess catch err:" + err);
    throw err as Error;
  }
}

export {
  normalProcess,
  initCipher,
  doFinalCipher
}