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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import Data from './utils/common/data.js';
import { HuksHmac } from './utils/param/hmac/publicHmacParam.js';
import { checkSoftware, makeOptions, stringToArray } from './utils/param/publicFunc.js';
import { logger } from './utils/common/logger';
import * as huksCallback from './utils/param/huksCallback.js';

var handle;
let srcData63Kb = Data.Data_63KB;
let srcData65Kb = Data.Data_65KB;
let baseHuksOptions = {};
let useSoftware = true;

async function resetOptions() {
    baseHuksOptions = {
        properties: new Array(HuksHmac.HuksKeyAlg, HuksHmac.HuksKeyPurpose),
        inData: new Array(),
    };
}

async function publicHmacUpdate(HuksOptions) {
    let dateSize = 64 * 1024;
    let huksOptionsInData = HuksOptions.inData;
    let inDataArray = stringToArray(HuksOptions.inData);

    if (HuksOptions.inData.length <= dateSize) {
        HuksOptions.inData = new Uint8Array(inDataArray);
        await huksCallback.update(handle, HuksOptions)
            .then((data) => {
                logger.log(`test update data: ${data}`);
            })
            .catch((err) => {
                logger.error("test update err information: " + JSON.stringify(err));
                expect(null).assertFail();
            });
        HuksOptions.inData = huksOptionsInData;
    } else {
        let count = Math.floor(inDataArray.length / dateSize);
        let remainder = inDataArray.length % dateSize;
        for (let i = 0; i < count; i++) {
            HuksOptions.inData = new Uint8Array(
                stringToArray(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1))
            );
            await huksCallback.update(handle, HuksOptions)
                .then((data) => {
                    logger.log(`test update data: ${data}`);
                })
                .catch((err) => {
                    logger.error("test update err information: " + JSON.stringify(err));
                    expect(null).assertFail();
                });
        }
        if (remainder !== 0) {
            HuksOptions.inData = new Uint8Array(
                stringToArray(huksOptionsInData).slice(
                    dateSize * count,
                    inDataArray.length
                )
            );
            logger.log(`test update HuksOptions.inData ${HuksOptions.inData}`);
            await huksCallback.update(handle, HuksOptions)
                .then((data) => {
                    logger.log(`test update data: ${data}`);
                })
                .catch((err) => {
                    logger.log("test update err information: " + JSON.stringify(err));
                    expect(null).assertFail();
                });
        }
    }
}

async function publicHmacGenFunc(srcKeyAlias, HuksOptions, thirdInterfaceName) {
    HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
    await huksCallback.generateKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log("test generateKey data = " + JSON.stringify(data));
        })
        .catch((err) => {
            logger.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(null).assertFail();
        });
    HuksOptions.properties.splice(1, 1);
    await huksCallback.init(srcKeyAlias, HuksOptions)
        .then((data) => {
            handle = data.handle;
            logger.log(`test init data: ${JSON.stringify(data)}`);
        })
        .catch((err) => {
            logger.log(`test init err: " + ${JSON.stringify(err)}`);
            expect(null).assertFail();
        });
    await publicHmacUpdate(HuksOptions);
    if (thirdInterfaceName == "finish") {
        HuksOptions.inData = new Uint8Array(stringToArray("0"));
        await huksCallback.finish(handle, HuksOptions)
            .then((data) => {
                logger.log(`test update data: ${data}`);
            })
            .catch((err) => {
                logger.log("test update err information: " + JSON.stringify(err));
                expect(null).assertFail();
            });
    } else {
        await huksCallback.abort(handle, HuksOptions)
            .then((data) => {
                logger.log(`test abort data: ${data}`);
            })
            .catch((err) => {
                logger.log("test abort err information: " + JSON.stringify(err));
                expect(null).assertFail();
            });
    }
    HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
    await huksCallback.deleteKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test deleteKey data: ${data}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.log("test deleteKey err information: " + JSON.stringify(err));
            expect(null).assertFail();
        });
}

