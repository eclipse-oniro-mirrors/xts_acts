// @ts-nocheck
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
import { testSecurityRandomPromise } from "./utils/securityrandom/publicSecurityRandomPromise";
import { testSecurityRandomCallback } from "./utils/securityrandom/publicSecurityRandomCallback";
import { testSecurityRandomEnumCommon } from "./utils/securityrandom/publicSecurityRandomCommon";
import cryptoFramework from "@ohos.security.cryptoFramework";

export default function SecurityRandomJsunit() {
    describe("SecurityRandomJsunit", function () {
        console.info("##########start SecurityRandomJsunit##########");
        beforeAll(function () {
        });
        afterEach(function () {
        });

        /**
         * @tc.name   Security_crypto_framework_Random_0100
         * @tc.number Security_crypto_framework_Random_0100
         * @tc.desc   the length of random is 32, use promise style of interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Security_crypto_framework_Random_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await testSecurityRandomPromise(32)
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    expect(null).assertFail();
                });
            done();
        });

        /**
         * @tc.name   Security_crypto_framework_Random_0200
         * @tc.number Security_crypto_framework_Random_0200
         * @tc.desc   the length of random is 32, use callback style of interface
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Security_crypto_framework_Random_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await testSecurityRandomCallback(32)
                .then((data) => {
                    expect(data == null).assertTrue();
                })
                .catch((err) => {
                    expect(null).assertFail();
                });
            done();
        });

        /**
         * @tc.name   Security_crypto_framework_Random_0300
         * @tc.number Security_crypto_framework_Random_0300
         * @tc.desc   First input 0, Second input null, Third input -1, Fourth input 2147483648
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Security_crypto_framework_Random_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let randomGenerator = cryptoFramework.createRandom();
            try {
                await new Promise((resolve, reject) => {
                    randomGenerator.generateRandom(0, (err, dataBlob) => {
                        if (err) {
                            reject(err);
                        } else {
                            resolve(dataBlob);
                        }
                    })
                })
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            try {
                await randomGenerator.generateRandom(null);
                expect(null).assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            try {
                await new Promise((resolve, reject) => {
                    randomGenerator.generateRandom(-1, (err, dataBlob) => {
                        if (err) {
                            reject(err);
                        } else {
                            resolve(dataBlob);
                        }
                    })
                })
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            try {
                await randomGenerator.generateRandom(2147483648);
                expect(null).assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        });

        /**
         * @tc.name   Security_crypto_framework_Random_0400
         * @tc.number Security_crypto_framework_Random_0400
         * @tc.desc   First input null, Second input 0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Security_crypto_framework_Random_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let randomGenerator = cryptoFramework.createRandom();
            try {
                randomGenerator.setSeed(null);
                expect(null).assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            try {
                randomGenerator.setSeed(0);
                expect(null).assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        });

        /**
         * @tc.name   Security_crypto_framework_Random_0500
         * @tc.number Security_crypto_framework_Random_0500
         * @tc.desc   cover 100% Enumerated values
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("Security_crypto_framework_Random_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            testSecurityRandomEnumCommon();
            done();
        });
    });
}
