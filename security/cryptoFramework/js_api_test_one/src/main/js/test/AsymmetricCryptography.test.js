/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import * as asyCallback from "./utils/asymmetric/publicAsymmetricCallback";

export default function AsymmetricCryptographyJsunit() {
  describe("AsymmetricCryptographyJsunit", function () {
    console.info("##########start AsymmetricCryptographyJsunit##########");
    beforeAll(function () {});
    afterEach(function () {});

    /**
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_0100
     * @tc.name Test RSA1024|PRIMES_2 normal encryption and decryption
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_Encryption_RSA_0100",
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
        async function (done) {
            await asyCallback
                .encryptAndDecryptNormalProcessNull(
                    "RSA4096",
                    "RSA4096|PKCS1"
                )
                .then((data) => {
                    expect(data == "Error: doFinal failed.").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_Encryption_RSA_1400 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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
        0,
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

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1100
     * @tc.name Test RSA2048|PSS|SHA1|MGF1_SHA1 normal sign and verify
     * @tc.desc Use the Promise Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1100",
        0,
        async function (done) {
            await asyPromise
                .signAndVerifyNormalProcess("RSA8192", "RSA8192|PSS|SHA512|MGF1_SHA512")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1100 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1200
     * @tc.name Test RSA2048|PSS|SHA1|MGF1_SHA1 normal sign and verify
     * @tc.desc Use the Promise Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1200",
        0,
        async function (done) {
            await asyPromise
                .signAndVerifyNormalProcess("RSA512", "RSA512|PSS|SHA384|MGF1_SHA384")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1200 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_5000
     * @tc.name Test RSA2048|PSS|SHA1|MGF1_SHA1 normal sign and verify
     * @tc.desc Use the Promise Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_RSA_5000",
        0,
        async function (done) {
            await asyPromise
                .signAndVerifyNormalProcessDataException("RSA512", "RSA512|PSS|SHA384|MGF1_SHA384", "null")
                .then((data) => {
                    expect(data == "Error: [Data]: must be of the DataBlob type.").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_RSA_5000 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1300
     * @tc.name Test RSA256 or null normal sign and verify
     * @tc.desc Use the Promise Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1300",
        0,
        async function (done) {
            await asyPromise
                .createAsyKeyGeneratorFail("RSA256")
                .then((data) => {
                    expect(data == "TypeError: Cannot read property algName of null").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1300 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            await asyPromise
                .createAsyKeyGeneratorFail("null")
                .then((data) => {
                    expect(data == "TypeError: Cannot read property algName of null").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1300 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1400
     * @tc.name Test RSA2048|PSS|SHA1|MGF1_SHA1 normal sign and verify
     * @tc.desc Use the Promise Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1400",
        0,
        async function (done) {
            await asyPromise
                .createAsySignFail(
                    "RSA3072",
                    "RSA4096|null|SHA256",
                    "RSA4096|PKCS1|null",
                    "RSA4096|PKCS1|SHA122",
                    "RSA4096|PKCS3|SHA256"
                )
                .then((data) => {
                    expect(data == "TypeError: Cannot read property algName of undefined").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1400 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_2000
     * @tc.name Test RSA4096|PKCS1 normal encryption and decryption
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_Encryption_RSA_2000",
        0,
        async function (done) {
            await asyCallback
                .encryptAndDecryptNormalProcessSuperdata(
                    "RSA4096",
                    "RSA4096|PKCS1",
                    "490"
                )
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_Encryption_RSA_2000 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_2100
     * @tc.name Test RSA3072|PKCS1|SHA224 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_RSA_2100",
        0,
        async function (done) {
            await asyCallback
                .signAndVerifyNormalProcessSuperdata(
                    "RSA3072",
                    "RSA3072|PKCS1|SHA224",
                    "350"
                )
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_RSA_2100 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_RSA_1500
     * @tc.name Test RSA2048|PSS|SHA1|MGF1_SHA1 normal sign and verify
     * @tc.desc Use the Promise Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1500",
        0,
        async function (done) {
            await asyPromise
                .createAsyVerifyFail(
                    "RSA3072",
                    "RSA4096|null|SHA256",
                    "RSA4096|PKCS1|null",
                    "RSA4096|PKCS1|SHA122",
                    "RSA4096|PKCS3|SHA256"
                )
                .then((data) => {
                    expect(data == "TypeError: Cannot read property algName of undefined").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_RSA_1500 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0100
     * @tc.name Test ECC224|SHA256 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0100",
        0,
        async function (done) {
            await asyCallback
                .signAndVerifyNormalProcess("ECC224", "ECC224|SHA256")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0100 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0200
     * @tc.name Test ECC256|SHA1 normal sign and verify
     * @tc.desc Use the Promise Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0200",
        0,
        async function (done) {
            await asyPromise
                .signAndVerifyNormalProcess("ECC256", "ECC256|SHA1")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0200 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0300
     * @tc.name Test ECC224|SHA256 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0300",
        0,
        async function (done) {
            await asyCallback
                .signAndVerifyNormalProcess("ECC384", "ECC384|SHA224")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0300 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0400
     * @tc.name Test ECC521|SHA384 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0400",
        0,
        async function (done) {
            await asyPromise
                .signAndVerifyNormalProcess("ECC521", "ECC521|SHA384")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0400 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0500
     * @tc.name Test ECC224|SHA512 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0500",
        0,
        async function (done) {
            await asyPromise
                .signAndVerifyNormalProcess("ECC224", "ECC224|SHA512")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0500 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0600
     * @tc.name Test ECC1 or NULL normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0600",
        0,
        async function (done) {
            await asyCallback
                .createAsyKeyGeneratorFail("ECC1")
                .then((data) => {
                    expect(data == "TypeError: Cannot read property algName of null").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0600 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            await asyCallback
                .createAsyKeyGeneratorFail("null")
                .then((data) => {
                    expect(data == "TypeError: Cannot read property algName of null").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0600 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0700
     * @tc.name Test ECC224 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0700",
        0,
        async function (done) {
            await asyPromise
                .createAsySignFail(
                    "ECC224",
                    "ECC224|SHA257",
                    "ECC224|NULL",
                    "NULL|SHA1",
                    "ECC|SHA"
                )
                .then((data) => {
                    expect(data == "TypeError: Cannot read property algName of undefined").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0700: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0800
     * @tc.name Test RSA3072 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0800",
        0,
        async function (done) {
            await asyPromise
                .createAsyVerifyFail(
                    "ECC224",
                    "ECC1|SHA256",
                    "NULL|SHA256",
                    "ECC224|SHA122",
                    "ECC224|NULL"
                )
                .then((data) => {
                    expect(data == "TypeError: Cannot read property algName of undefined").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0800 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0900
     * @tc.name Test ECC224|SHA512 normal sign and verify
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0900",
        0,
        async function (done) {
            await asyCallback
                .signAndVerifyNormalProcessSuperdata(
                    "ECC224",
                    "ECC224|SHA512",
                    "350"
                )
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDSA_0900 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0100
     * @tc.name Test ECC224 SignVerify ECDH
     * @tc.desc Use the Promise Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0100",
        0,
        async function (done) {
            await asyPromise
                .keyAgreementProcess("ECC224")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0100 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0200
     * @tc.name Test ECC256 SignVerify ECDH
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0200",
        0,
        async function (done) {
            await asyCallback
                .keyAgreementProcess("ECC256")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0200 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0300
     * @tc.name Test ECC384 SignVerify ECDH
     * @tc.desc Use the Promise Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0300",
        0,
        async function (done) {
            await asyPromise
                .keyAgreementProcess("ECC384")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0300 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0400
     * @tc.name Test ECC521 SignVerify ECDH
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0400",
        0,
        async function (done) {
            await asyCallback
                .keyAgreementProcess("ECC521")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0400 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0500
     * @tc.name Test ECC5 or null SignVerify ECDH
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0500",
        0,
        async function (done) {
            await asyCallback
                .createAsyKeyAgreementFail("ECC5")
                .then((data) => {
                    expect(data == "TypeError: Cannot read property algName of undefined").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0500 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            await asyCallback
                .createAsyKeyAgreementFail("null")
                .then((data) => {
                    expect(data == "TypeError: Cannot read property algName of undefined").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0500 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0600
     * @tc.name Test ECC256 SignVerify ECDH
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0600",
        0,
        async function (done) {
            await asyCallback
                .keyAgreementProcessParameterException("ECC256")
                .then((data) => {
                    expect(data == "Error: [PriKey]: param unwarp error.").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0600 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_SignVerify_ECDH_0700
     * @tc.name Test RSA3072 SignVerify ECDH
     * @tc.desc Use the Callback Style of Interface
     */
    it(
        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0700",
        0,
        async function (done) {
            await asyCallback
                .keyAgreementProcessFail("RSA3072", "ECC521")
                .then((data) => {
                    expect(data == "Error: An exception occurs.").assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_SignVerify_ECDH_0700 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_3300
     * @tc.name Test convertKey
     * @tc.desc Use RSA3072|PRIMES_2 algorithm
     */
    it(
        "Security_crypto_framework_ASymmetric_Encryption_RSA_3300",
        0,
        async function (done) {
            await asyPromise
                .convertKeyEncryptAndDecryptProcess("RSA3072|PRIMES_2")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_Encryption_RSA_3300 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );

    /**
     * @tc.number Security_crypto_framework_ASymmetric_Encryption_RSA_3100
     * @tc.name Test convertKey
     * @tc.desc Use RSA1024|PRIMES_2 algorithm
     */
    it(
        "Security_crypto_framework_ASymmetric_Encryption_RSA_3100",
        0,
        async function (done) {
            await asyPromise
                .AsyPriKeyClearProcess("RSA1024|PRIMES_2")
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    console.error(
                        "Security_crypto_framework_ASymmetric_Encryption_RSA_3100 catch  error: " +
                        err
                    );
                    expect(null).assertFail();
                });
            done();
        }
    );
  });
}
