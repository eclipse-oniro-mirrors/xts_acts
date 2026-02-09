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
import * as keyGenCallbackFunc from '../keyGenerate/asyKeyGenCallbackFunc.test';


async function normalProcess(cipherAlgName: string, isSpec:boolean, spec: cpFw.AsyKeySpec, algName: string): Promise<boolean> {
  let agreementKeyPair: cpFw.KeyPair;
  let agreement = cpFw.createKeyAgreement(cipherAlgName);
  return new Promise<boolean>((resolve, reject) => {
    agreementKeyPair = await keyGenCallbackFunc.genKeyPair(isSpec, spec, algName);
    console.log("[Callback] genKeyPair agreement success.");
    agreement.generateSecret(agreementKeyPair.priKey, agreementKeyPair.pubKey, (err: BusinessError<void>|null) => {
      if (err) { // success: error is null, failed: data is undefined
        console.log("[Callback] agreementCallbackNormalProcess agreement fail.");
        reject(err as Error);
      } else {
        console.log("[Callback] agreementCallbackNormalProcess agreement success.");
        resolve(true);
      }
    });
  });
}

export {
  normalProcess
}