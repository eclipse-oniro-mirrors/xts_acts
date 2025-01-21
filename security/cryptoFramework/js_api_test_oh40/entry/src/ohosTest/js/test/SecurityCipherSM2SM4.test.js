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

import { describe, beforeAll, afterEach, it, expect, afterAll, } from "@ohos/hypium";
import * as asyPromise from "./utils/asymmetric/publicAsymmetricPromise";
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import * as symPromise from "./utils/symmetric/publicSymmetricPromise";
import * as symCallback from "./utils/symmetric/publicSymmetricCallback";
import * as asyCommon from "./utils/asymmetric/publicAsymmetricCommon";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function SecurityCipherSM2SM4Jsunit() {
    describe("SecurityCipherSM2SM4Jsunit", function () {
        console.log("##########start SecurityCipherSM2SM4Jsunit##########");
        var symKeyPairSM4;
        beforeAll(async function () {

            async function genSymKeyPair() {
                try {
                    let symGenerator = asyCommon.createSymKeyGenerator("SM4_128");
                    let symKeyPair = await symGenerator.generateSymKey();
                    return symKeyPair;
                } catch (err) {
                    return err;
                }
            }
            symKeyPairSM4 = await genSymKeyPair();
        });

        afterAll(function () {
        });

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0100
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CTR|NoPadding", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0100",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4,
            "SM4_128|CTR|NoPadding"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0100 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0200
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CTR|PKCS5", Use the Callback Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0200",
      0,
      async function (done) {
        await symCallback
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4_128|CTR|PKCS5")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0200 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0300
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CTR|PKCS7", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0300",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4_128|CTR|PKCS7")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0300 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0400
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|ECB|NoPadding", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0400",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4,
            "SM4_128|ECB|NoPadding"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0400 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0500
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|ECB|PKCS5", Use the Callback Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0500",
      0,
      async function (done) {
        await symCallback
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4_128|ECB|PKCS5")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0500 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0600
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|ECB|PKCS7", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0600",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4_128|ECB|PKCS7")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0600 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0700
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CBC|NoPadding", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0700",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4,
            "SM4_128|CBC|NoPadding"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0700 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0800
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CBC|PKCS5", Use the Callback Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0800",
      0,
      async function (done) {
        await symCallback
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4_128|CBC|PKCS5")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0800 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_0900
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CBC|PKCS7", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_0900",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4_128|CBC|PKCS7")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_0900 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1000
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|OFB|NoPadding", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1000",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4,
            "SM4_128|OFB|NoPadding"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1000 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1100
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|OFB|PKCS5", Use the Callback Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1100",
      0,
      async function (done) {
        await symCallback
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4_128|OFB|PKCS5")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1100 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1200
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|OFB|PKCS7", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1200",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4_128|OFB|PKCS7")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1200 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1300
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CFB|NoPadding", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1300",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4,
            "SM4_128|CFB|NoPadding"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1300 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1400
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CFB|PKCS5", Use the Callback Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1400",
      0,
      async function (done) {
        await symCallback
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4_128|CFB|PKCS5")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1400 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1500
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CFB|PKCS5", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1500",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4_128|CFB|PKCS7")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1500 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1600
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CFB128|NoPadding", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1600",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4,
            "SM4_128|CFB128|NoPadding"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1600 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1700
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CFB128|PKCS5", Use the Callback Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1700",
      0,
      async function (done) {
        await symCallback
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4,
            "SM4_128|CFB128|PKCS5"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1700 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1800
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4_128|CFB128|PKCS7", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1800",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(
            symKeyPairSM4,
            "SM4_128|CFB128|PKCS7"
          )
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1800 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_1900
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM4|ECB|PKCS7", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_1900",
      0,
      async function (done) {
        await symPromise
          .encryptAndDecryptNormalSM4Process(symKeyPairSM4, "SM4|ECB|PKCS7")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_1900 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2000
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM2_256|C1C3C2|MD5", Use the Callback Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2000",
      0,
      async function (done) {
        await asyCallback
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|C1C3C2|MD5")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2000 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2100
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM2_256|SM3", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2100",
      0,
      async function (done) {
        await asyPromise
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|SM3")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2100 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2200
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM2_256|C1C3C2|SHA1", Use the Callback Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2200",
      0,
      async function (done) {
        await asyCallback
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|C1C3C2|SHA1")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2200 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2300
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM2_256|SHA224", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2300",
      0,
      async function (done) {
        await asyPromise
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|SHA224")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2300 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2400
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM2_256|C1C3C2||SHA256", Use the Callback Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2400",
      0,
      async function (done) {
        await asyCallback
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|C1C3C2|SHA256")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2400 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2500
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM2_256|SHA384", Use the Promise Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2500",
      0,
      async function (done) {
        await asyPromise
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|SHA384")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2500 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2600
     * @tc.name Encryption and decryption scenario testing
     * @tc.desc the asyAlgoName is "SM2_256|C1C3C2|SHA512", Use the Callback Style of Interface
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2600",
      0,
      async function (done) {
        await asyCallback
          .encryptAndDecryptNormalProcess("SM2_256", "SM2_256|C1C3C2|SHA512")
          .then((result) => {
            expect(result).assertTrue();
          })
          .catch((err) => {
            console.error(
              "Security_CryptoFramework_CipherSMX_Func_2600 catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2700
     * @tc.name create cipher failed
     * @tc.desc Pass in an exception parameter null and call it as a async
     * @tc.desc Pass in an exception parameter "SM2257|SHA256" and call it as a async
     * @tc.desc Pass in an exception parameter "SM2_256|SHA257" and call it as a async
     * @tc.desc Pass in an exception parameter "SM2_256|C1C2C3|SHA512" and call it as a async
     * @tc.desc Pass in an exception parameter "SM4_192|CFB|PKCS5" and call it as a async
     * @tc.desc Pass in an exception parameter "SM4_256|CFB|PKCS5" and call it as a async
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2700",
      0,
      async function (done) {
        try {
          await cryptoFramework.createCipher(null);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
        try {
          await cryptoFramework.createCipher("SM2257|SHA256");
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(801);
        }
        try {
          await cryptoFramework.createCipher("SM2_256|SHA257");
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(801);
        }
        try {
          await cryptoFramework.createCipher("SM2_256|NoHash");
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
        try {
          await cryptoFramework.createCipher("SM2_256|C1C2C3|SHA512");
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(801);
        }
        try {
          await cryptoFramework.createCipher("SM4_192|CFB|PKCS5");
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(801);
        }
        try {
          await cryptoFramework.createCipher("SM4_256|CFB|PKCS5");
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2800
     * @tc.name create SymKeyGenerator failed
     * @tc.desc Pass in an exception parameter null and call it as a async
     * @tc.desc Pass in an exception parameter "SM2_256|SHA257" and call it as a async
     * @tc.desc Pass in an exception parameter "SM2257|SHA256" and call it as a async
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2800",
      0,
      async function (done) {
        try {
          await cryptoFramework.createSymKeyGenerator(null);
          expect(null).assertFail();
        } catch (err) {
          console.error("createCipherFail catch error: " + err);
          expect(err.code).assertEqual(401);
        }
        try {
          await cryptoFramework.createSymKeyGenerator("SM2_256|SHA257");
          expect(null).assertFail();
        } catch (err) {
          console.error("createCipherFail catch error: " + err);
          expect(err.code).assertEqual(801);
        }
        try {
          await cryptoFramework.createSymKeyGenerator("SM2257|SHA256");
          expect(null).assertFail();
        } catch (err) {
          console.error("createCipherFail catch error: " + err);
          expect(err.code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_2900
     * @tc.name init cipher failed
     * @tc.desc Pass in three exception parameters null and symKeyPair and null, and call them as async
     * @tc.desc Pass in three exception parameters encryptMode and null and null, and call them as async
     * @tc.desc Pass in four exception parameters 3 and symKeyPair and null and symKeyPair, and call them as async
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_2900",
      0,
      async function (done) {
        let cipherGeneratorEncrypt =
          cryptoFramework.createCipher("SM4_128|CTR|PKCS7");
        let encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
        try {
          await cipherGeneratorEncrypt.init(null, symKeyPairSM4, null);
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_CipherSMX_Func_2900 1 catch err" +
              err.code
          );
          expect(err.code).assertEqual(401);
        }
        try {
          await cipherGeneratorEncrypt.init(encryptMode, null, null);
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_CipherSMX_Func_2900 2 catch err" +
              err.code
          );
          expect(err.code).assertEqual(401);
        }
        try {
          await cipherGeneratorEncrypt.init(
            3,
            symKeyPairSM4,
            null,
            symKeyPairSM4
          );
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_CipherSMX_Func_2900 3 catch err" +
              err.code
          );
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_3000
     * @tc.name update cipher failed
     * @tc.desc The encrypt object was not initialized, and the data to be signed "This is a sign test"
     * was passed in as a promise to be called
     * @tc.desc Call it as a promise without passing in parameters
     * @tc.desc Pass in an exception parameter null and call it as a promise
     * @tc.desc Pass in two exception parameters "This is a cipher test" and "This is a cipher test"
     * and call them as promise
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_3000",
      0,
      async function (done) {
        let cipherGenerator = cryptoFramework.createCipher(
          "SM4_128|CTR|NoPadding"
        );
        let encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
        let globalText = "This is a cipher test";
        let arr = [];
        for (var i = 0, j = globalText.length; i < j; ++i) {
          arr.push(globalText.charCodeAt(i));
        }
        let input = {
          data: new Uint8Array(arr),
        };
        try {
          await new Promise((resolve, reject) => {
            cipherGenerator.update(input, (err, data) => {
              if (err) {
                reject(err);
              } else {
                resolve(data);
              }
            });
          });
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
        await cipherGenerator.init(encryptMode, symKeyPairSM4, null);
        try {
          await new Promise((resolve, reject) => {
            cipherGenerator.update((err, data) => {
              if (err) {
                reject(err);
              } else {
                resolve(data);
              }
            });
          });
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
        try {
          await cipherGenerator.update(null);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
        try {
          await cipherGenerator.update(input, input);
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_3100
     * @tc.name doFinal cipher failed
     * @tc.desc The encrypt object was not initialized, and the data to be signed 'This is a sign test'
     * was passed in as a callback to be called
     * @tc.desc Call it as a callback without passing in parameters
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_3100",
      0,
      async function (done) {
        let cipherGenerator = cryptoFramework.createCipher(
          "SM4_128|CTR|NoPadding"
        );
        let encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
        let globalText = "This is a cipher test";
        let arr = [];
        for (var i = 0, j = globalText.length; i < j; ++i) {
          arr.push(globalText.charCodeAt(i));
        }
        let input = {
          data: new Uint8Array(arr),
        };
        try {
          await new Promise((resolve, reject) => {
            cipherGenerator.doFinal(input, (err, data) => {
              if (err) {
                reject(err);
              } else {
                resolve(data);
              }
            });
          });
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
        await cipherGenerator.init(encryptMode, symKeyPairSM4, null);
        try {
          await new Promise((resolve, reject) => {
            cipherGenerator.doFinal((err, data) => {
              if (err) {
                reject(err);
              } else {
                resolve(data);
              }
            });
          });
          expect(null).assertFail();
        } catch (err) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_3200
     * @tc.name create SymKeyGenerator failed
     * @tc.desc Pass in an exception parameter "SM4_257|SHA256" and call it as a async
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_3200",
      0,
      async function (done) {
        try {
          await cryptoFramework.createSymKeyGenerator("SM4_257|SHA256");
          expect(null).assertFail();
        } catch (err) {
          console.error("createCipherFail catch error: " + err);
          expect(err.code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.number Security_CryptoFramework_CipherSMX_Func_3300
     * @tc.name Encryption and decryption algorithm for obtaining signatures
     * @tc.desc Pass in algorithm name "SM2_256|SM3" and call it using the async method
     */
    it(
      "Security_CryptoFramework_CipherSMX_Func_3300",
      0,
      async function (done) {
        try {
          let cipherGenerator = cryptoFramework.createCipher("SM2_256|SM3");
          expect(cipherGenerator.algName == "SM2_256|SM3").assertTrue();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_CipherSMX_Func_3300 catch err: " + err
          );
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );
  });
}
