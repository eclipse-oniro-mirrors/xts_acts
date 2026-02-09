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

import { describe, beforeAll, afterEach, it, TestType, Size, Level, expect } from "@ohos/hypium";
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import * as asyPromise from "./utils/asymmetric/publicAsymmetricPromise";
import * as common from "./utils/common/publicDoSpec";
import * as asyCommon from "./utils/asymmetric/publicAsymmetricCommon";
import * as symPromise from "./utils/symmetric/publicSymmetricPromise";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function SecurityCipherJsunit() {
    describe("SecurityCipherJsunit", function () {
        console.log("##########start SecurityCipherJsunit##########");
        var gKeyPairSpec;
        beforeAll(async function () {

            async function genRsa2048KeyPairSpec() {
                try {
                    let asyKeySpec = common.genRsa2048KeyPairSpec();
                    let specGenerator = asyCommon.createAsyKeyGeneratorBySpec(asyKeySpec);
                    let specKeyPair = await specGenerator.generateKeyPair();
                    return specKeyPair;
                } catch (err) {
                    return err;
                }
            }
            gKeyPairSpec = await genRsa2048KeyPairSpec();
        });
        afterEach(async function () {
        });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0100
     * @tc.number Security_CryptoFramework_Cipher_Func_0100
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA1", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyPromise
        .encryptAndDecryptBySpecProcess(gKeyPairSpec, "RSA|PKCS1")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0100 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0200
     * @tc.number Security_CryptoFramework_Cipher_Func_0200
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA224", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyPromise
        .encryptAndDecryptBySpecProcess(gKeyPairSpec, "RSA|PKCS1|SHA224")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0200 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0300
     * @tc.number Security_CryptoFramework_Cipher_Func_0300
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA256", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyCallback
        .encryptAndDecryptBySpecProcess(gKeyPairSpec, "RSA|PKCS1|SHA256")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0300 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0400
     * @tc.number Security_CryptoFramework_Cipher_Func_0400
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA384", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyPromise
        .encryptAndDecryptBySpecProcess(gKeyPairSpec, "RSA|PKCS1|SHA384")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0400 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0500
     * @tc.number Security_CryptoFramework_Cipher_Func_0500
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA512", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyCallback
        .encryptAndDecryptBySpecProcess(gKeyPairSpec, "RSA|PKCS1|SHA512")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0500 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0600
     * @tc.number Security_CryptoFramework_Cipher_Func_0600
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|MD5", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyPromise
        .encryptAndDecryptBySpecProcess(gKeyPairSpec, "RSA|PKCS1|MD5")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0600 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0700
     * @tc.number Security_CryptoFramework_Cipher_Func_0700
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_SHA1", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyCallback
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec,
          "RSA|PKCS1_OAEP|SHA1|MGF1_SHA1"
        )
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0700 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0800
     * @tc.number Security_CryptoFramework_Cipher_Func_0800
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_SHA224", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyPromise
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec,
          "RSA|PKCS1_OAEP|SHA1|MGF1_SHA224"
        )
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0800 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_0900
     * @tc.number Encrypt_And_Decrypt_Test_0900
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_SHA256", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyCallback
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec,
          "RSA|PKCS1_OAEP|SHA1|MGF1_SHA256"
        )
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_0900 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1000
     * @tc.number Security_CryptoFramework_Cipher_Func_1000
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_SHA384", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyPromise
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec,
          "RSA|PKCS1_OAEP|SHA1|MGF1_SHA384"
        )
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1000 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1100
     * @tc.number Security_CryptoFramework_Cipher_Func_1100
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_SHA512", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyCallback
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec,
          "RSA|PKCS1_OAEP|SHA1|MGF1_SHA512"
        )
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1100 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1200
     * @tc.number Security_CryptoFramework_Cipher_Func_1200
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA1|MGF1_MD5", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyPromise
        .encryptAndDecryptBySpecProcess(
          gKeyPairSpec,
          "RSA|PKCS1_OAEP|SHA1|MGF1_MD5"
        )
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1200 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1300
     * @tc.number Security_CryptoFramework_Cipher_Func_1300
     * @tc.desc   the asyAlgoName is "RSA|PKCS1|SHA256", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyCallback
        .encryptAndDecryptNormalProcess("RSA1024|PRIMES_2", "RSA|PKCS1|SHA256")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1300 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1400
     * @tc.number Security_CryptoFramework_Cipher_Func_1400
     * @tc.desc   the asyAlgoName is "AES|ECB|PKCS7", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await symPromise
        .encryptAndDecryptNormalProcess("AES256", "AES|ECB|PKCS7", "null")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1400 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1500
     * @tc.number Security_CryptoFramework_Cipher_Func_1500
     * @tc.desc   the asyAlgoName is "3DES|ECB|PKCS5", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await symPromise
        .encryptAndDecryptNormalProcess("3DES192", "3DES|ECB|PKCS5", "null")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_1500 catch  error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1600
     * @tc.number Security_CryptoFramework_Cipher_Func_1600
     * @tc.desc   Pass in an exception parameter "ECC128|GCM|PKCS7" and call it as a async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        cryptoFramework.createCipher(null);
        expect(null).assertFail();
      } catch (err) {
        console.error("createCipherFail catch  error: " + err.code);
        expect(err.code).assertEqual(401);
      }
      try {
        cryptoFramework.createCipher("ECC128|GCM|PKCS7");
        expect(null).assertFail();
      } catch (err) {
        console.error("createCipherFail catch  error: " + err.code);
        expect(err.code).assertEqual(801);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1700
     * @tc.number Security_CryptoFramework_Cipher_Func_1700
     * @tc.desc   Third input null key and null params for Promise interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let asyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024");
      let cipherGeneratorEncrypt = cryptoFramework.createCipher(
        "RSA1024|PKCS1|SHA256"
      );
      let encryptMode = cryptoFramework.CryptoMode.ENCRYPT_MODE;
      let keyPair = await asyGenerator.generateKeyPair();
      try {
        await cipherGeneratorEncrypt.init(3, keyPair.priKey, null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await new Promise((resolve, reject) => {
          cipherGeneratorEncrypt.init(null, keyPair.priKey, null, (err) => {
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
        await cipherGeneratorEncrypt.init(encryptMode, null, null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1800
     * @tc.number Security_CryptoFramework_Cipher_Func_1800
     * @tc.desc   Third input empty parameter with  AsyncCallback interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let symKeyGenerator = cryptoFramework.createSymKeyGenerator("3DES192");
      let symKey = await symKeyGenerator.generateSymKey();
      let cipherGenerator = cryptoFramework.createCipher("3DES|ECB|PKCS5");
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
      await cipherGenerator.init(encryptMode, symKey, null);
      try {
        await cipherGenerator.update(null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
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
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_1900
     * @tc.number Security_CryptoFramework_Cipher_Func_1900
     * @tc.desc   Third input empty parameter with  AsyncCallback interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let cipherGenerator = cryptoFramework.createCipher(
        "RSA1024|PKCS1|SHA256"
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
      await cipherGenerator.init(encryptMode, gKeyPairSpec.pubKey, null);
      try {
        await cipherGenerator.doFinal(null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
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
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_2000
     * @tc.number Security_CryptoFramework_Cipher_Func_2000
     * @tc.desc   the itemType is OAEP_MGF1_PSRC_UINT8ARR, Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyCallback
        .encryptSetAndGetSpecInitProcess(
          gKeyPairSpec,
          "RSA|PKCS1_OAEP|SHA256|MGF1_SHA1"
        )
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_2000 catch error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_2100
     * @tc.number Security_CryptoFramework_Cipher_Func_2100
     * @tc.desc   the itemType is OAEP_MGF1_PSRC_UINT8ARR, Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await asyPromise
        .encryptInitSetAndGetSpecProcess(
          gKeyPairSpec,
          "RSA|PKCS1_OAEP|SHA256|MGF1_SHA1"
        )
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_Cipher_Func_2100 catch error: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_2200
     * @tc.number Security_CryptoFramework_Cipher_Func_2200
     * @tc.desc   Pass in exception parameter mode cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let cipherGenerator = cryptoFramework.createCipher(
        "RSA|PKCS1_OAEP|SHA256|MGF1_SHA1"
      );
      try {
        cipherGenerator.setCipherSpec(
          cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
          null
        );
        expect(null).assertFail();
      } catch (err) {
        console.log("Security_CryptoFramework_Cipher_Func_2200 1 err" + err);
        expect(err.code).assertEqual(401);
      }

      try {
        cipherGenerator.setCipherSpec(
          cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
          12456
        );
        expect(null).assertFail();
      } catch (err) {
        console.log("Security_CryptoFramework_Cipher_Func_2200 2 err" + err);
        expect(err.code).assertEqual(401);
      }

      try {
        cipherGenerator.setCipherSpec(
          cryptoFramework.CipherSpecItem.OAEP_MGF1_PSRC_UINT8ARR,
          "asdfr"
        );
        expect(null).assertFail();
      } catch (err) {
        console.log("Security_CryptoFramework_Cipher_Func_2200 3 err" + err);
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_2300
     * @tc.number Security_CryptoFramework_Cipher_Func_2300
     * @tc.desc   Pass in exception parameter mode 303, and call it synchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let cipherGeneratorEncrypt =
        cryptoFramework.createCipher("RSA1024|PKCS1");
      try {
        cipherGeneratorEncrypt.getCipherSpec(303);
        expect(null).assertFail();
      } catch (err) {
        console.log(
          "Security_CryptoFramework_Cipher_Func_2300 1 catch err" + err
        );
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_Cipher_Func_2400
     * @tc.number Security_CryptoFramework_Cipher_Func_2400
     * @tc.desc   the asyAlgoName is "RSA|PKCS1_OAEP|SHA256|MGF1_SHA1", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_Cipher_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let cipherGeneratorEncrypt =
          cryptoFramework.createCipher("RSA1024|PKCS1");
        expect(cipherGeneratorEncrypt.algName == "RSA1024|PKCS1").assertTrue();
      } catch (err) {
        console.log(
          "Security_CryptoFramework_Cipher_Func_2400 catch err" + err
        );
        expect(err.code).assertEqual(401);
      }
      done();
    });
  });
}
