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
} from "./utils/digestalgorithm/publicDigestPromise";
import {
  testHMACDigestCallback,
  testMDDigestCallback,
  testMDDigestCallbackLen,
} from "./utils/digestalgorithm/publicDigestCallback";

import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array } from "./utils/common/publicDoString";

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
     * @tc.desc Input SHA5
     */
    it("Security_crypto_framework_MD_0700", 0, async function (done) {
      try {
        cryptoFramework.createMd("SHA5");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_crypto_framework_MD_0800
     * @tc.name The encryption and decryption framework supports MD calculation, and the algorithm parameter is NULL
     * @tc.desc Input null
     */
    it("Security_crypto_framework_MD_0800", 0, async function (done) {
      try {
        cryptoFramework.createMd(null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
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
      let mdGenerator = cryptoFramework.createMd("SHA224");
      try {
        await new Promise((resolve, reject) => {
          mdGenerator.update(null, (err) => {
            if (err) {
              reject(err);
            } else {
              resolve();
            }
          });
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await mdGenerator.update(0);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await mdGenerator.digest();
      } catch (err) {
        console.error("err is " + err.code);
        expect(err.code).assertEqual(401);
      }
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
      try {
        cryptoFramework.createMac("SHA5");
        expect(null).assertFail();
      } catch (err) {
        console.error(
          "[Promise]: error code: " + err.code + ", message is: " + err.message
        );
        expect(err.code).assertEqual(401);
      }
      try {
        cryptoFramework.createMac(null);
        expect(null).assertFail();
      } catch (err) {
        console.error(
          "[Promise]: error code: " + err.code + ", message is: " + err.message
        );
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0700
     * @tc.name The encryption and decryption framework supports HMAC calculation, and the key algorithm parameters are abnormal
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0700", 0, async function (done) {
      let globalHMAC = cryptoFramework.createMac("SHA512");
      let globalsymKeyGenerator =
        cryptoFramework.createAsyKeyGenerator("RSA1024|PRIMES_2");
      let key = globalsymKeyGenerator.generateKeyPair();
      try {
        await globalHMAC.init(key);
        expect(null).assertFail();
      } catch (err) {
        console.error(
          "[Promise]init(key): error code: " +
            err.code +
            ", message is: " +
            err.message
        );
        expect(err.code).assertEqual(401);
      }
      try {
        await globalHMAC.init(null);
        expect(null).assertFail();
      } catch (err) {
        console.error(
          "[Promise]init(null): error code: " +
            err.code +
            ", message is: " +
            err.message
        );
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0800
     * @tc.name The encryption and decryption framework supports HMAC calculation, and the Datablob of HMAC to be calculated is abnormal
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0800", 0, async function (done) {
      let globalHMAC = cryptoFramework.createMac("SHA512");
      let globalsymKeyGenerator =
        cryptoFramework.createSymKeyGenerator("3DES192");
      let key = await globalsymKeyGenerator.generateSymKey();
      await globalHMAC.init(key);
      try {
        await globalHMAC.update(null);
        expect(null).assertFail();
      } catch (err) {
        console.error(
          "[Promise]init(null): error code: " +
            err.code +
            ", message is: " +
            err.message
        );
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number Security_crypto_framework_HMAC_0900
     * @tc.name The encryption and decryption framework supports HMAC calculation, and the Datablob of HMAC to be calculated is very large
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_HMAC_0900", 0, async function (done) {
      let globalText = "";
      let t = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz0123456789";
      for (let i = 0; i < 10000; i++) {
        globalText += t.charAt(Math.floor(Math.random() * t.length));
      }
      console.log("Datablob = " + globalText);
      let inBlob = {
        data: stringTouInt8Array(globalText),
      };
      try {
        let macObj = cryptoFramework.createMac("SHA512");
        let symKeyGenerator = cryptoFramework.createSymKeyGenerator("3DES192");
        let symKey = await symKeyGenerator.generateSymKey();
        await macObj.init(symKey);
        await macObj.update(inBlob);
        await macObj.doFinal();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });
  });
}
