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


async function genSymKey(algName: string): Promise<cryptoFramework.SymKey> {
  try {
    let aesGenerator: cryptoFramework.SymKeyGenerator = cryptoFramework.createSymKeyGenerator(algName);
    let symKey: cryptoFramework.SymKey = await aesGenerator.generateSymKey();

    return symKey;
  } catch (error: BusinessError) {
    console.error(`genSymKey “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doHmac(symKeyName: string, macAlgName: string, message: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let key: cryptoFramework.SymKey = await genSymKey(symKeyName);
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(macAlgName);
    await mac.init(key);
    await mac.update(message);
    let macResult: cryptoFramework.DataBlob = await mac.doFinal();

    return macResult;
  } catch (error: BusinessError) {
    console.error(`doHmac “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doHmacWithKey(key: cryptoFramework.SymKey, macAlgName: string, message: cryptoFramework.DataBlob): Promise<cryptoFramework.DataBlob> {
  try {
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(macAlgName);
    await mac.init(key);
    await mac.update(message);
    let macResult: cryptoFramework.DataBlob = await mac.doFinal();

    return macResult;
  } catch (error: BusinessError) {
    console.error(`doHmac “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doHmacNoUpdate(symKeyName: string, macAlgName: string): Promise<cryptoFramework.DataBlob> {
  try {
    let key: cryptoFramework.SymKey = await genSymKey(symKeyName);
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(macAlgName);
    await mac.init(key);
    let macResult: cryptoFramework.DataBlob = await mac.doFinal();

    return macResult;
  } catch (error: BusinessError) {
    console.error(`doHmac “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

async function doHmacWithSplit(macAlgName: string, key: cryptoFramework.SymKey,
                               message: cryptoFramework.DataBlob, blockSize: int): Promise<cryptoFramework.DataBlob> {
  try {
    let mac: cryptoFramework.Mac = cryptoFramework.createMac(macAlgName);
    await mac.init(key);
    for(let dataSize = 0; dataSize < message.data.byteLength / blockSize; dataSize++) {
      let tmp = message.data.subarray(blockSize * dataSize, blockSize * (dataSize + 1));
      let updateText: cryptoFramework.DataBlob = { data:tmp };
      await mac.update(updateText);
    }
    let macResult: cryptoFramework.DataBlob = await mac.doFinal();

    return macResult;
  } catch (error: BusinessError) {
    console.error(`doHmacWithSplit “${error}“, error code: ${error.code}`);
    throw error as Error;
  }
}

export {
  genSymKey,
  doHmac,
  doHmacWithKey,
  doHmacWithSplit,
  doHmacNoUpdate
}