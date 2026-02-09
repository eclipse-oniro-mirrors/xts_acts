/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, } from "../common/publicDoString";

async function testMDDigestPromise(MDAlgoName: string): Promise<boolean> {
  let globalMd: cryptoFramework.Md;
  let globalText: string = "Test Md Message";
  let inBlob: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };

  return new Promise<boolean>((resolve, reject) => {
    globalMd = cryptoFramework.createMd(MDAlgoName);
    console.log("Md= " + globalMd);
    console.log("MD algName is: " + globalMd.algName);

    globalMd
      .update(inBlob)
      .then<cryptoFramework.DataBlob>(() => {
        return globalMd.digest();
      })
      .then((digestBlob: cryptoFramework.DataBlob) => {
        console.log("Digest result: " + uInt8ArrayToShowStr(digestBlob.data));
        let mdLen: int = globalMd.getMdLength();
        console.log("Md len: " + mdLen);
        if (digestBlob != null && mdLen != 0 && mdLen != null) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error("testMDDigest catch error: " + err);
        reject(err);
      });
  });
}

async function testHMACDigestPromise(HMACAlgoName: string, keyAlgoName: string): Promise<boolean> {
  let globalHMAC: cryptoFramework.Mac;
  let globalText: string = "Mac test data";
  let globalSymKeyGenerator: cryptoFramework.SymKeyGenerator;
  let inBlob: cryptoFramework.DataBlob = { data: stringTouInt8Array(globalText) };

  return new Promise<boolean>((resolve, reject) => {
    globalHMAC = cryptoFramework.createMac(HMACAlgoName);
    console.log("mac= " + globalHMAC);
    console.log("HMAC algName is: " + globalHMAC.algName);
    globalSymKeyGenerator = cryptoFramework.createSymKeyGenerator(keyAlgoName);
    console.log("symKeyGenerator algName:" + globalSymKeyGenerator.algName);
    globalSymKeyGenerator
      .generateSymKey()
      .then((key: cryptoFramework.SymKey) => {
        console.log("key algName:" + key.algName);
        console.log("key format:" + key.format);
        let encodedKey = key.getEncoded();
        console.log(
          "key getEncoded hex: " + uInt8ArrayToShowStr(encodedKey.data)
        );
        await globalHMAC.init(key);
      })
      .then(() => {
        await globalHMAC.update(inBlob);
      })
      .then<cryptoFramework.DataBlob>(() => {
        let promiseMacdoFinal: cryptoFramework.DataBlob = await globalHMAC.doFinal();
        return promiseMacdoFinal;
      })
      .then((macOutput: cryptoFramework.DataBlob) => {
        console.log("HMAC result:" + macOutput.data);
        let macLen: int = globalHMAC.getMacLength();
        console.log("MAC len:" + macLen);
        if (macOutput != null && macLen != 0 && macLen != null) {
          resolve(true);
        } else {
          resolve(false);
        }
      })
      .catch((err: Error) => {
        console.error("[Promise] catch err:" + err);
        reject(err);
      });
  });
}

export { testMDDigestPromise, testHMACDigestPromise };
