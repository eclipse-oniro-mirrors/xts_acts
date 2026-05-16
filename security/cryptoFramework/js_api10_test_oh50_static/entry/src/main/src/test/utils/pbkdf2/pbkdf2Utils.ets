/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as commonUtils from '../common/commonUtils';

let KDF_DIGEST_SPEC = [
  "SHA1", "SHA224", "SHA256", "SHA384",
  "SHA512", "SM3"
]

function getPbkdf2Spec(password: string,
  isKeyString: boolean, salt: string, iterations: int, keySize: int): cryptoFramework.PBKDF2Spec {
  try {
    let spec: cryptoFramework.PBKDF2Spec = {
      algName: "PBKDF2",
      password: password,
      salt: commonUtils.stringToUint8Array(salt),
      iterations: iterations,
      keySize: keySize
    }
    if (!isKeyString) {
      spec.password = commonUtils.stringToUint8Array(password);
    };

    return spec;
  } catch (error: BusinessError) {
    console.error(`getPbkdf2Spec “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

function generateKdfKey(algName: string, pbkdf2Spec: cryptoFramework.PBKDF2Spec): cryptoFramework.DataBlob {
  try {
    let kdf: cryptoFramework.Kdf = cryptoFramework.createKdf(algName);
    let secretKey: cryptoFramework.DataBlob = kdf.generateSecretSync(pbkdf2Spec);

    return secretKey;
  } catch (error: BusinessError) {
    console.error(`generateKdfKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}


export {
  KDF_DIGEST_SPEC,
  generateKdfKey,
  getPbkdf2Spec
}