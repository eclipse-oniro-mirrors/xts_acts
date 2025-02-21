// @ts-nocheck
/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { testSecurityRandomPromise } from "./utils/securityrandom/publicSecurityRandomPromise";
import {
  testSecurityRandomCallback,
  testSecurityRandomLengthCallback,
  testSecurityRandomCallbackSeed,
} from "./utils/securityrandom/publicSecurityRandomCallback";
import { testSecurityRandomEnumCommon } from "./utils/securityrandom/publicSecurityRandomCommon";

export default function SecurityRandomJsunit() {
  describe("SecurityRandomJsunit", function () {
    console.info("##########start SecurityRandomJsunit##########");
    beforeAll(function () {});
    afterEach(function () {});

    /**
     * @tc.number Security_crypto_framework_Random_0100
     * @tc.name support security random and set random seed
     * @tc.desc the length of random is 32, use promise style of interface
     */
    it("Security_crypto_framework_Random_0100", 0, async function (done) {
      await testSecurityRandomPromise(32)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_Random_0200
     * @tc.name Support setting random number seed and restart encryption and decryption framework
     * @tc.desc the length of random is 32, use callback style of interface
     */
    it("Security_crypto_framework_Random_0200", 0, async function (done) {
      await testSecurityRandomCallback(32)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_Random_0300
     * @tc.name Support generating safe random numbers and setting the length of random numbers
     * @tc.desc use callback style of interface
     */
    it("Security_crypto_framework_Random_0300", 0, async function (done) {
      await testSecurityRandomLengthCallback(0)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await testSecurityRandomLengthCallback(null)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await testSecurityRandomLengthCallback(-1)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await testSecurityRandomLengthCallback(2147483647)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_Random_0400
     * @tc.name Support generating safe random numbers and setting random number seed exceptions
     * @tc.desc use callback style of interface
     */
    it("Security_crypto_framework_Random_0400", 0, async function (done) {
      await testSecurityRandomCallbackSeed(null)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await testSecurityRandomCallbackSeed(0)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await testSecurityRandomCallbackSeed(2147483647)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_Random_0500
     * @tc.name test enumerated values
     * @tc.desc cover 100% Enumerated values
     */
    it("Security_crypto_framework_Random_0500", 0, async function (done) {
      testSecurityRandomEnumCommon();
      done();
    });
  });
}
