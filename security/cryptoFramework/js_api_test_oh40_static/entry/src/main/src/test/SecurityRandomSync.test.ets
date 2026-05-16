/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import * as asyRandomCommon from "./utils/securityrandom/publicSecurityRandomCommon";
import cryptoFrameworks from "@ohos.security.cryptoFramework";

export default function SecurityRandomSyncJsunit() {
  describe("SecurityRandomSyncJsunit", () => {
    console.log("##########start SecurityRandomSyncJsunit##########");
    beforeAll(async () => {
    });
    /**
     * @tc.name   Security_CryptoFramework_RandomSync_Func_0100
     * @tc.number Security_CryptoFramework_RandomSync_Func_0100
     * @tc.desc   the length of random is 12, use sync style of interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(
      "Security_CryptoFramework_RandomSync_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let rand: cryptoFrameworks.Random = cryptoFrameworks.createRandom();
        try {
          let dataBlob: cryptoFrameworks.DataBlob = rand.generateRandomSync(12);
          expect(dataBlob != null).assertTrue();
        } catch (err) {
          console.error("RandomSync 0 catch error:" + err);
          console.log("[RandomSync]: 0 error code: 401");
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_RandomSync_Func_0200
     * @tc.number Security_CryptoFramework_RandomSync_Func_0200
     * @tc.desc   the length of random is 0, use sync style of interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_RandomSync_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let rand: cryptoFrameworks.Random = cryptoFrameworks.createRandom();
        try {
          rand.generateRandomSync(0);
          expect(null).assertFail();
        } catch (err) {
          console.log("[RandomSync]: 0 error code: 401");
          expect((err as BusinessError).code).assertEqual(401);
        }

        try {
          rand.generateRandomSync(-1);
          expect(null).assertFail();
        } catch (err) {
          console.log("[RandomSync]: -1 error code: 401");
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_RandomSync_Func_0300
     * @tc.number Security_CryptoFramework_RandomSync_Func_0300
     * @tc.desc   no parameters,use sync style of interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_RandomSync_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let rand: cryptoFrameworks.Random = cryptoFrameworks.createRandom();
        console.log("get rand.algName is: " + rand.algName);
        expect(rand.algName == "CTR_DRBG").assertTrue();
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_Enum_Func_0100
     * @tc.number Security_CryptoFramework_Enum_Func_0100
     * @tc.desc   no parameters,use sync style of interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_Enum_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      asyRandomCommon.testEnumCommon();
      done();
    });
  });
}