export default function SecurityHuksHmacCallbackJsunit() {
    describe("SecurityHuksHmacCallbackJsunit", function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        beforeEach(function () {
            resetOptions();
        });
        /**
         * @tc.name   Security_HUKS_Hmac_API8_SHA_1001
         * @tc.number Security_HUKS_Hmac_API8_SHA_1001
         * @tc.desc   Security_HUKS_Hmac_API8_SHA_1001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SHA_1001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSHA256KeyAlias001";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSHA256
                ),
                inData: srcData63Kb,
            };

            await publicHmacGenFunc(srcKeyAlias, HuksOptions, "finish");
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_SHA_1002
         * @tc.number Security_HUKS_Hmac_API8_SHA_1002
         * @tc.desc   Security_HUKS_Hmac_API8_SHA_1002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SHA_1002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSHA256KeyAlias002";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSHA256
                ),
                inData: srcData63Kb,
            };
            await publicHmacGenFunc(srcKeyAlias, HuksOptions, "abort");
            done();
        });
        /**
         * @tc.name   Security_HUKS_Hmac_API8_SHA_1003
         * @tc.number Security_HUKS_Hmac_API8_SHA_1003
         * @tc.desc   Security_HUKS_Hmac_API8_SHA_1003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SHA_1003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSHA256KeyAlias003";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSHA256
                ),
                inData: srcData65Kb,
            };
            await publicHmacGenFunc(srcKeyAlias, HuksOptions, "finish");
            done();
        });
        /**
         * @tc.name   Security_HUKS_Hmac_API8_SHA_1004
         * @tc.number Security_HUKS_Hmac_API8_SHA_1004
         * @tc.desc   Security_HUKS_Hmac_API8_SHA_1004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SHA_1004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSHA256KeyAlias004";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSHA256
                ),
                inData: srcData65Kb,
            };
            await publicHmacGenFunc(srcKeyAlias, HuksOptions, "abort");
            done();
        });
        /**
         * @tc.name   Security_HUKS_Hmac_API8_SM3_001
         * @tc.number Security_HUKS_Hmac_API8_SM3_001
         * @tc.desc   Security_HUKS_Hmac_API8_SM3_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SM3_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSM3KeyAlias001";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSM3
                ),
                inData: srcData63Kb,
            };

            await publicHmacGenFunc(srcKeyAlias, HuksOptions, "finish");
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_SM3_002
         * @tc.number Security_HUKS_Hmac_API8_SM3_002
         * @tc.desc   Security_HUKS_Hmac_API8_SM3_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SM3_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSM3KeyAlias002";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSM3
                ),
                inData: srcData63Kb,
            };
            await publicHmacGenFunc(srcKeyAlias, HuksOptions, "abort");
            done();
        });
        /**
         * @tc.name   Security_HUKS_Hmac_API8_SM3_003
         * @tc.number Security_HUKS_Hmac_API8_SM3_003
         * @tc.desc   Security_HUKS_Hmac_API8_SM3_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SM3_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSM3KeyAlias003";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSM3
                ),
                inData: srcData65Kb,
            };
            await publicHmacGenFunc(srcKeyAlias, HuksOptions, "finish");
            done();
        });
        /**
         * @tc.name   Security_HUKS_Hmac_API8_SM3_004
         * @tc.number Security_HUKS_Hmac_API8_SM3_004
         * @tc.desc   Security_HUKS_Hmac_API8_SM3_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SM3_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSM3KeyAlias004";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSM3
                ),
                inData: srcData65Kb,
            };
            await publicHmacGenFunc(srcKeyAlias, HuksOptions, "abort");
            done();
        });
        /**
         * @tc.name   Security_HUKS_Hmac_API8_DigestSHA1_001
         * @tc.number Security_HUKS_Hmac_API8_DigestSHA1_001
         * @tc.desc   Security_HUKS_Hmac_API8_DigestSHA1_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_DigestSHA1_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testHmacDigestSHA1KeyAlias001';
            let first = new Array(HuksHmac.HuksTagDigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData63Kb);
            if (useSoftware) {
                await publicHmacGenFunc(srcKeyAlias, HuksOptions, 'finish');
            }
            done();
        });
    });
}
