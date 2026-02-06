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
import * as keyGenPromiseFunc from '../keyGenerate/asyKeyGenPromiseFunc.test';


export async function normalProcess(cipherAlgName: string, isSpec:boolean, spec: cpFw.AsyKeySpec, algName: string): Promise<boolean> {
  let agreementKeyPair: cpFw.KeyPair;
  let agreement: cpFw.KeyAgreement = cpFw.createKeyAgreement(cipherAlgName);
  try {
    agreementKeyPair = await keyGenPromiseFunc.genKeyPair(isSpec, spec, algName);
    console.log("[Promise] genKeyPair agreement success.");
    await agreement.generateSecret(agreementKeyPair.priKey, agreementKeyPair.pubKey);
    console.log("[Promise] agreementPromiseNormalProcess agreement success.");
    return true;
  } catch (err) {
    console.log("[Promise] agreementPromiseNormalProcess agreement fail.");
    throw err as Error;
  }
}

export async function keyPairProcess(cipherAlgName: string, agreementPriKey: cpFw.PriKey, agreementPubKey: cpFw.PubKey): Promise<boolean> {
  let agreement: cpFw.KeyAgreement = cpFw.createKeyAgreement(cipherAlgName);
  try {
    await agreement.generateSecret(agreementPriKey, agreementPubKey);
    console.log("[Promise] agreementPromiseNormalProcess agreement success.");
    return true;
  } catch (err) {
    console.log("[Promise] agreementPromiseNormalProcess agreement fail.");
    throw err as Error;
  }
}