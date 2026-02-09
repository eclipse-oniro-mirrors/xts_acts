/*
 * Copyright (C) 2023-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { BusinessError } from '@ohos.base';
import crypto from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString } from "../common/publicDoString.test";

async function pbkdf2NormalProcess(algName: string, pbkdf2Spec: crypto.PBKDF2Spec): Promise<crypto.DataBlob> {
  try {
    let kdfObj: crypto.Kdf = crypto.createKdf(algName);
    let dataBlob: crypto.DataBlob = await kdfObj.generateSecret(pbkdf2Spec);
    console.log(`[Promise] dataBlob is: ${dataBlob.data}`);
    console.log(`[Promise] dataBlob is: ${uInt8ArrayToShowStr(dataBlob.data)}`);
    return dataBlob;
  } catch (err) {
    console.log(`[Promise] pbkdf2NormalProcess catch error: ${err}`);
    throw err as Error;
  }
}

export { pbkdf2NormalProcess };
