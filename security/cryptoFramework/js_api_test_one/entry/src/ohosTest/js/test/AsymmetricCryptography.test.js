/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function AsymmetricCryptographyJsunit() {
    describe("AsymmetricCryptographyJsunit", function () {
        console.info("##########start AsymmetricCryptographyJsunit##########");
        beforeAll(function () {
        });
        afterEach(function () {
        });

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0100
         * @tc.name Test RSA1024|PRIMES_2 normal encryption and decryption
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0100",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .encryptAndDecryptNormalProcess(
                        "RSA1024|PRIMES_2",
                        "RSA1024|PKCS1|SHA256"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_0100 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0200
         * @tc.name Test RSA2048|PRIMES_2 normal encryption and decryption
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0200",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .encryptAndDecryptNormalProcess(
                        "RSA2048|PRIMES_2",
                        "RSA2048|PKCS1|MD5"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_0200 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0300
         * @tc.name Test RSA3072 normal encryption and decryption
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0300",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .encryptAndDecryptNormalProcess(
                        "RSA3072",
                        "RSA3072|PKCS1|SHA224"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_0300 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0400
         * @tc.name Test RSA4096 normal encryption and decryption
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0400",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .encryptAndDecryptNormalProcess(
                        "RSA4096",
                        "RSA4096|PKCS1_OAEP|MD5|MGF1_SHA512"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_0400 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0500
         * @tc.name Test RSA3072 normal encryption and decryption
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0500",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .encryptAndDecryptNormalProcess(
                        "RSA8192",
                        "RSA8192|PKCS1_OAEP|SHA1|MGF1_SHA384"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_0500 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0600
         * @tc.name Test RSA3072|PKCS1|SHA256 normal encryption and decryption
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0600",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .encryptAndDecryptNormalProcess(
                        "RSA3072|PRIMES_3",
                        "RSA3072|PKCS1|SHA256"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_0600 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0700
         * @tc.name Test RSA3072|PKCS1|SHA512 normal encryption and decryption
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0700",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .encryptAndDecryptNormalProcess(
                        "RSA3072",
                        "RSA3072|PKCS1|SHA512"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_0700 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0800
         * @tc.name Test RSA3072|PKCS1_OAEP|SHA224|MGF1_SHA256 normal encryption and decryption
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0800",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .encryptAndDecryptNormalProcess(
                        "RSA3072",
                        "RSA3072|PKCS1_OAEP|SHA224|MGF1_SHA256"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_0800 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0900
         * @tc.name Test RSA512|PKCS1_OAEP|SHA256|MGF1_SHA224 normal encryption and decryption
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_0900",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .encryptAndDecryptNormalProcess(
                        "RSA1024",
                        "RSA1024|PKCS1_OAEP|SHA256|MGF1_SHA224"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_0900 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_1000
         * @tc.name Test RSA3072|PKCS1_OAEP|SHA384|MGF1_SHA1 normal encryption and decryption
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_1000",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .encryptAndDecryptNormalProcess(
                        "RSA3072|PRIMES_3",
                        "RSA3072|PKCS1_OAEP|SHA384|MGF1_SHA1"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_1000 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_1100
         * @tc.name Test RSA3072|PKCS1_OAEP|SHA512|MGF1_MD5 normal encryption and decryption
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_1100",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .encryptAndDecryptNormalProcess(
                        "RSA3072",
                        "RSA3072|PKCS1_OAEP|SHA512|MGF1_MD5"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_1100 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_1200
         * @tc.name Test RSA3072|PKCS1 normal encryption and decryption
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_1200",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .encryptAndDecryptNormalProcess(
                        "RSA3072",
                        "RSA3072|PKCS1"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_1200 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_1300
         * @tc.name Test RSA4096|PKCS1 normal encryption and decryption
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_1300",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .encryptAndDecryptNormalProcess(
                        "RSA4096",
                        "RSA4096|PKCS1"
                    )
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_Encryption_RSA_1300 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_1400
         * @tc.name Test RSA4096|PKCS1 normal encryption and decryption
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_Encryption_RSA_1400",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let rsaGenerator = cryptoFramework.createAsyKeyGenerator("RSA4096");
                let cipherGeneratorEncrypt = cryptoFramework.createCipher("RSA4096|PKCS1");
                let globalRsaKeyPair = rsaGenerator.generateKeyPair();
                try {
                    await cipherGeneratorEncrypt.init(cryptoFramework.CryptoMode.ENCRYPT_MODE, globalRsaKeyPair, null);
                    expect(null).assertFail();
                } catch (err) {
                    console.error("err is:" + err.code);
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0100
         * @tc.name Test RSA1024|PKCS1|MD5 normal sign and verify
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0100",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .signAndVerifyNormalProcess("RSA1024|PRIMES_2", "RSA1024|PKCS1|MD5")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0100 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0200
         * @tc.name Test RSA2048|PKCS1|SHA1 normal sign and verify
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0200",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .signAndVerifyNormalProcess("RSA2048|PRIMES_2", "RSA2048|PKCS1|SHA1")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0200 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0300
         * @tc.name Test RSA3072|PKCS1|SHA224 normal sign and verify
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0300",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .signAndVerifyNormalProcess("RSA3072|PRIMES_2", "RSA3072|PKCS1|SHA224")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0300 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0400
         * @tc.name Test RSA2048|PKCS1|SHA1 normal sign and verify
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0400",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .signAndVerifyNormalProcess("RSA4096|PRIMES_2", "RSA4096|PKCS1|SHA256")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0400 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0500
         * @tc.name Test RSA8192|PKCS1|SHA384 normal sign and verify
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0500",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .signAndVerifyNormalProcess("RSA8192|PRIMES_3", "RSA8192|PKCS1|SHA384")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0500 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0600
         * @tc.name Test RSA512|PKCS1|SHA512 normal sign and verify
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0600",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .signAndVerifyNormalProcess("RSA512|PRIMES_2", "RSA512|PKCS1|SHA256")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0600 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0700
         * @tc.name Test RSA1024|PKCS1|MD5|MGF1_MD5 normal sign and verify
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0700",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .signAndVerifyNormalProcess("RSA1024", "RSA1024|PKCS1|MD5|MGF1_MD5")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0700 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0800
         * @tc.name Test RSA2048|PSS|SHA1|MGF1_SHA1 normal sign and verify
         * @tc.desc Use the Promise Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0800",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyPromise
                    .signAndVerifyNormalProcess("RSA2048", "RSA2048|PSS|SHA1|MGF1_SHA1")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0800 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_0900
         * @tc.name Test RSA3072|PSS|SHA224|MGF1_SHA224 normal sign and verify
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0900",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .signAndVerifyNormalProcess("RSA3072", "RSA3072|PSS|SHA224|MGF1_SHA224")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_SignVerify_RSA_0900 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1000
         * @tc.name Test RSA4096|PSS|SHA256|MGF1_SHA256 normal sign and verify
         * @tc.desc Use the Callback Style of Interface
         */
        it(
            "Security_crypto_framework_ASymmetric_SignVerify_RSA_1000",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                await asyCallback
                    .signAndVerifyNormalProcess("RSA4096", "RSA4096|PSS|SHA256|MGF1_SHA256")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_crypto_framework_ASymmetric_SignVerify_RSA_1000 catch  error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );


    });
}

 