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

async function normalProcess(cipherAlgName: string, spec: cpFw.AsyKeySpec, params: cpFw.ParamsSpec | null): Promise<boolean> {
  let input: cpFw.DataBlob = { data: stringToUint8Array("This is a cipher test.") };
  let encryptedText: cpFw.DataBlob;
  let decryptedText: cpFw.DataBlob;
  let cipherKeyPair: cpFw.KeyPair;
  let encryptMode: number = cpFw.CryptoMode.ENCRYPT_MODE;
  let decryptMode: number = cpFw.CryptoMode.DECRYPT_MODE;
  let encrypt = cpFw.createCipher(cipherAlgName);
  let decrypt = cpFw.createCipher(cipherAlgName);
  let res: boolean;
  try {
    cipherKeyPair = await cpFw.createAsyKeyGeneratorBySpec(spec).generateKeyPair();
    await encrypt.init(encryptMode, cipherKeyPair.pubKey, params);
    console.log("[Promise] cipherNormalProcess encrpt init succeed");
    encryptedText = await encrypt.doFinal(input);
    console.log("[Promise] cipherNormalProcess encypt succeed");
    await decrypt.init(decryptMode, cipherKeyPair.priKey, params);
    console.log("[Promise] cipherNormalProcess decrypt init succeed.");
    decryptedText = await decrypt.doFinal(encryptedText);
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
  normalProcess
}