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
import * as asyPromise from "./utils/asysmmetricspec/publicAsymmetricSpecPromise";
import * as asyCommon from "./utils/common/publicDoSpec";

function genRsa2048KeyPairSpec() {
    return asyCommon.genRsa2048KeyPairSpec();
}

function genDsa2048KeyPairSpec() {
    return asyCommon.genDsa2048KeyPairSpecBigE();
}

function genEccKeyTypeSpec(keyType) {
    return asyCommon.genEccKeySpec(keyType);
}

export default function AsyGetKeySpecBySpecJsunit() {
    describe("AsyGetKeySpecBySpecJsunit", function () {
        console.log("##########start AsyGetKeySpecBySpecJsunit##########");
        beforeAll(function () {
        });
        afterEach(function () {
        });

        /**
         * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0100
         * @tc.number Security_CryptoFramework_GeneratorBySpec_Func_0100
         * @tc.desc   the asyKeySpec is RSA key pair, Use the callback Style of Interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_AsyKeySpec_Func_0100",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let rsaKeyPairSpec = genRsa2048KeyPairSpec();
                let asyKeyGeneratorSpec =
                cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
                await asyKeyGeneratorSpec
                    .generateKeyPair()
                    .then((keyPair) => {
                        let pk = keyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.RSA_PK_BN
                        );
                        expect(pk == rsaKeyPairSpec.pk).assertTrue();
                        let n = keyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.RSA_N_BN
                        );
                        expect(n == rsaKeyPairSpec.params.n).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_AsyKeySpec_Func_0100 failed. error is " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0200
         * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0200
         * @tc.desc   the asyKeySpec is Dsa Key Pair, Use the promise Style of Interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_AsyKeySpec_Func_0200",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let dsaKeyPairSpec = genDsa2048KeyPairSpec();
                let asyKeyPairSpec =
                cryptoFramework.createAsyKeyGeneratorBySpec(dsaKeyPairSpec);
                await asyKeyPairSpec
                    .generateKeyPair()
                    .then((keyPair) => {
                        let p = keyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.DSA_P_BN
                        );
                        expect(p == dsaKeyPairSpec.params.p).assertTrue();
                        let q = keyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.DSA_Q_BN
                        );
                        expect(q == dsaKeyPairSpec.params.q).assertTrue();
                        let g = keyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.DSA_G_BN
                        );
                        expect(g == dsaKeyPairSpec.params.g).assertTrue();
                        let pk = keyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.DSA_PK_BN
                        );
                        expect(pk == dsaKeyPairSpec.pk).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_AsyKeySpec_Func_0200 failed. error is " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0300
         * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0300
         * @tc.desc   the asyKeySpec is RSA key pair, Use the callback Style of Interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_AsyKeySpec_Func_0300",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let eccKeyPairSpec = genEccKeyTypeSpec(
                    cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC
                );
                let asyKeyGeneratorSpec =
                cryptoFramework.createAsyKeyGeneratorBySpec(eccKeyPairSpec);
                let callbackKeyPair;
                await asyKeyGeneratorSpec
                    .generateKeyPair()
                    .then((keyPair) => {
                        callbackKeyPair = keyPair;
                        let p = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN
                        );
                        expect(p == eccKeyPairSpec.params.field.p).assertTrue();
                        let a = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_A_BN
                        );
                        expect(a == eccKeyPairSpec.params.a).assertTrue();
                        let b = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_B_BN
                        );
                        expect(b == eccKeyPairSpec.params.b).assertTrue();
                        let gx = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_G_X_BN
                        );
                        expect(gx == eccKeyPairSpec.params.g.x).assertTrue();
                        let gy = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN
                        );
                        expect(gy == eccKeyPairSpec.params.g.y).assertTrue();
                        let n = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_N_BN
                        );
                        expect(n == eccKeyPairSpec.params.n).assertTrue();
                        let h = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_H_NUM
                        );
                        expect(h == eccKeyPairSpec.params.h).assertTrue();
                        let pkx = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN
                        );
                        expect(pkx == eccKeyPairSpec.pk.x).assertTrue();
                        let pky = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN
                        );
                        expect(pky == eccKeyPairSpec.pk.y).assertTrue();
                        let fieldType = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR
                        );
                        expect(
                            fieldType == eccKeyPairSpec.params.field.fieldType
                        ).assertTrue();
                        let fieldSize = callbackKeyPair.pubKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM
                        );
                        expect(fieldSize == 224).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_AsyKeySpec_Func_0300 failed. error is " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0400
         * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0400
         * @tc.desc   the asyKeySpec is genRsa2048KeyPairSpec, Use the promise Style of Interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_AsyKeySpec_Func_0400",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let rsaKeyPairSpec = genRsa2048KeyPairSpec();
                let asyKeyPairSpec =
                cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
                await asyKeyPairSpec
                    .generateKeyPair()
                    .then((keyPair) => {
                        let n = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.RSA_N_BN
                        );
                        expect(n == rsaKeyPairSpec.params.n).assertTrue();
                        let sk = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.RSA_SK_BN
                        );
                        expect(sk == rsaKeyPairSpec.sk).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_AsyKeySpec_Func_0400 failed. error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0500
         * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0500
         * @tc.desc   the asyKeySpec is genDsa2048KeyPairSpec, Use the callback Style of Interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_AsyKeySpec_Func_0500",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let dsaKeyPairSpec = genDsa2048KeyPairSpec();
                let asyKeyGeneratorSpec =
                cryptoFramework.createAsyKeyGeneratorBySpec(dsaKeyPairSpec);
                await asyKeyGeneratorSpec
                    .generateKeyPair()
                    .then((keyPair) => {
                        let p = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.DSA_P_BN
                        );
                        expect(p == dsaKeyPairSpec.params.p).assertTrue();
                        let q = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.DSA_Q_BN
                        );
                        expect(q == dsaKeyPairSpec.params.q).assertTrue();
                        let g = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.DSA_G_BN
                        );
                        expect(g == dsaKeyPairSpec.params.g).assertTrue();
                        let sk = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.DSA_SK_BN
                        );
                        expect(sk == dsaKeyPairSpec.sk).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_AsyKeySpec_Func_0500 failed. error: " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0600
         * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0600
         * @tc.desc   the asyKeySpec is eccCommonSpec, Use the promise Style of Interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_AsyKeySpec_Func_0600",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let eccKeyPairSpec = genEccKeyTypeSpec(
                    cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC
                );
                let asyKeyPairSpec =
                cryptoFramework.createAsyKeyGeneratorBySpec(eccKeyPairSpec);
                await asyKeyPairSpec
                    .generateKeyPair()
                    .then((keyPair) => {
                        let p = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN
                        );
                        expect(p == eccKeyPairSpec.params.field.p).assertTrue();
                        let a = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_A_BN
                        );
                        expect(a == eccKeyPairSpec.params.a).assertTrue();
                        let b = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_B_BN
                        );
                        expect(b == eccKeyPairSpec.params.b).assertTrue();
                        let gx = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_G_X_BN
                        );
                        expect(gx == eccKeyPairSpec.params.g.x).assertTrue();
                        let gy = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN
                        );
                        expect(gy == eccKeyPairSpec.params.g.y).assertTrue();
                        let n = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_N_BN
                        );
                        expect(n == eccKeyPairSpec.params.n).assertTrue();
                        let h = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_H_NUM
                        );
                        expect(h == eccKeyPairSpec.params.h).assertTrue();
                        let sk = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_SK_BN
                        );
                        expect(sk == eccKeyPairSpec.sk).assertTrue();
                        let fieldType = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR
                        );
                        expect(
                            fieldType == eccKeyPairSpec.params.field.fieldType
                        ).assertTrue();
                        let fieldSize = keyPair.priKey.getAsyKeySpec(
                            cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM
                        );
                        expect(fieldSize == 224).assertTrue();
                        return;
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_AsyKeySpec_Func_0600 failed. error is " +
                            err
                        );
                        expect(null).assertFail();
                    });
                done();
            }
        );

        /**
         * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0700
         * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0700
         * @tc.desc   Call it as a synchronously without passing in parameters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_AsyKeySpec_Func_0700",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let rsaKeyPairSpec = genRsa2048KeyPairSpec();
                let rsaKeyGeneratorSpec =
                cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
                var rsaKeyPair;
                await rsaKeyGeneratorSpec.generateKeyPair().then((keyPair) => {
                    rsaKeyPair = keyPair;
                });
                try {
                    rsaKeyPair.pubKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.DSA_P_BN
                    );
                    expect(null).assertFalse();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    rsaKeyPair.pubKey.getAsyKeySpec(1024);
                    expect(null).assertFalse();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    rsaKeyPair.pubKey.getAsyKeySpec();
                    expect(null).assertFalse();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0800
         * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0800
         * @tc.desc   Call it as a synchronously without passing in parameters
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_AsyKeySpec_Func_0800",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let rsaKeyPairSpec = genRsa2048KeyPairSpec();
                let rsaKeyGeneratorSpec =
                cryptoFramework.createAsyKeyGeneratorBySpec(rsaKeyPairSpec);
                var rsaKeyPair;
                await rsaKeyGeneratorSpec.generateKeyPair().then((keyPair) => {
                    rsaKeyPair = keyPair;
                });
                try {
                    rsaKeyPair.priKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.DSA_P_BN
                    );
                    expect(null).assertFalse();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    rsaKeyPair.priKey.getAsyKeySpec(
                        cryptoFramework.AsyKeySpecItem.RSA_N_BN,
                        cryptoFramework.AsyKeySpecItem.RSA_N_BN
                    );
                    expect(null).assertFalse();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    rsaKeyPair.priKey.getAsyKeySpec(1024);
                    expect(null).assertFalse();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                try {
                    rsaKeyPair.priKey.getAsyKeySpec();
                    expect(null).assertFalse();
                } catch (err) {
                    expect(err.code).assertEqual(401);
                }
                done();
            }
        );

        /**
         * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_0900
         * @tc.number Security_CryptoFramework_AsyKeySpec_Func_0900
         * @tc.desc   the asyKeySpec is eccCommonSpec, Use the callback Style of Interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_AsyKeySpec_Func_0900",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                let dsaKeyGeneratorSpec =
                cryptoFramework.createAsyKeyGenerator("DSA1024");
                var dsaKeyPair;
                await dsaKeyGeneratorSpec.generateKeyPair().then((keyPair) => {
                    dsaKeyPair = keyPair;
                });
                try {
                    dsaKeyPair.pubKey.clearMem();
                    expect(null).assertFalse();
                } catch (err) {
                    expect(err != null).assertTrue();
                }
                done();
            }
        );

        /**
         * @tc.name   Security_CryptoFramework_AsyKeySpec_Func_1000
         * @tc.number Security_CryptoFramework_AsyKeySpec_Func_1000
         * @tc.desc   the asyKeySpec is eccCommonSpec, Use the promise Style of Interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it(
            "Security_CryptoFramework_AsyKeySpec_Func_1000",
            TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async function (done) {
                asyPromise
                    .clearMemGetAsyKeySpec(
                        genEccKeyTypeSpec(cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC)
                    )
                    .then((result) => {
                        expect(result).assertTrue();
                    })
                    .catch((err) => {
                        console.error(
                            "Security_CryptoFramework_AsyKeySpec_Func_1000 catch err " + err
                        );
                        expect(err.code).assertEqual(undefined);
                    });
                done();
            }
        );
    });
}
