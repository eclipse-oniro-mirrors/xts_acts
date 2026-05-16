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
import { cryptoFramework } from "@kit.CryptoArchitectureKit";
import { BusinessError } from '@ohos.base';

export async function doCipher(algName: string, isEncrypt: boolean, rawData: cryptoFramework.DataBlob,
  priKey: cryptoFramework.PriKey|null, pubKey: cryptoFramework.PubKey|null): Promise<cryptoFramework.DataBlob> {
  try {
    let cipher: cryptoFramework.Cipher = cryptoFramework.createCipher(algName);
    if (isEncrypt && pubKey) {
      await cipher.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, pubKey, null);
    } else if (!isEncrypt && priKey) {
      await cipher.init(cryptoFramework.CryptoMode.DECRYPT_MODE, priKey, null);
    }
    let data: cryptoFramework.DataBlob|null = await cipher.doFinal(rawData);
    if (!data) {
      throw new Error("[XTS] doCipher return null");
    }
    console.info("[XTS] doCipher success");
    return data;
  } catch (error: BusinessError) {
    console.error(`[XTS] doCipher ${error}, error code: ${error.code}`);
    throw error as Error;
  }
}