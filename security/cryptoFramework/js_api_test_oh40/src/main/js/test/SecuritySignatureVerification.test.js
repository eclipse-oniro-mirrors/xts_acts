/*
 * Copyright (C) 2022-2023 Huawei Device Co., Ltd.
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
import * as asyPromise from "./utils/asymmetric/publicAsymmetricPromise";
import * as asyCommon from "./utils/common/publicDoSpec";
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function SecuritySignatureVerificationJsunit() {
    describe("SecuritySignatureVerificationJsunit", function () {
        console.log(
            "##########start SecuritySignatureVerificationJsunit##########"
        );
        beforeAll(async function () {
            async function sleep(ms) {
                let timeoutID;
                await new Promise(resolve => {
                    timeoutID = setTimeout(resolve, ms)
                });
                clearTimeout(timeoutID);
            }

            await sleep(6000);
        });
        afterEach(function () {
        });

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0100
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * @tc.desc Pass in the RSAKeyPar structure with a signature verification type of "RSA512|PKCS1|MD5"
         * and use a callback style interface
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0100",
            0,
            async function (done) {
                await asyCallback
                    .signAndVerifyBySpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA512|PKCS1|MD5"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyCallback signAndVerifyBySpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0200
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * and set Sign/Verify spec after init Sign/Verify object
         * @tc.desc Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
         * "RSA768|PSS|SHA1|MGF1_SHA1", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
         * and parameter 32
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0200",
            0,
            async function (done) {
                await asyPromise
                    .signAndVerifySetAndGetSpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA768|PSS|SHA1|MGF1_SHA1",
                        cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
                        32
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyPromise signAndVerifySetAndGetSpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0300
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * and set Sign/Verify spec before init Sign/Verify object
         * @tc.desc Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
         * "RSA1024|PSS|SHA224|MGF1_SHA224", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
         * and parameter 32
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0300",
            0,
            async function (done) {
                await asyCallback
                    .signAndVerifySetAndGetSpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA1024|PSS|SHA224|MGF1_SHA224",
                        cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
                        32
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyCallback signAndVerifySetAndGetSpecProcess catch error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0400
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * and set Sign/Verify spec after init Sign/Verify object
         * @tc.desc Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
         * "RSA2048|PSS|SHA256|MGF1_SHA256", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
         * and parameter 32
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0400",
            0,
            async function (done) {
                await asyPromise
                    .signAndVerifySetAndGetSpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA2048|PSS|SHA256|MGF1_SHA256",
                        cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
                        32
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyPromise signAndVerifySetAndGetSpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0500
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * and set Sign/Verify spec before init Sign/Verify object
         * @tc.desc Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
         * "RSA3072|PSS|SHA384|MGF1_SHA384", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
         * and parameter 32
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0500",
            0,
            async function (done) {
                await asyCallback
                    .signAndVerifySetAndGetSpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA3072|PSS|SHA384|MGF1_SHA384",
                        cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
                        32
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyCallback signAndVerifySetAndGetSpecProcess catch error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0600
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * and set Sign/Verify spec after init Sign/Verify object
         * @tc.desc Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
         * "RSA4096|PSS|SHA512|MGF1_SHA512", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
         * and parameter 32
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0600",
            0,
            async function (done) {
                await asyPromise
                    .signAndVerifySetAndGetSpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA4096|PSS|SHA512|MGF1_SHA512",
                        cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
                        32
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyPromise signAndVerifySetAndGetSpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0700
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * and set Sign/Verify spec before init Sign/Verify object
         * @tc.desc Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
         * "RSA8192|PSS|SHA512|MGF1_SHA512", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
         * and parameter 32
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0700",
            0,
            async function (done) {
                await asyCallback
                    .signAndVerifySetAndGetSpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA8192|PSS|SHA512|MGF1_SHA512",
                        cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
                        32
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyCallback signAndVerifySetAndGetSpecProcess catch error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0800
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * @tc.desc Pass in the RSAKeyPar structure with a signature verification type of "RSA|PKCS1|MD5"
         * and use a promise style interface
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0800",
            0,
            async function (done) {
                await asyPromise
                    .signAndVerifyBySpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA|PKCS1|MD5"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyPromise signAndVerifyBySpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0900
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * and set Sign/Verify spec before init Sign/Verify object
         * @tc.desc Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
         * "RSA|PSS|SHA256|MGF1_SHA256", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
         * and parameter 32
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0900",
            0,
            async function (done) {
                await asyCallback
                    .signAndVerifySetAndGetSpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA|PSS|SHA256|MGF1_SHA256",
                        cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
                        32
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyCallback signAndVerifySetAndGetSpecProcess catch error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1000
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * and set Sign/Verify spec after init Sign/Verify object
         * @tc.desc Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
         * "RSA|PSS|SHA384|MGF1_SHA384", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
         * and parameter 32
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1000",
            0,
            async function (done) {
                await asyPromise
                    .signAndVerifySetAndGetSpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA|PSS|SHA384|MGF1_SHA384",
                        cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
                        32
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyPromise signAndVerifySetAndGetSpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1100
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * and set Sign/Verify spec before init Sign/Verify object
         * @tc.desc Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
         * "RSA|PSS|SHA512|MGF1_SHA512", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
         * and parameter 32
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1100",
            0,
            async function (done) {
                await asyCallback
                    .signAndVerifySetAndGetSpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA|PSS|SHA512|MGF1_SHA512",
                        cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
                        32
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "asyCallback signAndVerifySetAndGetSpecProcess catch error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1200
         * @tc.name Use createAsyKeyGeneratorBySpec to Create RSA asyKeySpec
         * and Signature verification combination scenario testing
         * and set Sign/Verify spec after init Sign/Verify object
         * @tc.desc Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
         * "RSA|PSS|SHA224|MGF1_SHA224", parameter setting mode cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM
         * and parameter 32
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1200",
            0,
            async function (done) {
                await asyPromise
                    .signAndVerifySetAndGetSpecProcess(
                        asyCommon.genRsa2048KeyPairSpec(),
                        "RSA|PSS|SHA224|MGF1_SHA224",
                        cryptoFramework.SignSpecItem.PSS_SALT_LEN_NUM,
                        32
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyPromise signAndVerifySetAndGetSpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1300
         * @tc.name Use createAsyKeyGeneratorBySpec to Create ECC asyKeySpec
         * and Signature verification combination scenario testing
         * @tc.desc Pass in the ECCKeyPar structure with a signature verification type of "ECC256|SHA256"
         * and use a callback style interface
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1300",
            0,
            async function (done) {
                await asyCallback
                    .signAndVerifyBySpecProcess(
                        asyCommon.genEccCommonSpec(),
                        "ECC256|SHA256"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyCallback signAndVerifyBySpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1400
         * @tc.name Use createAsyKeyGeneratorBySpec to Create ECC asyKeySpec
         * and Signature verification combination scenario testing
         * @tc.desc Pass in the ECCKeyPair structure with a signature verification type of "ECC|SHA224"(No length)
         * and use a promise style interface
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1400",
            0,
            async function (done) {
                await asyPromise
                    .signAndVerifyBySpecProcess(
                        asyCommon.genEccCommonSpec(),
                        "ECC|SHA224"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyPromise signAndVerifyBySpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1500
         * @tc.name Use createAsyKeyGeneratorBySpec to Create ECC asyKeySpec
         * and Signature verification combination scenario testing
         * @tc.desc Pass in the ECCKeyPar structure with a signature verification type of "ECC224|SHA256"
         * and use a callback style interface
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1500",
            0,
            async function (done) {
                await asyCallback
                    .signAndVerifyBySpecProcess(
                        asyCommon.genEccCommonSpec(),
                        "ECC224|SHA256"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyCallback signAndVerifyBySpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1600
         * @tc.name Use createAsyKeyGeneratorBySpec to Create ECC asyKeySpec
         * and Signature verification combination scenario testing
         * @tc.desc Pass in the ECCKeyPar structure with a signature verification type of "ECC384|SHA224"
         * and use a promise style interface
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1600",
            0,
            async function (done) {
                await asyPromise
                    .signAndVerifyBySpecProcess(
                        asyCommon.genEccCommonSpec(),
                        "ECC384|SHA224"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyPromise signAndVerifyBySpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1700
         * @tc.name Use createAsyKeyGeneratorBySpec to Create ECC asyKeySpec
         * and Signature verification combination scenario testing
         * @tc.desc Pass in the ECCKeyPar structure with a signature verification type of "ECC521|SHA256"
         * and use a callback style interface
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1700",
            0,
            async function (done) {
                await asyCallback
                    .signAndVerifyBySpecProcess(
                        asyCommon.genEccCommonSpec(),
                        "ECC521|SHA256"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyCallback signAndVerifyBySpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1800
         * @tc.name Use createAsyKeyGenerator to Create DSA asyKeySpec
         * and Signature verification combination scenario testing
         * @tc.desc Pass in the DSAKeyPar structure with a signature verification type of "DSA|SHA1"
         * and use a promise style interface
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1800",
            0,
            async function (done) {
                await asyPromise
                    .signAndVerifyBySpecProcess(
                        asyCommon.genDsa2048CommonSpecBigE(),
                        "DSA|SHA1"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "AsyPromise signAndVerifyBySpecProcess catch error: " + err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

 
    }
    );
}
