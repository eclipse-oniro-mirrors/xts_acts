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

import cryptoFramework from "@ohos.security.cryptoFramework";
import { describe, beforeAll, afterEach, it, TestType, Size, Level, expect } from "@ohos/hypium";
import * as asyCallback from "./utils/asysmmetricspec/publicAsymmetricSpecCallback";
import * as asyPromise from "./utils/asysmmetricspec/publicAsymmetricSpecPromise";
import * as common from "./utils/common/publicDoSpec";

function genDsa2048CommonSpec() {
    return common.genDsa2048CommonSpecBigE();
}

function genDsa2048KeyPairSpec() {
    return common.genDsa2048KeyPairSpecBigE();
}

function genDsa2048PubKeySpec() {
    return common.genDsa2048PubKeySpecBigE();
}

function genEccKeyTypeSpec(keyType) {
    return common.genEccKeySpec(keyType);
}

export default function AsyKeyGeneratorBySpecJsunit() {
    describe("AsyKeyGeneratorBySpecJsunit", function () {
        console.info("##########start AsyKeyGeneratorBySpecJsunit##########");
        beforeAll(function () {
        });
        afterEach(function () {
        });

        /**
         * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0100
         * @tc.name DSA Key generation scenario by spec
         * @tc.desc the asyKeySpec is genDsa2048CommonSpec, Use the callback Style of Interface
         */
        it(
            "Security_CryptoFramework_GeneratorBySpec_Func_0100",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                asyCallback
                    .generateByCommonSpec(genDsa2048CommonSpec(), "DSA")
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_GeneratorBySpec_Func_1900 catch err " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0200
         * @tc.name DSA Key generation scenario by spec
         * @tc.desc the asyKeySpec is genDsa2048PubKeySpec, Use the promise Style of Interface
         */
        it(
            "Security_CryptoFramework_GeneratorBySpec_Func_0200",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                asyPromise
                    .generateByPubKeySpec(genDsa2048PubKeySpec(), "DSA")
                    .then((data) => {
                        expect(data == null).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_GeneratorBySpec_Func_0200 catch err " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0300
         * @tc.name DSA Key generation scenario by spec
         * @tc.desc the asyKeySpec is genDsa2048KeyPairSpec, Use the promise Style of Interface
         */
        it(
            "Security_CryptoFramework_GeneratorBySpec_Func_0300",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                asyPromise
                    .generateByKeyPairSpec(genDsa2048KeyPairSpec(), "DSA")
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_GenerateBySpec_Func_0300 catch err " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0400
         * @tc.name DSA pubKey generate prikey failed
         * @tc.desc the asyKeySpec is genDsa2048PubKeySpec, Use the callback Style of Interface
         */
        it(
            "Security_CryptoFramework_GeneratorBySpec_Func_0400",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let asyKeyPairSpec = cryptoFramework.createAsyKeyGeneratorBySpec(
                    genDsa2048PubKeySpec()
                );
                asyKeyPairSpec
                    .generatePriKey()
                    .then((priKey) => {
                        console.log("priKey" + priKey);
                        expect(null).assertFail();
                    })
                    .catch((err) => {
                        console.error(
                            "generatePubTopriSpecFailed Security_CryptoFramework_GeneratorBySpec_Func_0400" +
                            " failed. error is " +
                            err
                        );
                        expect(err.code).assertEqual(401);
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0500
         * @tc.name ECC Key generation scenario by spec
         * @tc.desc the asyKeySpec is eccCommonSpec, Use the callback Style of Interface
         */
        it(
            "Security_CryptoFramework_GeneratorBySpec_Func_0500",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                asyCallback
                    .generateByCommonSpec(
                        genEccKeyTypeSpec(
                            cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC
                        ),
                        "ECC"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_GeneratorBySpec_Func_0500 catch err " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0600
         * @tc.name ECC Key generation scenario by spec
         * @tc.desc the asyKeySpec is eccPriKeySpec, Use the callback Style of Interface
         */
        it(
            "Security_CryptoFramework_GeneratorBySpec_Func_0600",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                asyCallback
                    .generateByPriKeySpec(
                        genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC),
                        "ECC"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_GeneratorBySpec_Func_0600 catch err " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0700
         * @tc.name ECC Key generation scenario by spec
         * @tc.desc the asyKeySpec is eccPubKeySpec, Use the promise Style of Interface
         */
        it(
            "Security_CryptoFramework_GeneratorBySpec_Func_0700",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                asyPromise
                    .generateByPubKeySpec(
                        genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC),
                        "ECC"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_GeneratorBySpec_Func_0700 catch err " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0800
         * @tc.name ECC Key generation scenario by spec
         * @tc.desc the asyKeySpec is eccKeyPairSpec, Use the promise Style of Interface
         */
        it(
            "Security_CryptoFramework_GeneratorBySpec_Func_0800",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                asyPromise
                    .generateByKeyPairSpec(
                        genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC),
                        "ECC"
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_GeneratorBySpec_Func_0800 catch err " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );
    });
}
