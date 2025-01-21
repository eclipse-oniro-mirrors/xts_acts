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
import {
  testHMACDigestPromise,
  testMDDigestPromise,
  testHMACErrorAlgorithm,
  testHMACDigestPromiseErrorKey,
  testHMACDigestPromiseDatablobNull,
  testHMACDigestPromiseDatablobLong,
} from "./utils/digestalgorithm/publicDigestPromise";
import {
  testHMACDigestCallback,
  testMDDigestCallback,
  testMDErrorAlgorithm,
  testMDErrorAlgorithmNull,
  testMDDigestCallbackLen,
  testMDDigestCallbackLenNull,
} from "./utils/digestalgorithm/publicDigestCallback";

export default function DigestAlgorithmJsunit() {
  describe("DigestAlgorithmJsunit", function () {
    console.info("##########start DigestAlgorithmJsunit##########");
    beforeAll(function () {});
    afterEach(function () {});

    /**
     * @tc.number Security_crypto_framework_MD_0100
     * @tc.name Test MD5 for MD digest algotithm
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_MD_0100", 0, async function (done) {
      await testMDDigestPromise("MD5")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_0200
     * @tc.name Test SHA1 for MD digest algotithm
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_MD_0200", 0, async function (done) {
      await testMDDigestPromise("SHA1")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_0300
     * @tc.name Test SHA224 for MD digest algotithm
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_MD_0300", 0, async function (done) {
      await testMDDigestPromise("SHA224")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_0400
     * @tc.name Test SHA256 for MD digest algotithm
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_MD_0400", 0, async function (done) {
      await testMDDigestCallback("SHA256")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_0500
     *
     * @tc.name Test SHA384 for MD digest algotithm
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_MD_0500", 0, async function (done) {
      await testMDDigestCallback("SHA384")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_0600
     * @tc.name Test SHA512 for MD digest algotithm
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_MD_0600", 0, async function (done) {
      await testMDDigestCallback("SHA512")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_0700
     * @tc.name The encryption and decryption framework supports MD calculation, and the algorithm parameters are abnormal
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_MD_0700", 0, async function (done) {
      await testMDErrorAlgorithm("SHA5")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_0800
     * @tc.name The encryption and decryption framework supports MD calculation, and the algorithm parameter is NULL
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_MD_0800", 0, async function (done) {
      await testMDErrorAlgorithmNull(null)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_0900
     * @tc.name The encryption and decryption framework supports MD calculation, and the Datablob value to be calculated is a super large value
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_MD_0900", 0, async function (done) {
      await testMDDigestCallbackLen("SHA224", 10000)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_1000
     * @tc.name The encryption and decryption framework supports MD calculation, and the Datablob value to be calculated is abnormal
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_MD_1000", 0, async function (done) {
      await testMDDigestCallbackLenNull("SHA224")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0100
     * @tc.name Test SHA1 for HMAC digest algorithm
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_HMAC_0100", 0, async function (done) {
      await testHMACDigestCallback("SHA1", "AES128")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0200
     * @tc.name Test SHA224 for HMAC digest algorithm
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0200", 0, async function (done) {
      await testHMACDigestPromise("SHA224", "AES192")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0300
     * @tc.name Test SHA256 for HMAC digest algorithm
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_HMAC_0300", 0, async function (done) {
      await testHMACDigestCallback("SHA256", "AES256")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0400
     * @tc.name Test SHA384 for HMAC digest algorithm
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0400", 0, async function (done) {
      await testHMACDigestPromise("SHA384", "3DES192")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0500
     * @tc.name Test SHA512 for HMAC digest algorithm
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0500", 0, async function (done) {
      await testHMACDigestPromise("SHA512", "3DES192")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0600
     * @tc.name The encryption and decryption framework supports HMAC calculation, and HMAC algorithm parameters are abnormal
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0600", 0, async function (done) {
      await testHMACErrorAlgorithm("SHA5", null)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0700
     * @tc.name The encryption and decryption framework supports HMAC calculation, and the key algorithm parameters are abnormal
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0700", 0, async function (done) {
      await testHMACDigestPromiseErrorKey("SHA512", "RSA1024|PRIMES_2")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0800
     * @tc.name The encryption and decryption framework supports HMAC calculation, and the Datablob of HMAC to be calculated is abnormal
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0800", 0, async function (done) {
      await testHMACDigestPromiseDatablobNull("SHA512", "3DES192")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0900
     * @tc.name The encryption and decryption framework supports HMAC calculation, and the Datablob of HMAC to be calculated is very large
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0900", 0, async function (done) {
      await testHMACDigestPromiseDatablobLong("SHA512", "3DES192", 10000)
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });
  });
}
