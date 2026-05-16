/*
 * Copyright (C) 2022-2026 Huawei Device Co., Ltd.
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
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function SecuritySignatureVerificationTwoJsunit() {
  describe("SecuritySignatureVerificationTwoJsunit", () => {
    console.log(
      "##########start SecuritySignatureVerificationJsunit##########"
    );
    beforeAll(async () => {
    });

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_1900
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_1900
     * @tc.desc   Pass in the DSAKeyPar structure with a signature verification type of "DSA|SHA224"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .signAndVerifyBySpecProcess(
            asyCommon.genDsa2048CommonSpecBigE(),
            "DSA|SHA224"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_2000
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2000
     * @tc.desc   Pass in the DSAKeyPar structure with a signature verification type of "DSA1024|SHA224"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .signAndVerifyBySpecProcess(
            asyCommon.genDsa2048CommonSpecBigE(),
            "DSA1024|SHA224"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_2100
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2100
     * @tc.desc   Pass in the DSAKeyPar structure with a signature verification type of "DSA2048|SHA256"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .signAndVerifyBySpecProcess(
            asyCommon.genDsa2048CommonSpecBigE(),
            "DSA2048|SHA256"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "AsyPromise signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_2200
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2200
     * @tc.desc   Pass in the DSAKeyPar structure with a signature verification type of "DSA3072|SHA384"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .signAndVerifyBySpecProcess(
            asyCommon.genDsa2048CommonSpecBigE(),
            "DSA3072|SHA384"
          )
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_2300
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2300
     * @tc.desc   Pass in key generation parameter "DSA1024|PRIMES_2",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .signAndVerifyNormalProcess("DSA1024", "DSA1024|SHA1")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "AyPromise signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_2400
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2400
     * @tc.desc   Pass in key generation parameter "DSA2048|PRIMES_2",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .signAndVerifyNormalProcess("DSA2048", "DSA2048|SHA256")
          .then((result: boolean) => {
            expect(result == true).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "AsyCallback signAndVerifyBySpecProcess catch error: " + err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_2500
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2500
     * @tc.desc   Pass in key generation parameter "DSA3072|PRIMES_2",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyPromise
          .signAndVerifyNormalProcess("DSA3072", "DSA3072|SHA384")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "AsyPromise signAndVerifyNormalProcess catch error: " + err
            );
            expect((err as BusinessError).code).assertEqual(401);
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_2600
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2600
     * @tc.desc   Pass in an exception parameter "RSA1024PKCS1MD5RSA1024PKCS1MD5RSA1024PKCS1MD5" and
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createSign("RSA10000|PKCS1|SHA224");
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_2600 1 err" +
              err
          );
          expect((err as BusinessError).code).assertEqual(401);
        }

        try {
          cryptoFramework.createSign(
            "RSA1024PKCS1MD5RSA1024PKCS1MD5RSA1024PKCS1MD5"
          );
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_2600 3 err" +
              err
          );
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_2800
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2800
     * @tc.desc   The signature object was not initialized, and the data to be signed "This is a sign test"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          await asyPromise.updateAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 1);
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          await asyPromise.updateAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 2);
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          await asyPromise.updateAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 3);
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          await asyPromise.updateAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 4);
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_2900
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_2900
     * @tc.desc   The signature object was not initialized, and the data to be signed 'This is a sign test'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          await asyCallback.signAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 1);
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          await asyCallback.signAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 2);
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          await asyCallback.signAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 3);
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_3000
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3000
     * @tc.desc   Pass in exception parameter mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, parameter "string",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let signGenerator: cryptoFramework.Sign = cryptoFramework.createSign(
          "RSA1024|PSS|SHA224|MGF1_SHA224"
        );

        try {
          signGenerator.setSignSpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            2147483447
          );
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3100 2 err" +
              err
          );
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_3200
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3200
     * @tc.desc   Pass in an exception parameter "DSA512|PKCS1|MD5" and call it as a synchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createVerify("RSA10000|SHA224");
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3200 1 catch err" +
              err
          );
          expect((err as BusinessError).code).assertEqual(401);
        }

        try {
          cryptoFramework.createVerify(
            "RSA1024PKCS1MD5RSA1024PKCS1MD5RSA1024PKCS1MD5"
          );
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3200 3 catch err" +
              err
          );
          expect((err as BusinessError).code).assertEqual(401);
        }

        try {
          cryptoFramework.createVerify("DSA512|PKCS1|MD5");
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3200 5 catch err" +
              err
          );
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_3300
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3300
     * @tc.desc   Pass in an exception parameter "sroundpriKey" and call it as a async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let specGenerator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(
          asyCommon.genRsa2048KeyPairSpec()
        );
        let verifyGenerator: cryptoFramework.Verify = cryptoFramework.createVerify(
          "RSA1024|PKCS1|SHA224"
        );
        let verifyKeyPair: cryptoFramework.KeyPair;
        await new Promise<void>((resolve, reject) => {
          specGenerator.generateKeyPair((err: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
            if (err || keyPair === undefined) { // success: error is null, failed: data is undefined
              reject(err as Error);
            } else {
              verifyKeyPair = keyPair as cryptoFramework.KeyPair;
              resolve(undefined);
            }
          });
        });

        let dsaGenerator: cryptoFramework.AsyKeyGeneratorBySpec = cryptoFramework.createAsyKeyGeneratorBySpec(
          asyCommon.genDsa2048KeyPairSpecBigE()
        );
        let dsaKeyPair: cryptoFramework.KeyPair | undefined;
        await new Promise<void>((resolve, reject) => {
          dsaGenerator.generateKeyPair((err: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
            if (err || keyPair === undefined) { // success: error is null, failed: data is undefined
              reject(err as Error);
            } else {
              dsaKeyPair = keyPair as cryptoFramework.KeyPair;
              resolve(undefined);
            }
          });
        });
        try {
          await verifyGenerator.init(dsaKeyPair!.pubKey);
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_3400
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3400
     * @tc.desc   The verify object was not initialized, and the data to be signed "This is a sign test"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          await asyPromise.verifyUpdateAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 1);
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          await asyPromise.verifyUpdateAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 2);
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          await asyPromise.verifyUpdateAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 3);
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          await asyPromise.verifyUpdateAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 4);
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_3500
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3500
     * @tc.desc   The verify object was not initialized, and the data to be signed 'This is a sign test'
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let status: boolean = await asyCallback.verifyAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 1);
          expect(status).assertFalse();
        } catch (err) {
          expect(null).assertFail();
        }
        try {
          let status: boolean = await asyCallback.verifyAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 2);
          expect(status).assertFalse();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          let status: boolean = await asyCallback.verifyAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 3);
          expect(status).assertFalse();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          let status: boolean = await asyCallback.verifyAbnormalParameterProcess(asyCommon.genRsa2048KeyPairSpec(), "RSA1024|PKCS1|SHA224", 4);
          expect(status).assertFalse();
        } catch (err) {
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_3600
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3600
     * @tc.desc   Pass in exception parameter mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM, parameter "string",
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let verifyGenerator: cryptoFramework.Verify = cryptoFramework.createVerify(
          "RSA1024|PKCS1|SHA224"
        );
        try {
          verifyGenerator.setVerifySpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            0
          );
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          verifyGenerator.setVerifySpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            -1
          );
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          verifyGenerator.setVerifySpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
            65535
          );
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_3700
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3700
     * @tc.desc   Pass in exception parameter mode 6, and call it synchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let verifyGenerator: cryptoFramework.Verify = cryptoFramework.createVerify(
          "RSA1024|PKCS1|SHA224"
        );

        try {
          verifyGenerator.getVerifySpec(
            cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
          );
          expect(null).assertFail();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3700 2 err" +
              err
          );
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerification_Func_3800
     * @tc.number Security_CryptoFramework_SignatureVerification_Func_3800
     * @tc.desc   Pass in algorithm name "RSA1024|PKCS1|SHA512" and call it using the promise method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerification_Func_3800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let signGenerator: cryptoFramework.Sign = cryptoFramework.createSign(
            "RSA1024|PKCS1|SHA512"
          );
          expect(signGenerator.algName == "RSA1024|PKCS1|SHA512").assertTrue();
          let verifyGenerator: cryptoFramework.Verify = cryptoFramework.createVerify(
            "RSA1024|PKCS1|SHA512"
          );
          expect(
            verifyGenerator.algName == "RSA1024|PKCS1|SHA512"
          ).assertTrue();
        } catch (err) {
          console.log(
            "Security_CryptoFramework_SignatureVerification_Func_3800 catch err: " +
              err
          );
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );
  }
  );
}
