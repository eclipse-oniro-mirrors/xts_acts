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
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import * as asyCommon from "./utils/asymmetric/publicAsymmetricCommon";
import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, } from "./utils/common/publicDoString";

async function genAsyKeyPair(): Promise<cryptoFramework.KeyPair> {
  try {
    let asyGenerator: cryptoFramework.AsyKeyGenerator = asyCommon.createAsyKeyGenerator("SM2_256");
    let aysKeyPair: cryptoFramework.KeyPair = await asyGenerator.generateKeyPair();
    return aysKeyPair;
  } catch (err: BusinessError) {
    throw err as Error;
  }
}

export default function SecuritySignatureVerificationSM2Jsunit() {
  describe("SecuritySignatureVerificationSM2Jsunit", () => {
    console.log(
      "##########start SecuritySignatureVerificationSM2Jsunit##########"
    );
    let asyKeyPair: cryptoFramework.KeyPair;
    beforeAll(async () => {
      asyKeyPair = await genAsyKeyPair();
    });

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_0100
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0100
     * @tc.desc   the asyAlgoName is "SM2_256|SM3", Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await asyCallback
          .signAndVerifyNormalProcess("SM2_256", "SM2_256|SM3")
          .then((result: boolean) => {
            expect(result).assertTrue();
          })
          .catch((err: Error) => {
            console.error(
              "Security_CryptoFramework_SignatureVerificationSM2_Func_0100 catch error: " +
                err
            );
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_0200
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0200
     * @tc.desc   the asyAlgoName is "DSA|SM3", Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createSign("RSA|SM3");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("signGenerator 1 error:" + err);
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createSign("ECC|SM3");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("signGenerator 2 error:" + err);
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createSign("DSA|SM3");
        } catch (err: BusinessError) {
          console.error("signGenerator 3 error:" + err);
          expect(err.code).assertEqual(undefined);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_0300
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0300
     * @tc.desc   the asyAlgoName is "SM2_256|SHA512", Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createSign("SM2_256|NoHash");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign("SM2_256|MD5");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign("SM2_256|SHA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign("SM2_256|SHA1");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign("SM2_256|SHA224");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign("SM2_256|SHA384");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createSign("SM2_256|SHA512");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_0400
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0400
     * @tc.desc   the asyAlgoName is "SM2_256|SHA512", Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createVerify("SM2_256|NoHash");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify("SM2_256|MD5");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify("SM2_256|SHA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify("SM2_256|SHA1");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify("SM2_256|SHA224");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify("SM2_256|SHA384");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        try {
          cryptoFramework.createVerify("SM2_256|SHA512");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_0500
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0500
     * @tc.desc   the asyAlgoName is null, Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createAsyKeyGenerator("SM2_2567");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("createAsyKeyGenerator 1 error:" + err);
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_0600
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0600
     * @tc.desc   the asyAlgoName is "ECC|SHA", Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createSign("SM2_256|SHA257");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("signGenerator 1 error:" + err);
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createSign("SM2_256|NULL");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("signGenerator 2 error:" + err);
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createSign("NULL|SHA1");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("signGenerator 3 error:" + err);
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createSign("ECC|SHA");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("signGenerator 4 error:" + err);
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_0700
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0700
     * @tc.desc   Pass in an exception parameter "sroundpriKey" and call it as a async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let specGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("SM2_256");
        let signGenerator: cryptoFramework.Sign = cryptoFramework.createSign("SM2_256|SM3");
        let signKeyPair: cryptoFramework.KeyPair;
        await new Promise<void>((resolve, reject) => {
          specGenerator.generateKeyPair((err: BusinessError<void>|null, keyPair: cryptoFramework.KeyPair|undefined) => {
            if (err || keyPair === undefined) { // success: error is null, failed: data is undefined
              reject(err as Error);
            } else {
              signKeyPair = keyPair as cryptoFramework.KeyPair;
              resolve(undefined);
            }
          });
        });
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_0800
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0800
     * @tc.desc   Pass in two exception parameters of "This is a sign test" and "This is a sign test"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let globalText: string = "This is a sign test";
        let input: cryptoFramework.DataBlob = {
          data: stringTouInt8Array(globalText)
        };
        let signGenerator: cryptoFramework.Sign = cryptoFramework.createSign("SM2_256|SM3");
        try {
          await signGenerator.update(input);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        await signGenerator.init(asyKeyPair.priKey);
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_0900
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0900
     * @tc.desc   Pass in two exception parameters "This is a sign test" and "This is a sign test"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let globalText: string = "This is a sign test";
        let input: cryptoFramework.DataBlob = {
          data: stringTouInt8Array(globalText)
        };
        let signGenerator: cryptoFramework.Sign = cryptoFramework.createSign("SM2_256|SM3");
        await signGenerator.init(asyKeyPair.priKey);

        try {
          await signGenerator.sign(null);
          expect(null).assertFail();
        } catch (err: BusinessError) {
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_1000
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_1000
     * @tc.desc   the asyAlgoName is "SM2_256|NULL", Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createVerify("SM2_2567|SHA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("verifyGenerator 1 error:" + err.code);
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createVerify("NULL|SHA256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("verifyGenerator 2 error:" + err.code);
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createVerify("SM2_256|SHA122");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("verifyGenerator 3 error:" + err.code);
          expect(err.code).assertEqual(401);
        }

        try {
          cryptoFramework.createVerify("SM2_256|NULL");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("verifyGenerator 4 error:" + err.code);
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_1100
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_1100
     * @tc.desc   Pass in an exception parameter "sroundpriKey" and call it as a async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let specGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("SM2_256");
        let verifyGenerator: cryptoFramework.Verify = cryptoFramework.createVerify("SM2_256|SM3");
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
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_1400
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_1400
     * @tc.desc   the asyAlgoName is "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz" * 350,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let globalSignBlob: cryptoFramework.DataBlob;
        let globalText: string = "";

        try {
          let t: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz";
          for (let i = 0; i < 350; i++) {
            globalText += t.charAt((Math.floor(Math.random() * t.length)).toInt());
          }
          let input: cryptoFramework.DataBlob = {
            data: stringTouInt8Array(globalText)
          };
          let rsaGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator("SM2_256");
          let signGenerator: cryptoFramework.Sign = cryptoFramework.createSign("SM2_256|SM3");
          let verifyGenerator: cryptoFramework.Verify = cryptoFramework.createVerify("SM2_256|SM3");
          let rsaKeyPair: cryptoFramework.KeyPair = await rsaGenerator.generateKeyPair();
          await signGenerator.init(rsaKeyPair.priKey);
          await signGenerator.update(input);
          globalSignBlob = await signGenerator.sign(input);
          await verifyGenerator.init(rsaKeyPair.pubKey);
          await verifyGenerator.update(input);
          let finalStatus: boolean = await verifyGenerator.verify(input, globalSignBlob);
          expect(finalStatus).assertTrue();
        } catch (err: BusinessError) {
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_1500
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_1500
     * @tc.desc   the asyAlgoName is "SM2_256", Use the async Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          cryptoFramework.createAsyKeyGenerator("SM2_256");
          cryptoFramework.createKeyAgreement("SM2_256");
          expect(null).assertFail();
        } catch (err: BusinessError) {
          console.error("createAsyKeyAgreement error:" + err.code);
          expect(err.code).assertEqual(801);
        }
        done();
      }
    );

    /**
     * @tc.name   Security_CryptoFramework_SignatureVerificationSM2_Func_1600
     * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_1600
     * @tc.desc   Pass in algorithm name "SM2_256|SM3" and call it using the async method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it(
      "Security_CryptoFramework_SignatureVerificationSM2_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let signGenerator: cryptoFramework.Sign = cryptoFramework.createSign("SM2_256|SM3");
          expect(signGenerator.algName == "SM2_256|SM3").assertTrue();
          let verifyGenerator: cryptoFramework.Verify = cryptoFramework.createVerify("SM2_256|SM3");
          expect(verifyGenerator.algName == "SM2_256|SM3").assertTrue();
        } catch (err: BusinessError) {
          console.log(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_1600 catch err: " +
              err
          );
          expect(err.code).assertEqual(401);
        }
        done();
      }
    );
  });
}
