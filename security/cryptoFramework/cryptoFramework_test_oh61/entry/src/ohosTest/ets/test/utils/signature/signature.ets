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

export async function doSignature(algName: string,
  message: cryptoFramework.DataBlob, priKey: cryptoFramework.PriKey): Promise<cryptoFramework.DataBlob> {
  try {
    let sign: cryptoFramework.Sign = cryptoFramework.createSign(algName);
    await sign.init(priKey);
    let data: cryptoFramework.DataBlob = await sign.sign(message);

    return data;
  } catch (error) {
    console.error(`[XTS] doSignature ${error}, error code: ${error.code}`);
    throw error as Error;
  }
}

export async function doVerify(algName: string, signData: cryptoFramework.DataBlob,
  message: cryptoFramework.DataBlob, pubKey: cryptoFramework.PubKey): Promise<boolean> {
  try {
    let verify: cryptoFramework.Verify = cryptoFramework.createVerify(algName);
    await verify.init(pubKey);
    let ret: boolean = await verify.verify(message, signData);

    return ret;
  } catch (error) {
    console.error(`[XTS] doVerify ${error}, error code: ${error.code}`);
    throw error as Error;
  }
}