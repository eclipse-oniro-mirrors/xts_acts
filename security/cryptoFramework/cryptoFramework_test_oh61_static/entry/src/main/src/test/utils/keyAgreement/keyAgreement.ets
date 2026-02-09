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
import { cryptoFramework } from "@kit.CryptoArchitectureKit";
import { BusinessError } from '@ohos.base';


export async function doKeyAgreement(algName: string, priKey: cryptoFramework.PriKey,
  pubKey: cryptoFramework.PubKey): Promise<cryptoFramework.DataBlob> {
  try {
    let agreement: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement(algName);
    let secret: cryptoFramework.DataBlob = await agreement.generateSecret(priKey, pubKey);

    return secret;
  } catch (error) {
    console.error(`[XTS] doKeyAgreement ${error}, error code: ${error.code}`);
    throw error as Error;
  }
}