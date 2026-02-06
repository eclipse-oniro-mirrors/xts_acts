/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { expect } from "../../../../../hypium/index";
import cryptoFramework from "@ohos.security.cryptoFramework";
import {
  stringTouInt8Array,
  uInt8ArrayToShowStr,
  uInt8ArrayToString,
} from "../common/publicDoString";

async function testSecurityRandomPromise(length: int): Promise<boolean> {
  let rand: cryptoFramework.Random;

  return new Promise<boolean>((resolve, reject) => {
    rand = cryptoFramework.createRandom();
    expect(rand != null).assertTrue();
    rand
      .generateRandom(length)
      .then((randData: cryptoFramework.DataBlob) => {
        expect(randData != null).assertTrue();
        console.log(
          "[Promise] rand result first:" + uInt8ArrayToShowStr(randData.data)
        );
        rand.setSeed(randData);
      })
      .then(() => {
        console.log("[Promise] rand set Seed is success！");
      })
      .catch((err) => {
        console.error("[promise]catch err1:" + err);
        reject(err);
      });

    rand
      .generateRandom(length)
      .then((randData: cryptoFramework.DataBlob) => {
        expect(randData != null).assertTrue();
        console.log(
          "[Promise] rand result second: " + uInt8ArrayToShowStr(randData.data)
        );
        resolve(true);
      })
      .catch((err: Error) => {
        console.error("[promise]catch err2:" + err);
        reject(err);
      });
  });
}

export { testSecurityRandomPromise };
