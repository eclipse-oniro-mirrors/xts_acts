/*
 * Copyright (C) 2022-2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterEach, it, expect } from "@ohos/hypium";
import * as asyPromise from "./utils/asymmetric/publicAsymmetricPromise";
import * as asyCommon from "./utils/common/publicDoSpec";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function SecurityKeyAgreementJsunit() {
    describe("SecurityKeyAgreementJsunit", function () {
        console.log("##########start SecurityKeyAgreementJsunit##########");
        beforeAll(function () {
        });
        afterEach(function () {
        });

    /**
     * @tc.number Security_CryptoFramework_KeyAgreement_Func_0100
     * @tc.name Test the scenario of key agreement using ECC and expect a successful result.
     * @tc.desc the type of secret key is "ECC"(No length), use promise style of interface
     */
    it(
      "Security_CryptoFramework_KeyAgreement_Func_0100",
      0,
      async function (done) {
        await asyPromise
          .keyAgreementProcess("ECC")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error("AsyPromise keyAgreementProcess catch error: " + err);
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_KeyAgreement_Func_0200
     * @tc.name Input illegal algorithm for key agreement testing scenario, expect to return failure.
     * @tc.desc the type of secret key is "ECC1024"(illegal algorithm), use promise style of interface
     */
    it(
      "Security_CryptoFramework_KeyAgreement_Func_0200",
      0,
      async function (done) {
        await asyPromise
          .keyAgreementProcess("ECC1024")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error("AsyPromise keyAgreementProcess catch error: " + err);
            expect(err.code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_KeyAgreement_Func_0300
     * @tc.name Obtain key agreement algorithm
     * @tc.desc the type of secret key is "ECC521", use promise style of interface
     */
    it(
      "Security_CryptoFramework_KeyAgreement_Func_0300",
      0,
      async function (done) {
        var globalECDHData = cryptoFramework.createKeyAgreement("ECC521");
        console.log(
          "[Promise]: globalECDHData.algName : " + globalECDHData.algName
        );
        expect(globalECDHData.algName == "ECC521").assertTrue();
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_KeyAgreement_Func_0400
     * @tc.name use EccCommon structure and "ECC521" for key agreement scenario testing,expect a successful return.
     * @tc.desc use the ECCCommon structure to create AsyKeyGenerator object
     * a key type of "ECC521" to create KeyAgreement object
     * use a promise style interface
     */
    it(
      "Security_CryptoFramework_KeyAgreement_Func_0400",
      0,
      async function (done) {
        await asyPromise
          .keyAgreementBySpecProcess(asyCommon.genEccCommonSpec(), "ECC521")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise keyAgreementBySpecProcess catch error: " + err
            );
            expect(err.code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_KeyAgreement_Func_0500
     * @tc.name use RsaKeyPair structure and "ECC521" for key agreement scenario testing,expect a successful return.
     * @tc.desc use the RsaKeyPair structure to create AsyKeyGenerator object
     * a key type of "ECC521" to create KeyAgreement object
     */
    it(
      "Security_CryptoFramework_KeyAgreement_Func_0500",
      0,
      async function (done) {
        await asyPromise
          .keyAgreementBySpecProcess(
            asyCommon.genRsa2048KeyPairSpec(),
            "ECC521"
          )
          .then((data) => {
            expect(data == null).assertTrue();
          })
          .catch((err) => {
            console.error(
              "AsyPromise keyAgreementBySpecProcess catch error: " + err
            );
            expect(err.code).assertEqual(401);
          });
        done();
      }
    );
  });
}
