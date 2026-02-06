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
        });
        afterEach(function () {
        });

        /**
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_0100
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0100
         * @tc.desc   Pass in the RSAKeyPar structure with a signature verification type of "RSA512|PKCS1|MD5"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0100",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_0200
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0200
         * @tc.desc   Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0200",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_0300
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0300
         * @tc.desc   Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0300",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_0400
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0400
         * @tc.desc   Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0400",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_0500
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0500
         * @tc.desc   Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0500",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_0600
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0600
         * @tc.desc   Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0600",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_0700
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0700
         * @tc.desc   Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0700",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_0800
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0800
         * @tc.desc   Pass in the RSAKeyPar structure with a signature verification type of "RSA|PKCS1|MD5"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0800",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_0900
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_0900
         * @tc.desc   Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_0900",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_1000
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1000
         * @tc.desc   Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1000",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_1100
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1100
         * @tc.desc   Use a callback style interface to pass in the RSAKeyPar structure with signature verification type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1100",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_1200
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1200
         * @tc.desc   Use a promise style interface to pass in the RSAKeyPar structure with signature verification type
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1200",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_1300
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1300
         * @tc.desc   Pass in the ECCKeyPar structure with a signature verification type of "ECC256|SHA256"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1300",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_1400
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1400
         * @tc.desc   Pass in the ECCKeyPair structure with a signature verification type of "ECC|SHA224"(No length)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1400",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_1500
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1500
         * @tc.desc   Pass in the ECCKeyPar structure with a signature verification type of "ECC224|SHA256"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1500",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_1600
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1600
         * @tc.desc   Pass in the ECCKeyPar structure with a signature verification type of "ECC384|SHA224"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1600",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_1700
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1700
         * @tc.desc   Pass in the ECCKeyPar structure with a signature verification type of "ECC521|SHA256"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1700",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
         * @tc.name   Security_CryptoFramework_SignatureVerification_Func_1800
         * @tc.number Security_CryptoFramework_SignatureVerification_Func_1800
         * @tc.desc   Pass in the DSAKeyPar structure with a signature verification type of "DSA|SHA1"
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_SignatureVerification_Func_1800",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
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
