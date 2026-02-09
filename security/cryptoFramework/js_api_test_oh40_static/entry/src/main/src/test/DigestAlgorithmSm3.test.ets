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
import * as DigPromise from "./utils/digestalgorithm/publicDigestPromise";
import * as DigCallback from "./utils/digestalgorithm/publicDigestCallback";
import cryptoFramework from "@ohos.security.cryptoFramework";

import { stringTouInt8Array, uInt8ArrayToShowStr, } from "./utils/common/publicDoString";

export default function DigestAlgorithmSm3Jsunit() {
  describe("DigestAlgorithmSm3Jsunit", () => {
    console.info("##########start DigestAlgorithmSm3Jsunit##########");
    beforeAll(async () => {
    });

    /**
     * @tc.name   Security_CryptoFramework_MDSM3_Func_0100
     * @tc.number Security_CryptoFramework_MDSM3_Func_0100
     * @tc.desc   the asyAlgoName is "SM3", Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_CryptoFramework_MDSM3_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await DigPromise.testMDDigestPromise("SM3")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
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
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_MDSM3_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        cryptoFramework.createMd("SM4");
        expect(null).assertFail();
      } catch (err) {
        console.error("CreateMd catch err: " + err);
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_MDSM3_Func_0300
     * @tc.number Security_CryptoFramework_MDSM3_Func_0300
     * @tc.desc   the asyAlgoName is "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz" take 10000 characters,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_MDSM3_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let globalMd: cryptoFramework.Md;
      let globalText: string = "";
      let t: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      let n: number = t.length;
      for (let i = 0; i < 10000; i++) {
        globalText += t.charAt((Math.floor(Math.random() * n)).toInt());
      }
      console.log("Datablob = " + globalText);
      let ginBlob: cryptoFramework.DataBlob = {
        data: stringTouInt8Array(globalText)
      };

      try {
        let result = await new Promise<boolean>((resolve, reject) => {
          globalMd = cryptoFramework.createMd("SM3");
          console.log("Md= " + globalMd);
          console.log("MD algName is: " + globalMd.algName);

          await globalMd
            .update(ginBlob)
            .then<cryptoFramework.DataBlob>(() => {
              return globalMd.digest();
            })
            .then((digestBlob: cryptoFramework.DataBlob) => {
              console.log(
                "Digest result: " + uInt8ArrayToShowStr(digestBlob.data)
              );
              let mdLen: int = globalMd.getMdLength();
              console.log("Md len: " + mdLen);
              if (digestBlob != null && mdLen != 0 && mdLen != null) {
                resolve(true);
              } else {
                resolve(false);
              }
            })
            .catch((err: Error) => {
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
     * @tc.name   Security_CryptoFramework_MDSM3_Func_0500
     * @tc.number Security_CryptoFramework_MDSM3_Func_0500
     * @tc.desc   The md object was not initialized, and obtain calculation result sand call them as async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_MDSM3_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let globalMd: cryptoFramework.Md;
      try {
        let result: boolean = await new Promise<boolean>((resolve, reject) => {
          globalMd = cryptoFramework.createMd("SM3");
          console.log("Md= " + globalMd);
          console.log("MD algName is: " + globalMd.algName);

          await globalMd
            .digest()
            .then((digestBlob: cryptoFramework.DataBlob) => {
              console.log(
                "Digest result: " + uInt8ArrayToShowStr(digestBlob.data)
              );
              if (digestBlob != null) {
                resolve(true);
              } else {
                resolve(false);
              }
            })
            .catch((err: Error) => {
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
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_MDSM3_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let globalMd: cryptoFramework.Md = cryptoFramework.createMd("SM3");
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
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_HMACSM3_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await DigCallback.testHMACDigestCallback("SM3", "AES128")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
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
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_HMACSM3_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await DigPromise.testHMACDigestPromise("SM3", "AES192")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
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
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_HMACSM3_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await DigCallback.testHMACDigestCallback("SM3", "AES256")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
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
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_HMACSM3_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await DigPromise.testHMACDigestPromise("SM3", "3DES192")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
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
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_HMACSM3_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await DigCallback.testHMACDigestCallback("SM3", "SM4_128")
        .then((result: boolean) => {
          expect(result).assertTrue();
        })
        .catch((err: Error) => {
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
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_HMACSM3_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        cryptoFramework.createMac("SHA5");
        expect(null).assertFail();
      } catch (err) {
        console.error("CreateMac catch 1 err: " + err);
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_0700
     * @tc.number Security_CryptoFramework_HMACSM3_Func_0700
     * @tc.desc   the asyAlgoName is "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz" take 10000 characters,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_HMACSM3_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let globalHMAC: cryptoFramework.Mac | undefined;
      let globalText: string = "";
      let globalSymKeyGenerator: cryptoFramework.SymKeyGenerator;
      let t: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz";
      let n: number = t.length;
      for (let i = 0; i < 10000; i++) {
        globalText += t.charAt((Math.floor(Math.random() * n)).toInt())
      }
      console.log("Datablob = " + globalText);
      let ginBlob: cryptoFramework.DataBlob = {
        data: stringTouInt8Array(globalText)
      };
      try {
        let result: boolean = await new Promise<boolean>((resolve, reject) => {
          globalHMAC = cryptoFramework.createMac("SM3");
          globalSymKeyGenerator =
            cryptoFramework.createSymKeyGenerator("AES128");
          await globalSymKeyGenerator
            .generateSymKey()
            .then((symKey: cryptoFramework.SymKey) => {
              return globalHMAC!.init(symKey);
            })
            .then(() => {
              return globalHMAC!.update(ginBlob);
            })
            .then<cryptoFramework.DataBlob>(() => {
              return globalHMAC!.doFinal();
            })
            .then((doFinalBlob: cryptoFramework.DataBlob) => {
              let mdLen: int = globalHMAC!.getMacLength();
              console.log("HMAC HMAC len: " + mdLen);
              if (doFinalBlob != null && mdLen != 0 && mdLen != null) {
                resolve(true);
              } else {
                resolve(false);
              }
            })
            .catch((err: Error) => {
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
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_HMACSM3_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let signGenerator: cryptoFramework.Sign = cryptoFramework.createSign("SM2_256|SM3");
      let rsaGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("RSA1024");
      let rsaKeyPair: cryptoFramework.KeyPair | undefined;
      await new Promise<void>((resolve, reject) => {
        rsaGenerator.generateKeyPair((err: BusinessError<void>|null, tmp: cryptoFramework.KeyPair|undefined) => {
          if (err || tmp === undefined) { // success: error is null, failed: data is undefined
            reject(err as Error);
          } else {
            rsaKeyPair = tmp as cryptoFramework.KeyPair;
            resolve(undefined);
          }
        });
      });
      try {
        await signGenerator.init(rsaKeyPair!.priKey);
        expect(null).assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_0900
     * @tc.number Security_CryptoFramework_HMACSM3_Func_0900
     * @tc.desc   Pass in two exception parameters "Mac test data" and "Mac test data"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_HMACSM3_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let globalText: string = "Mac test data";
      let ginBlob: cryptoFramework.DataBlob = {
        data: stringTouInt8Array(globalText)
      };
      let globalHMAC: cryptoFramework.Mac = cryptoFramework.createMac("SM3");
      let globalSymKeyGenerator: cryptoFramework.SymKeyGenerator =
        cryptoFramework.createSymKeyGenerator("SM4_128");

      let globalSymKey: cryptoFramework.SymKey | undefined;
      await new Promise<void>((resolve, reject) => {
        globalSymKeyGenerator.generateSymKey((err: BusinessError<void>|null, tmp: cryptoFramework.SymKey|undefined) => {
          if (err || tmp === undefined) { // success: error is null, failed: data is undefined
            reject(err as Error);
          } else {
            globalSymKey = tmp as cryptoFramework.SymKey;
            resolve(undefined);
          }
        });
      });
      try {
        await globalHMAC.update(ginBlob);
        expect(null).assertFail();
      } catch (err) {
        expect((err as BusinessError).code).assertEqual(17630001);
      }
      await globalHMAC.init(globalSymKey!);
      done();
    });

    /**
     * @tc.name   Security_CryptoFramework_HMACSM3_Func_1000
     * @tc.number Security_CryptoFramework_HMACSM3_Func_1000
     * @tc.desc   the asyAlgoName is "SM3", Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Security_CryptoFramework_HMACSM3_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let globalMac: cryptoFramework.Md = cryptoFramework.createMd("SM3");
        expect(globalMac.algName == "SM3").assertTrue();
      } catch (err) {
        console.error("MacDigestAlgoName catch err: " + err);
        expect(null).assertFail();
      }
      done();
    });
  });
}
