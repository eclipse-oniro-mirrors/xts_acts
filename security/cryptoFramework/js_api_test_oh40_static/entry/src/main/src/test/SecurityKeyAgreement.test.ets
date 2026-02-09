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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import * as asyPromise from "./utils/asymmetric/publicAsymmetricPromise";
import * as asyCommon from "./utils/common/publicDoSpec";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function SecurityKeyAgreementJsunit() {
  describe("SecurityKeyAgreementJsunit", () => {
    console.log("##########start SecurityKeyAgreementJsunit##########");
    beforeAll(async () => {
    });

    /**
     * @tc.name   Security_CryptoFramework_KeyAgreement_Func_0100
     * @tc.number Security_CryptoFramework_KeyAgreement_Func_0100
     * @tc.desc   the type of secret key is "ECC"(No length), use promise style of interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_KeyAgreement_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .keyAgreementProcess("ECC")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error("AsyPromise keyAgreementProcess catch error: " + err);
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_KeyAgreement_Func_0200
     * @tc.number Security_CryptoFramework_KeyAgreement_Func_0200
     * @tc.desc   the type of secret key is "ECC1024"(illegal algorithm), use promise style of interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_KeyAgreement_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .keyAgreementProcess("ECC1024")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error("AsyPromise keyAgreementProcess catch error: " + err);
            expect((err as BusinessError).code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_KeyAgreement_Func_0300
     * @tc.number Security_CryptoFramework_KeyAgreement_Func_0300
     * @tc.desc   the type of secret key is "ECC521", use promise style of interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_KeyAgreement_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let globalECDHData: cryptoFramework.KeyAgreement = cryptoFramework.createKeyAgreement("ECC521");
        console.log(
          "[Promise]: globalECDHData.algName : " + globalECDHData.algName
        );
        expect(globalECDHData.algName == "ECC521").assertTrue();
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_KeyAgreement_Func_0400
     * @tc.number Security_CryptoFramework_KeyAgreement_Func_0400
     * @tc.desc   use the ECCCommon structure to create AsyKeyGenerator object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_KeyAgreement_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .keyAgreementBySpecProcess(asyCommon.genEccCommonSpec(), "ECC521")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "AsyPromise keyAgreementBySpecProcess catch error: " + err
            );
            expect((err as BusinessError).code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_KeyAgreement_Func_0500
     * @tc.number Security_CryptoFramework_KeyAgreement_Func_0500
     * @tc.desc   use the RsaKeyPair structure to create AsyKeyGenerator object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_KeyAgreement_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .keyAgreementBySpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "ECC521"
          )
          .then((data: boolean) => {
            // expect(data == null).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "AsyPromise keyAgreementBySpecProcess catch error: " + err
            );
            expect((err as BusinessError).code).assertEqual(401);
          });
        done();
      }
    );
  });
}
