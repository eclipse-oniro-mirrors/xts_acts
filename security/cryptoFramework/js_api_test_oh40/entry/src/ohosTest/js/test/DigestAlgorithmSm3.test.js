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
import * as DigPromise from "./utils/digestalgorithm/publicDigestPromise";
import * as DigCallback from "./utils/digestalgorithm/publicDigestCallback";
import cryptoFramework from "@ohos.security.cryptoFramework";

import { stringTouInt8Array, uInt8ArrayToShowStr, } from "./utils/common/publicDoString";

export default function DigestAlgorithmSm3Jsunit() {
    describe("DigestAlgorithmSm3Jsunit", function () {
        console.info("##########start DigestAlgorithmSm3Jsunit##########");
        beforeAll(function () {
        });
        afterEach(function () {
        });

    /**
     * @tc.name   Security_CryptoFramework_MDSM3_Func_0100
     * @tc.number Security_CryptoFramework_MDSM3_Func_0100
     * @tc.desc   the asyAlgoName is "SM3", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_MDSM3_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await DigPromise.testMDDigestPromise("SM3")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error(
            "Security_CryptoFramework_MDSM3_Func_0100 catch err: " + err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_MDSM3_Func_0200
     * @tc.number Security_CryptoFramework_MDSM3_Func_0200
     * @tc.desc   the asyAlgoName is "SM4", Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_MDSM3_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        cryptoFramework.createMd("SM4");
        expect(null).assertFail();
      } catch (err) {
        console.error("CreateMd catch err: " + err);
        expect(err.code).assertEqual(401);
      }
      done();
    });

        /**
         * @tc.name   Security_CryptoFramework_MDSM3_Func_0300
         * @tc.number Security_CryptoFramework_MDSM3_Func_0300
         * @tc.desc   the asyAlgoName is "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz" take 10000 characters,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Security_CryptoFramework_MDSM3_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let globalMd;
            let globalText;
            let t = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            let n = t.length;
            for (let i = 0; i < 10000; i++) {
                globalText += t.charAt(Math.floor(Math.random() * n));
            }
            console.log("Datablob = " + globalText);
            let ginBlob = {
                data: stringTouInt8Array(globalText)
            };

      try {
        let result = await new Promise((resolve, reject) => {
          globalMd = cryptoFramework.createMd("SM3");
          console.log("Md= " + globalMd);
          console.log("MD algName is: " + globalMd.algName);

          globalMd
            .update(ginBlob)
            .then(() => {
              return globalMd.digest();
            })
            .then((digestBlob) => {
              console.log(
                "Digest result: " + uInt8ArrayToShowStr(digestBlob.data)
              );
              let mdLen = globalMd.getMdLength();
              console.log("Md len: " + mdLen);
              if (digestBlob != null && mdLen != 0 && mdLen != null) {
                resolve(true);
              } else {
                resolve(false);
              }
            })
            .catch((err) => {
              console.error("testMDDigestCallback catch error: " + err);
              reject(err);
            });
        });
        expect(result).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_MDSM3_Func_0400
     * @tc.number Security_CryptoFramework_MDSM3_Func_0400
     * @tc.desc   Pass in an exception parameter null and call it as a Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_MDSM3_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let globalMd;
      globalMd = cryptoFramework.createMd("SM3");
      console.log("MD algName is: " + globalMd.algName);
      try {
        await new Promise((resolve, reject) => {
          globalMd.update((err) => {
            if (err) {
              console.error(
                "Security_CryptoFramework_MDSM3_Func_0400 catch 1 error is " +
                  err
              );
              reject(err);
            } else {
              resolve("update success");
            }
          });
        });
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      try {
        await new Promise((resolve, reject) => {
          globalMd.update(null, (err) => {
            if (err) {
              console.error(
                "Security_CryptoFramework_MDSM3_Func_0400 catch 2 error is " +
                  err
              );
              reject(err);
            } else {
              resolve("update success");
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
     * @tc.name   Security_CryptoFramework_MDSM3_Func_0500
     * @tc.number Security_CryptoFramework_MDSM3_Func_0500
     * @tc.desc   The md object was not initialized, and obtain calculation result sand call them as async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_MDSM3_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let globalMd;

      try {
        let result = await new Promise((resolve, reject) => {
          globalMd = cryptoFramework.createMd("SM3");
          console.log("Md= " + globalMd);
          console.log("MD algName is: " + globalMd.algName);

          globalMd
            .digest()
            .then((digestBlob) => {
              console.log(
                "Digest result: " + uInt8ArrayToShowStr(digestBlob.data)
              );
              if (digestBlob != null) {
                resolve(true);
              } else {
                resolve(false);
              }
            })
            .catch((err) => {
              console.error("testMDDigest catch err: " + err);
              reject(err);
            });
        });
        expect(result).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_MDSM3_Func_0600
     * @tc.number Security_CryptoFramework_MDSM3_Func_0600
     * @tc.desc   the asyAlgoName is "SM3", Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_MDSM3_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let globalMd = cryptoFramework.createMd("SM3");
        expect(globalMd.algName == "SM3").assertTrue();
      } catch (err) {
        console.error("testMDDigest catch err: " + err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_0100
     * @tc.number Security_CryptoFramework_HMACSM3_Func_0100
     * @tc.desc   the asyAlgoName is "AES128", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HMACSM3_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await DigCallback.testHMACDigestCallback("SM3", "AES128")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error("testHMAC catch err: " + err);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_0200
     * @tc.number Security_CryptoFramework_HMACSM3_Func_0200
     * @tc.desc   the asyAlgoName is "AES192", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HMACSM3_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await DigPromise.testHMACDigestPromise("SM3", "AES192")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error("testHMAC catch err: " + err);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_0300
     * @tc.number Security_CryptoFramework_HMACSM3_Func_0300
     * @tc.desc   the asyAlgoName is "AES256", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HMACSM3_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await DigCallback.testHMACDigestCallback("SM3", "AES256")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error("testHMAC catch err: " + err);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_0400
     * @tc.number Security_CryptoFramework_HMACSM3_Func_0400
     * @tc.desc   the asyAlgoName is "3DES192", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HMACSM3_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await DigPromise.testHMACDigestPromise("SM3", "3DES192")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error("testHMAC catch err: " + err);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_0500
     * @tc.number Security_CryptoFramework_HMACSM3_Func_0500
     * @tc.desc   the asyAlgoName is "SM4_128", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HMACSM3_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await DigCallback.testHMACDigestCallback("SM3", "SM4_128")
        .then((result) => {
          expect(result).assertTrue();
        })
        .catch((err) => {
          console.error("testHMAC catch err: " + err);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_0600
     * @tc.number Security_CryptoFramework_HMACSM3_Func_0600
     * @tc.desc   the asyAlgoName is null, Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HMACSM3_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        cryptoFramework.createMac("SHA5");
        expect(null).assertFail();
      } catch (err) {
        console.error("CreateMac catch 1 err: " + err);
        expect(err.code).assertEqual(401);
      }

      try {
        cryptoFramework.createMac(null);
        expect(null).assertFail();
      } catch (err) {
        console.error("CreateMac catch 2 err: " + err);
        expect(err.code).assertEqual(401);
      }
      done();
    });

        /**
         * @tc.name   Security_CryptoFramework_HMACSM3_Func_0700
         * @tc.number Security_CryptoFramework_HMACSM3_Func_0700
         * @tc.desc   the asyAlgoName is "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz" take 10000 characters,
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Security_CryptoFramework_HMACSM3_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let globalHMAC;
            let globalText;
            let globalsymKeyGenerator;
            let t = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz";
            let n = t.length;
            for (let i = 0; i < 10000; i++) {
                globalText += t.charAt(Math.floor(Math.random() * n));
            }
            console.log("Datablob = " + globalText);
            let ginBlob = {
                data: stringTouInt8Array(globalText)
            };
            try {
                let result = await new Promise((resolve, reject) => {
                    globalHMAC = cryptoFramework.createMac("SM3");
                    globalsymKeyGenerator =
                    cryptoFramework.createSymKeyGenerator("AES128");
                    globalsymKeyGenerator
                        .generateSymKey()
                        .then((symKey) => {
                            return globalHMAC.init(symKey);
                        })
                        .then((initData) => {
                            return globalHMAC.update(ginBlob);
                        })
                        .then((updateData) => {
                            return globalHMAC.doFinal();
                        })
                        .then((doFinalBlob) => {
                            let mdLen = globalHMAC.getMacLength();
                            console.log("HMAC HMAC len: " + mdLen);
                            if (doFinalBlob != null && mdLen != 0 && mdLen != null) {
                                resolve(true);
                            } else {
                                resolve(false);
                            }
                        })
                        .catch((err) => {
                            reject(err);
                        });
                });
                expect(result).assertTrue();
            } catch (err) {
                expect(null).assertFail();
            }
            done();
        });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_0800
     * @tc.number Security_CryptoFramework_HMACSM3_Func_0800
     * @tc.desc   Incoming rsa asymmetric key pair, and call them as Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HMACSM3_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      let signGenerator = cryptoFramework.createSign("SM2_256|SM3");
      try {
        await signGenerator.init(null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await signGenerator.init("sroundpriKey");
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      let rsaGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024");
      let rsaKeyPair;
      await new Promise((resolve, reject) => {
        rsaGenerator.generateKeyPair((err, keyPair) => {
          if (err) {
            reject(err);
          } else {
            rsaKeyPair = keyPair;
            resolve();
          }
        });
      });
      try {
        await signGenerator.init(rsaKeyPair.priKey);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

        /**
         * @tc.name   Security_CryptoFramework_HMACSM3_Func_0900
         * @tc.number Security_CryptoFramework_HMACSM3_Func_0900
         * @tc.desc   Pass in two exception parameters "Mac test data" and "Mac test data"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Security_CryptoFramework_HMACSM3_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let globalText = "Mac test data";
            let ginBlob = {
                data: stringTouInt8Array(globalText)
            };
            let globalHMAC = cryptoFramework.createMac("SM3");
            let globalsymKeyGenerator =
            cryptoFramework.createSymKeyGenerator("SM4_128");

      let globalsymKey;
      await new Promise((resolve, reject) => {
        globalsymKeyGenerator.generateSymKey((err, symKey) => {
          if (err) {
            reject(err);
          } else {
            globalsymKey = symKey;
            resolve();
          }
        });
      });
      try {
        await globalHMAC.update(ginBlob);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(17630001);
      }
      await globalHMAC.init(globalsymKey);
      try {
        await globalHMAC.update(null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      try {
        await globalHMAC.update(ginBlob, ginBlob);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_1000
     * @tc.number Security_CryptoFramework_HMACSM3_Func_1000
     * @tc.desc   the asyAlgoName is "SM3", Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_HMACSM3_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      try {
        let globalMac = cryptoFramework.createMd("SM3");
        expect(globalMac.algName == "SM3").assertTrue();
      } catch (err) {
        console.error("MacDigestAlgoName catch err: " + err);
        expect(null).assertFail();
      }
      done();
    });
  });
}
