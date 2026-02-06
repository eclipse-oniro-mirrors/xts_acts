/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { cryptoFramework } from '@kit.CryptoArchitectureKit'

export let AES_WRAP_SPEC: string[] = [
  "AES128-WRAP:AES128", "AES192-WRAP:AES192", "AES256-WRAP:AES256",
];

export let IV_DEFAULT: number[] = [
  0xa6, 0xa6, 0xa6, 0xa6, 0xa6, 0xa6, 0xa6, 0xa6,
];

export function JsSetIv(iv: number[] = IV_DEFAULT) {
  let ivParamsSpec: cryptoFramework.IvParamsSpec = {
    algName: "IvParamsSpec",
    iv: {data: new Uint8Array(iv)},
  };

  return ivParamsSpec;
}

export async function JsAesWrapPromise(algName: string, mode: cryptoFramework.CryptoMode, symKey: cryptoFramework.SymKey,
  ivParamsSpec: cryptoFramework.IvParamsSpec|null, msg: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
    await cipher.init(mode, symKey, ivParamsSpec);
    let cipherText: cryptoFramework.DataBlob = await cipher.doFinal(msg);

    return cipherText;
  } catch (error) {
    console.error('JsAesWrapEncryptPromise, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export function JsAesWrapSync(algName: string, mode:cryptoFramework.CryptoMode, symKey: cryptoFramework.SymKey,
  ivParamsSpec: cryptoFramework.IvParamsSpec|null, msg: cryptoFramework.DataBlob): cryptoFramework.DataBlob {
  try {
    let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
    cipher.initSync(mode, symKey, ivParamsSpec);
    let cipherText: cryptoFramework.DataBlob = cipher.doFinalSync(msg);

    return cipherText;
  } catch (error) {
    console.error('JsAesWrapEncryptSync, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export async function JsAesWrapCallback(algName: string, mode:cryptoFramework.CryptoMode, symKey: cryptoFramework.SymKey,
  ivParamsSpec: cryptoFramework.IvParamsSpec|null, msg: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
    return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
      cipher.init(mode, symKey, ivParamsSpec, (err) => {
        if (err) {
          throw new Error("init callback filed.");
        } else {
          cipher.doFinal(msg, (err, cipherText) => {
            if (err) {
              reject(err);
            } else {
              resolve(cipherText);
            }
          });
        }
      });
    });
  } catch (error) {
    console.error('JsAesWrapEncryptCallback, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export async function JsGenSymKey(algName: string): Promise<cryptoFramework.SymKey> {
  try {
    let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let symKey: cryptoFramework.SymKey = await generate.generateSymKey();

    return symKey;
  } catch (error) {
    console.error('genSymKey, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export async function JsConvertSymKey(algName: string,
  keyData: cryptoFramework.DataBlob): Promise<cryptoFramework.SymKey> {
  try {
    let generate: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let symKey: cryptoFramework.SymKey = await generate.convertKey(keyData);

    return symKey;
  } catch (error) {
    console.error('JsConvertSymKey, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}
