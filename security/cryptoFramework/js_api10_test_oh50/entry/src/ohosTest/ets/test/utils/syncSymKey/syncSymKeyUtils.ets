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
import cryptoFramework from '@ohos.security.cryptoFramework';


function createSymKeySync(algName: string): cryptoFramework.DataBlob {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = symKeyGenerator.generateSymKeySync();
    let encodedKey: cryptoFramework.DataBlob = syncSymKey.getEncoded();

    return encodedKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function convertSymKeySync(algName: string, data: cryptoFramework.DataBlob): cryptoFramework.SymKey {
  try {
    let symKeyGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let syncSymKey: cryptoFramework.SymKey = symKeyGenerator.convertKeySync(data);

    return syncSymKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

export {
  createSymKeySync,
  convertSymKeySync
}