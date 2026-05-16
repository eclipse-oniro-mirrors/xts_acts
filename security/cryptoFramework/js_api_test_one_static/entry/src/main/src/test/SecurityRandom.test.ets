// @ts-nocheck
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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import { testSecurityRandomPromise } from "./utils/securityrandom/publicSecurityRandomPromise";
import { testSecurityRandomCallback } from "./utils/securityrandom/publicSecurityRandomCallback";
import { testSecurityRandomEnumCommon } from "./utils/securityrandom/publicSecurityRandomCommon";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function SecurityRandomJsunit() {
  describe("SecurityRandomJsunit", () => {
    console.info("##########start SecurityRandomJsunit##########");
    beforeAll(async () => {
    });

    /**
     * @tc.name   Security_crypto_framework_Random_0100
     * @tc.number Security_crypto_framework_Random_0100
     * @tc.desc   the length of random is 32, use promise style of interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_Random_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testSecurityRandomPromise(32)
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_Random_0200
     * @tc.number Security_crypto_framework_Random_0200
     * @tc.desc   the length of random is 32, use callback style of interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_Random_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await testSecurityRandomCallback(32)
        .then((data: boolean) => {
          expect(data).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_Random_0300
     * @tc.number Security_crypto_framework_Random_0300
     * @tc.desc   First input 0, Second input null, Third input -1, Fourth input 2147483648
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_Random_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let randomGenerator: cryptoFramework.Random = cryptoFramework.createRandom();
      try {
        await new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
          randomGenerator.generateRandom(0, (err: BusinessError<void>|null, dataBlob: cryptoFramework.DataBlob|undefined) => {
            if (err || dataBlob === undefined) { // success: error is null, failed: data is undefined
              reject(err as Error);
            } else {
              resolve(dataBlob as cryptoFramework.DataBlob);
            }
          })
        })
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(401);
      }
      try {
        await new Promise<cryptoFramework.DataBlob>((resolve, reject) => {
          randomGenerator.generateRandom(-1, (err: BusinessError<void>|null, dataBlob: cryptoFramework.DataBlob|undefined) => {
            if (err || dataBlob === undefined) { // success: error is null, failed: data is undefined
              reject(err as Error);
            } else {
              resolve(dataBlob as cryptoFramework.DataBlob);
            }
          })
        })
      } catch (err: BusinessError) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_Random_0500
     * @tc.number Security_crypto_framework_Random_0500
     * @tc.desc   cover 100% Enumerated values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_crypto_framework_Random_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      testSecurityRandomEnumCommon();
      done();
    });
  });
}
