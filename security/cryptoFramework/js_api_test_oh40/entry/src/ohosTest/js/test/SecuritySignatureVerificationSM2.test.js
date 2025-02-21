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
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import * as asyCommon from "./utils/asymmetric/publicAsymmetricCommon";
import cryptoFramework from "@ohos.security.cryptoFramework";
import { stringTouInt8Array, uInt8ArrayToShowStr, } from "./utils/common/publicDoString";

export default function SecuritySignatureVerificationSM2Jsunit() {
    describe("SecuritySignatureVerificationSM2Jsunit", function () {
        console.log(
            "##########start SecuritySignatureVerificationSM2Jsunit##########"
        );
        var asyKeyPair;
        beforeAll(async function () {

            async function genAsyKeyPair() {
                try {
                    let asyGenerator = asyCommon.createAsyKeyGenerator("SM2_256");
                    let aysKeyPair = await asyGenerator.generateKeyPair();
                    return aysKeyPair;
                } catch (err) {
                    return err;
                }
            }
            asyKeyPair = await genAsyKeyPair();
        });
        afterAll(function () {
        });

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0100
         * @tc.name Signature and verification scenario testing
         * @tc.desc the asyAlgoName is "SM2_256|SM3", Use the Callback Style of Interface
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_0100",
            0,
            async function (done) {
                await asyCallback
                    .signAndVerifyNormalProcess("SM2_256", "SM2_256|SM3")
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
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
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0200
         * @tc.name Create signature compatibility test
         * @tc.desc the asyAlgoName is "RSA|SM3", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "ECC|SM3", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "DSA|SM3", Use the async Style of Interface
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_0200",
            0,
            async function (done) {
                try {
                    await cryptoFramework.createSign("RSA|SM3");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("signGenerator 1 error:" + err);
                    expect(err.code).assertEqual(401);
                }

                try {
                    await cryptoFramework.createSign("ECC|SM3");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("signGenerator 2 error:" + err);
                    expect(err.code).assertEqual(401);
                }

                try {
                    await cryptoFramework.createSign("DSA|SM3");
                } catch (err) {
                    console.error("signGenerator 3 error:" + err);

                    expect(err.code).assertEqual(undefined);
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0300
         * @tc.name Create signature compatibility test
         * @tc.desc the asyAlgoName is "SM2_256|NoHash", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|MD5", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA256", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA1", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA224", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA384", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA512", Use the async Style of Interface
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_0300",
            0,
            async function (done) {
                try {
                    cryptoFramework.createSign("SM2_256|NoHash");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    cryptoFramework.createSign("SM2_256|MD5");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    cryptoFramework.createSign("SM2_256|SHA256");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    cryptoFramework.createSign("SM2_256|SHA1");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    cryptoFramework.createSign("SM2_256|SHA224");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    await cryptoFramework.createSign("SM2_256|SHA384");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    await cryptoFramework.createSign("SM2_256|SHA512");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0400
         * @tc.name Create verification compatibility test
         * @tc.desc the asyAlgoName is "SM2_256|NoHash", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|MD5", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA256", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA1", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA224", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA384", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA512", Use the async Style of Interface
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_0400",
            0,
            async function (done) {
                try {
                    cryptoFramework.createVerify("SM2_256|NoHash");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    cryptoFramework.createVerify("SM2_256|MD5");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    cryptoFramework.createVerify("SM2_256|SHA256");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    cryptoFramework.createVerify("SM2_256|SHA1");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    cryptoFramework.createVerify("SM2_256|SHA224");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    cryptoFramework.createVerify("SM2_256|SHA384");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    cryptoFramework.createVerify("SM2_256|SHA512");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0500
         * @tc.name Create Key Generator Test
         * @tc.desc the asyAlgoName is "SM2_2567", Use the async Style of Interface
         * @tc.desc the asyAlgoName is null, Use the async Style of Interface
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_0500",
            0,
            async function (done) {
                try {
                    cryptoFramework.createAsyKeyGenerator("SM2_2567");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("createAsyKeyGenerator 1 error:" + err);
                    expect(err.code).assertEqual(401);
                }

                try {
                    cryptoFramework.createAsyKeyGenerator(null);
                    expect(null).assertFail();
                } catch (err) {
                    console.error("createAsyKeyGenerator 2 error:" + err);
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0600
         * @tc.name Create signature failed
         * @tc.desc the asyAlgoName is "SM2_256|SHA257", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|NULL", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "NULL|SHA1", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "ECC|SHA", Use the async Style of Interface
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_0600",
            0,
            async function (done) {
                try {
                    cryptoFramework.createSign("SM2_256|SHA257");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("signGenerator 1 error:" + err);
                    expect(err.code).assertEqual(401);
                }

                try {
                    cryptoFramework.createSign("SM2_256|NULL");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("signGenerator 2 error:" + err);
                    expect(err.code).assertEqual(401);
                }

                try {
                    cryptoFramework.createSign("NULL|SHA1");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("signGenerator 3 error:" + err);
                    expect(err.code).assertEqual(401);
                }

                try {
                    cryptoFramework.createSign("ECC|SHA");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("signGenerator 4 error:" + err);
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0700
         * @tc.name Exception while initializing rsa signature object
         * @tc.desc Pass in an exception parameter null and call it as a async
         * @tc.desc Pass in the two public keys generated by the exception parameter SM2_256 and call them as async
         * @tc.desc Pass in an exception parameter "sroundpriKey" and call it as a async
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_0700",
            0,
            async function (done) {
                let specGenerator = cryptoFramework.createAsyKeyGenerator("SM2_256");
                let signGenerator = cryptoFramework.createSign("SM2_256|SM3");
                let signKeyPair;
                await new Promise((resolve, reject) => {
                    specGenerator.generateKeyPair((err, keyPair) => {
                        if (err) {
                            reject(err);
                        } else {
                            signKeyPair = keyPair;
                            resolve();
                        }
                    });
                });

                try {
                    await signGenerator.init(null);
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }

                try {
                    await signGenerator.init(signKeyPair.priKey, signKeyPair.priKey);
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
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0800
         * @tc.name Exception in adding signature data to rsa objects
         * @tc.desc The signature object was not initialized, and the data to be signed "This is a sign test"
         * was passed in as a promise to be called
         * @tc.desc Call it as a promise without passing in parameters
         * @tc.desc Pass in an exception parameter null and call it as a promise
         * @tc.desc Pass in two exception parameters of "This is a sign test" and "This is a sign test"
         * and call it promise
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_0800",
            0,
            async function (done) {
                let globalText = "This is a sign test";
                let input = {
                    data: stringTouInt8Array(globalText)
                };
                let signGenerator = cryptoFramework.createSign("SM2_256|SM3");
                try {
                    await signGenerator.update(input);
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }

                await signGenerator.init(asyKeyPair.priKey);

                try {
                    await signGenerator.update(null);
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }

                try {
                    await signGenerator.update(input, input);
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_0900
         * @tc.name Signature data anomaly
         * @tc.descPass in an exception parameter null and call it as a callback
         * @tc.desc Pass in an exception parameter "" and call it as a callback
         * @tc.desc Pass in two exception parameters "This is a sign test" and "This is a sign test"
         * and call it as a callback
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_0900",
            0,
            async function (done) {
                let globalText = "This is a sign test";
                let input = {
                    data: stringTouInt8Array(globalText)
                };
                let signGenerator = cryptoFramework.createSign("SM2_256|SM3");
                await signGenerator.init(asyKeyPair.priKey);

                try {
                    await signGenerator.sign(null);
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }

                try {
                    await signGenerator.sign("");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }

                try {
                    await signGenerator.sign(input, input);
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_1000
         * @tc.name Create verification failed
         * @tc.desc the asyAlgoName is "SM2_2567|SHA256", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "NULL|SHA256", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|SHA122", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "SM2_256|NULL", Use the async Style of Interface
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_1000",
            0,
            async function (done) {
                try {
                    cryptoFramework.createVerify("SM2_2567|SHA256");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("verifyGenerator 1 error:" + err.code);
                    expect(err.code).assertEqual(401);
                }

                try {
                    cryptoFramework.createVerify("NULL|SHA256");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("verifyGenerator 2 error:" + err.code);
                    expect(err.code).assertEqual(401);
                }

                try {
                    cryptoFramework.createVerify("SM2_256|SHA122");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("verifyGenerator 3 error:" + err.code);
                    expect(err.code).assertEqual(401);
                }

                try {
                    cryptoFramework.createVerify("SM2_256|NULL");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("verifyGenerator 4 error:" + err.code);
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_1100
         * @tc.name Abnormal situation of initialization verification object
         * @tc.desc Pass in an exception parameter null and call it as a async
         * @tc.desc Pass in the two public keys generated by the exception parameter SM2_256 and call them as async
         * @tc.desc Pass in an exception parameter "sroundpriKey" and call it as a async
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_1100",
            0,
            async function (done) {
                let specGenerator = cryptoFramework.createAsyKeyGenerator("SM2_256");
                let verifyGenerator = cryptoFramework.createVerify("SM2_256|SM3");
                let verifyKeyPair;
                await new Promise((resolve, reject) => {
                    specGenerator.generateKeyPair((err, keyPair) => {
                        if (err) {
                            reject(err);
                        } else {
                            verifyKeyPair = keyPair;
                            resolve();
                        }
                    });
                });

                try {
                    await verifyGenerator.init(null);
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }

                try {
                    await verifyGenerator.init(
                        verifyKeyPair.pubKey,
                        verifyKeyPair.pubKey
                    );
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }

                try {
                    await verifyGenerator.init("sroundpriKey");
                    expect(null).assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_1400
         * @tc.name Test signature verification and pass in ultra long parameters
         * @tc.desc the asyAlgoName is "SM2_256|SM3", Use the async Style of Interface
         * @tc.desc the asyAlgoName is "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz" * 350,
         * Use the Promise Style of Interface
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_1400",
            0,
            async function (done) {
                var globalSignBlob;
                var globalText;

                try {
                    let t = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefhijklmnopqrstuvwxyz";
                    for (let i = 0; i < 350; i++) {
                        globalText += t.charAt(Math.floor(Math.random() * t.length));
                    }
                    let input = {
                        data: stringTouInt8Array(globalText)
                    };
                    let rsaGenerator = cryptoFramework.createAsyKeyGenerator("SM2_256");
                    let signGenerator = cryptoFramework.createSign("SM2_256|SM3");
                    let verifyGenerator = cryptoFramework.createVerify("SM2_256|SM3");
                    let rsaKeyPair = await rsaGenerator.generateKeyPair();
                    await signGenerator.init(rsaKeyPair.priKey);
                    await signGenerator.update(input);
                    globalSignBlob = await signGenerator.sign(input);
                    await verifyGenerator.init(rsaKeyPair.pubKey);
                    await verifyGenerator.update(input);
                    let finalStatus = await verifyGenerator.verify(input, globalSignBlob);
                    expect(finalStatus).assertTrue();
                } catch (err) {
                    expect(null).assertFail();
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_1500
         * @tc.name Key negotiation test
         * @tc.desc the asyAlgoName is "SM2_256", Use the async Style of Interface
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_1500",
            0,
            async function (done) {
                try {
                    cryptoFramework.createAsyKeyGenerator("SM2_256");
                    cryptoFramework.createKeyAgreement("SM2_256");
                    expect(null).assertFail();
                } catch (err) {
                    console.error("createAsyKeyAgreement error:" + err.code);
                    expect(err.code).assertEqual(801);
                }
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerificationSM2_Func_1600
         * @tc.name Signature verification and corresponding algorithm for obtaining signatures
         * @tc.desc Pass in algorithm name "SM2_256|SM3" and call it using the async method
         * @tc.desc Pass in algorithm name "SM2_256|SM3" and call it using the async method
         */
        it(
            "Security_CryptoFramework_SignatureVerificationSM2_Func_1600",
            0,
            async function (done) {
                try {
                    let signGenerator = cryptoFramework.createSign("SM2_256|SM3");
                    expect(signGenerator.algName == "SM2_256|SM3").assertTrue();
                    let verifyGenerator = cryptoFramework.createVerify("SM2_256|SM3");
                    expect(verifyGenerator.algName == "SM2_256|SM3").assertTrue();
                } catch (err) {
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
