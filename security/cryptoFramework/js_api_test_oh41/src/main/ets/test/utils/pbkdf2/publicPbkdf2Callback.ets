/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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
import crypto from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, uInt8ArrayToString } from "../common/publicDoString";

async function kdfGenerateSecret(kdfObj: crypto.Kdf, params: crypto.KdfSpec): Promise<crypto.DataBlob> {
  return new Promise((resolve, reject) => {
    kdfObj.generateSecret(params, (err, dataBlob) => {
      if (err) {
        console.error(`[Callback]kdfGenerateSecret failed. error code is: ${err.code}`);
        reject(err);
      } else {
        resolve(dataBlob);
      }
    });
  });
}

async function pbkdf2NormalProcess(algName: string, pbkdf2Spec: crypto.PBKDF2Spec): Promise<crypto.DataBlob> {
  try {
    let kdfObj: crypto.Kdf = crypto.createKdf(algName);
    let dataBlob: crypto.DataBlob = await kdfGenerateSecret(kdfObj, pbkdf2Spec);
    console.log(`[Callback] dataBlob is: ${dataBlob.data}`);
    console.log(`[Callback] dataBlob is: ${uInt8ArrayToShowStr(dataBlob.data)}`);
    return dataBlob;
  } catch (err) {
    console.log(`[Callback] pbkdf2NormalProcess catch error: ${err}`);
    throw err;
  }
}

export { pbkdf2NormalProcess, kdfGenerateSecret };
