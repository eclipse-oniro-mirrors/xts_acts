/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';

export async function doUpdate(cipher: cryptoFramework.Cipher,
  message: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    return new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
      cipher.update(message, (err, cipherText) => {
        if (err) {
          reject(err as Error);
        } else {
          if (cipherText) {
            resolve(cipherText);
          } else {
            resolve({data: new Uint8Array()} as cryptoFramework.DataBlob);
          }
        }
      })
    });
  } catch (error) {
    console.error('doUpdate, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export async function doFinal(cipher: cryptoFramework.Cipher,
  message: cryptoFramework.DataBlob|null): Promise<cryptoFramework.DataBlob> {
  try {
    let cipherText: cryptoFramework.DataBlob|null = await cipher.doFinal(message);
    if (cipherText) {
      return cipherText as cryptoFramework.DataBlob;
    } else {
      return {data: new Uint8Array()} as cryptoFramework.DataBlob;
    }
  } catch (error) {
    console.error('doFinal, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export function doFinalSync(cipher: cryptoFramework.Cipher,
  message: cryptoFramework.DataBlob|null): cryptoFramework.DataBlob {
  try {
    let cipherText: cryptoFramework.DataBlob|null = cipher.doFinalSync(message);
    if (cipherText) {
      return cipherText as cryptoFramework.DataBlob;
    } else {
      return {data: new Uint8Array()} as cryptoFramework.DataBlob;
    }
  } catch (error) {
    console.error('doFinalSync, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export async function update(cipher: cryptoFramework.Cipher,
  message: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let cipherText: cryptoFramework.DataBlob|null = await cipher.update(message);
    if (cipherText) {
      return cipherText as cryptoFramework.DataBlob;
    } else {
      return {data: new Uint8Array()} as cryptoFramework.DataBlob;
    }
  } catch (error) {
    console.error('update, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export function updateSync(cipher: cryptoFramework.Cipher,
  message: cryptoFramework.DataBlob): cryptoFramework.DataBlob {
  try {
    let cipherText: cryptoFramework.DataBlob|null = cipher.updateSync(message);
    if (cipherText) {
      return cipherText as cryptoFramework.DataBlob;
    } else {
      return {data: new Uint8Array()} as cryptoFramework.DataBlob;
    }
  } catch (error) {
    console.error('updateSync, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}