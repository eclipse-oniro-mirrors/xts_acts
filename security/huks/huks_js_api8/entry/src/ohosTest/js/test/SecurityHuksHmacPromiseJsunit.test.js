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
import huks from '@ohos.security.huks';
import Data from './utils/common/data';
import { HuksHmac } from './utils/param/hmac/publicHmacParam.js';
import { checkSoftware, makeOptions, stringToArray } from './utils/param/publicFunc.js';
import { logger } from './utils/common/logger';
import * as huksCallback from './utils/param/huksCallback.js';
import { HksTag } from './utils/param/publicParam';

let handle;
let srcData63Kb = Data.Data_63KB;
let srcData65Kb = Data.Data_65KB;
let srcData64Kb = Data.Data_64KB;
let useSoftware = true;
let baseHuksOptions = {};
let HuksOptions;

async function resetOptions() {
    baseHuksOptions = {
        properties: new Array(HuksHmac.HuksKeyAlg, HuksHmac.HuksKeyPurpose),
        inData: new Array(),
    };
}

let emptyOptions = { properties: [] };

async function publicHmacGenFunc(srcKeyAlias, HuksOptions) {
    HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
    await huks.generateKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test generateKey data ${JSON.stringify(data)}`);
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error("test generateKey err information: " + JSON.stringify(err));
            expect(null).assertFail();
        });
    await huks.getKeyProperties(srcKeyAlias, HuksOptions)
        .then(async (data) => {
            logger.log(`test getKeyProperties data ${JSON.stringify(data)}`);
            expect(data.properties != null).assertTrue();
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error("test getKeyProperties err: " + JSON.stringify(err));
            expect(null).assertFail();
        });
    await huksCallback.getKeyProperties(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log("test getKeyProperties data: " + JSON.stringify(data));
            expect(data.errorCode == 0).assertTrue();
        })
        .catch((err) => {
            logger.error("test getKeyProperties err: " + JSON.stringify(err));
            expect(null).assertFail();
        });
    await huks.isKeyExist(srcKeyAlias, emptyOptions)
        .then(async (data) => {
            logger.log("test isKeyExist data: " + JSON.stringify(data));
            expect(data == true).assertTrue();
        })
        .catch((err) => {
            logger.error("test isKeyExist err: " + JSON.stringify(err));
            expect(null).assertFail();
        });
    await huksCallback.isKeyExist(srcKeyAlias, emptyOptions)
        .then((data) => {
            logger.log("test isKeyExist data: " + JSON.stringify(data));
            expect(data == true).assertTrue();
        })
        .catch((err) => {
            logger.error("test isKeyExist err: " + JSON.stringify(err));
            expect(null).assertFail();
        });
    HuksOptions.properties.splice(1, 1);
}

async function publicHmacInitFunc(srcKeyAlias, HuksOptions, expectValue) {
    await huks.init(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test init data ${JSON.stringify(data)}`);
            if (expectValue == 0) {
                handle = data.handle;
            }
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error(`test init err: " + ${JSON.stringify(err)}`);
            expect(null).assertFail();
        });
}

async function publicHmacUpdateFunc(HuksOptions, expectValue) {
    let dateSize = 64 * 1024;
    let huksOptionsInData = HuksOptions.inData;
    let inDataArray = stringToArray(HuksOptions.inData);
    if (inDataArray.length < dateSize) {
        HuksOptions.inData = new Uint8Array(inDataArray);
        await update(HuksOptions, expectValue);
    } else {
        let count = Math.floor(inDataArray.length / dateSize);
        let remainder = inDataArray.length % dateSize;
        for (let i = 0; i < count; i++) {
            HuksOptions.inData = new Uint8Array(
                stringToArray(huksOptionsInData).slice(dateSize * i, dateSize * (i + 1))
            );
            await update(HuksOptions, expectValue);
        }
        if (remainder !== 0) {
            HuksOptions.inData = new Uint8Array(
                stringToArray(huksOptionsInData).slice(
                    dateSize * count,
                    inDataArray.length
                )
            );
            await update(HuksOptions, expectValue);
        }
    }
    HuksOptions.inData = huksOptionsInData;
}

async function publicHmacFinish(HuksOptions, thirdInterfaceName, expectValue) {
    if (thirdInterfaceName == "finish") {
        HuksOptions.inData = new Uint8Array(stringToArray("0"));
        await huks
            .finish(handle, HuksOptions)
            .then((data) => {
                logger.log(`test finish data ${JSON.stringify(data)}`);
                expect(data.errorCode).assertEqual(expectValue);
            })
            .catch((err) => {
                logger.error("test finish err information: " + err);
                expect(null).assertFail();
            });
    } else if (thirdInterfaceName == "abort") {
        await huks
            .abort(handle, HuksOptions)
            .then((data) => {
                logger.log(`test abort data ${JSON.stringify(data)}`);
                expect(data.errorCode).assertEqual(expectValue);
            })
            .catch((err) => {
                logger.error("test abort err information: " + err);
                expect(null).assertFail();
            });
    }
}

async function publicHmacDelete(srcKeyAlias, HuksOptions, expectValue) {
    HuksOptions.properties.splice(1, 0, HuksHmac.HuksKeySIZE);
    await huks
        .deleteKey(srcKeyAlias, HuksOptions)
        .then((data) => {
            logger.log(`test deleteKey data ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error("test deleteKey err information: " + JSON.stringify(err));
            expect(null).assertFail();
        });
}

async function publicHmacFunc(srcKeyAlias, HuksOptions, thirdInterfaceName) {
    await publicHmacGenFunc(srcKeyAlias, HuksOptions);
    await publicHmacInitFunc(srcKeyAlias, HuksOptions, 0);
    await publicHmacUpdateFunc(HuksOptions, 0);
    await publicHmacFinish(HuksOptions, thirdInterfaceName, 0);
    await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
}

async function update(HuksOptions, expectValue) {
    await huks
        .update(handle, HuksOptions)
        .then(async (data) => {
            logger.log(`test update data ${JSON.stringify(data)}`);
            expect(data.errorCode).assertEqual(expectValue);
        })
        .catch((err) => {
            logger.error("test update err information: " + err);
            expect(null).assertFail();
        });
}

export default function SecurityHuksHmacPromiseJsunit() {
    describe("SecurityHuksHmacPromiseJsunit", function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        beforeEach(function () {
            handle = 0;
            HuksOptions = {
                properties: new Array(HuksHmac.HuksKeyAlg, HuksHmac.HuksKeyPurpose, HuksHmac.HuksTagDigestSHA256),
                inData: srcData63Kb,
            };
            resetOptions();
        });
        /**
         * @tc.name   Security_HUKS_Hmac_API8_101
         * @tc.number Security_HUKS_Hmac_API8_101
         * @tc.desc   Security_HUKS_Hmac_API8_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = "testHmacDigestSHA256KeyAlias101";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSHA256
                ),
                inData: srcData63Kb,
            };
            await publicHmacFunc(srcKeyAlias, HuksOptions, "finish");
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_102
         * @tc.number Security_HUKS_Hmac_API8_102
         * @tc.desc   Security_HUKS_Hmac_API8_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = "testHmacDigestSHA256KeyAlias102";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSHA256
                ),
                inData: srcData63Kb,
            };
            await publicHmacFunc(srcKeyAlias, HuksOptions, "abort");
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_103
         * @tc.number Security_HUKS_Hmac_API8_103
         * @tc.desc   Security_HUKS_Hmac_API8_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = "testHmacDigestSHA256KeyAlias103";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSHA256
                ),
                inData: srcData65Kb,
            };
            await publicHmacFunc(srcKeyAlias, HuksOptions, "finish");
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_104
         * @tc.number Security_HUKS_Hmac_API8_104
         * @tc.desc   Security_HUKS_Hmac_API8_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = "testHmacDigestSHA256KeyAlias104";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSHA256
                ),
                inData: srcData65Kb,
            };
            await publicHmacFunc(srcKeyAlias, HuksOptions, "abort");
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_SM3_101
         * @tc.number Security_HUKS_Hmac_API8_SM3_101
         * @tc.desc   Security_HUKS_Hmac_API8_SM3_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SM3_101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSM3KeyAlias001";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSM3
                ),
                inData: srcData63Kb,
            };
            await publicHmacFunc(srcKeyAlias, HuksOptions, "finish");
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_SM3_102
         * @tc.number Security_HUKS_Hmac_API8_SM3_102
         * @tc.desc   Security_HUKS_Hmac_API8_SM3_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SM3_102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSM3KeyAlias002";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSM3
                ),
                inData: srcData63Kb,
            };
            await publicHmacFunc(srcKeyAlias, HuksOptions, "abort");
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_SM3_103
         * @tc.number Security_HUKS_Hmac_API8_SM3_103
         * @tc.desc   Security_HUKS_Hmac_API8_SM3_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SM3_103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSM3KeyAlias003";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSM3
                ),
                inData: srcData65Kb,
            };
            await publicHmacFunc(srcKeyAlias, HuksOptions, "finish");
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_SM3_104
         * @tc.number Security_HUKS_Hmac_API8_SM3_104
         * @tc.desc   Security_HUKS_Hmac_API8_SM3_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("Security_HUKS_Hmac_API8_SM3_104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = "testHmacDigestSM3KeyAlias004";
            let HuksOptions = {
                properties: new Array(
                    HuksHmac.HuksKeyAlg,
                    HuksHmac.HuksKeyPurpose,
                    HuksHmac.HuksTagDigestSM3
                ),
                inData: srcData65Kb,
            };
            await publicHmacFunc(srcKeyAlias, HuksOptions, "abort");
            done();
        });


        /**
         * @tc.name   SUB_Security_HUKS_HMAC_API8_SM3_0100
         * @tc.number SUB_Security_HUKS_HMAC_API8_SM3_0100
         * @tc.desc   SUB_Security_HUKS_HMAC_API8_SM3_0100
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_Security_HUKS_HMAC_API8_SM3_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'SUB_Security_HUKS_HMAC_API8_SM3_0100';
            let HuksOptions = {
                properties: new Array(
                    {
                        tag: huks.HuksTag.HUKS_TAG_ALGORITHM,
                        value: huks.HuksKeyAlg.HUKS_ALG_HMAC
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_PURPOSE,
                        value: huks.HuksKeyPurpose.HUKS_KEY_PURPOSE_MAC
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_KEY_SIZE,
                        value: huks.HuksKeySize.HUKS_RSA_KEY_SIZE_512 - 1
                    },
                    {
                        tag: huks.HuksTag.HUKS_TAG_DIGEST,
                        value: huks.HuksKeyDigest.HUKS_DIGEST_SM3
                    },
                )
            }
            try {
                await huks.generateKeyItem(srcKeyAlias, HuksOptions);
                expect(null).assertFail();
                logger.error(srcKeyAlias + `: generateKeyItem success, expect fail`);
            } catch (err) {
                logger.error(srcKeyAlias + `: catch error ${JSON.stringify(err)}`);
                expect(err.code).assertEqual(huks.HuksExceptionErrCode.HUKS_ERR_CODE_ILLEGAL_ARGUMENT);
            }
            logger.log(srcKeyAlias + `: success.`);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1012
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1012
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1012
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1012';
            await publicHmacInitFunc(srcKeyAlias, HuksOptions, -13);
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1013
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1013
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1013
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1014
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1014
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1014
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await publicHmacFinish(HuksOptions, 'finish', -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1015
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1015
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1015
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            await publicHmacFinish(HuksOptions, 'abort', 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1016
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1016
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1016
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1016';
            if (useSoftware) {
                await publicHmacGenFunc(srcKeyAlias, HuksOptions);
                await publicHmacInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicHmacFinish(HuksOptions, 'finish', 0);
                HuksOptions.inData = srcData63Kb;
                await publicHmacUpdateFunc(HuksOptions, -13);
                await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1017
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1017
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1017
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1017';
            if (useSoftware) {
                await publicHmacGenFunc(srcKeyAlias, HuksOptions);
                await publicHmacInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicHmacFinish(HuksOptions, 'abort', 0);
                HuksOptions.inData = srcData63Kb;
                await publicHmacUpdateFunc(HuksOptions, -13);
                await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1018
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1018
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1018
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1018';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            HuksOptions.inData = srcData63Kb;
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1019
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1019
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1019
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1019';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            HuksOptions.inData = srcData63Kb;
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1020
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1020
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1020
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1020';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            HuksOptions.inData = srcData63Kb;
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1021
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1021
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1021
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1021';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            HuksOptions.inData = srcData63Kb;
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            await publicHmacFinish(HuksOptions, 'abort', 0);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1022
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1022
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1022
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1022';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            HuksOptions.inData = srcData63Kb;
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacFinish(HuksOptions, 'abort', 0);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1023
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1023
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1023
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1023';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            HuksOptions.inData = srcData63Kb;
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacFinish(HuksOptions, 'abort', 0);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1024
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1024
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1024
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1024';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            HuksOptions.inData = srcData63Kb;
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacFinish(HuksOptions, 'abort', 0);
            await publicHmacFinish(HuksOptions, 'abort', 0);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1025
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1025
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1025
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1025';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            HuksOptions.inData = srcData63Kb;
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacFinish(HuksOptions, 'abort', 0);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1026
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1026
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1026
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1026';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1027
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1027
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1027
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1027';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            await publicHmacFinish(HuksOptions, 'abort', 0);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1028
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1028
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1028
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1028';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            HuksOptions.inData = srcData63Kb;
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1029
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1029
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1029
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1029';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            await publicHmacFinish(HuksOptions, 'abort', 0);
            HuksOptions.inData = srcData63Kb;
            await publicHmacUpdateFunc(HuksOptions, -13);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1030
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1030
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1030
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1030';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            await publicHmacFinish(HuksOptions, 'finish', -13);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1031
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1031
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1031
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1031';
            await publicHmacGenFunc(srcKeyAlias, HuksOptions);
            await publicHmacFinish(HuksOptions, 'abort', 0);
            await publicHmacFinish(HuksOptions, 'abort', 0);
            await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1032
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1032
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1032
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1032';
            if (useSoftware) {
                await publicHmacGenFunc(srcKeyAlias, HuksOptions);
                await publicHmacInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicHmacUpdateFunc(HuksOptions, 0);
                await publicHmacFinish(HuksOptions, 'finish', 0);
                HuksOptions.inData = srcData64Kb;
                await publicHmacUpdateFunc(HuksOptions, -13);
                await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1033
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1033
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1033
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1033';
            if (useSoftware) {
                await publicHmacGenFunc(srcKeyAlias, HuksOptions);
                await publicHmacInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicHmacUpdateFunc(HuksOptions, 0);
                await publicHmacFinish(HuksOptions, 'abort', 0);
                await publicHmacUpdateFunc(HuksOptions, -13);
                await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1034
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1034
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1034
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1034';
            if (useSoftware) {
                await publicHmacGenFunc(srcKeyAlias, HuksOptions);
                await publicHmacInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicHmacUpdateFunc(HuksOptions, 0);
                await publicHmacInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicHmacUpdateFunc(HuksOptions, 0);
                await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_abnormal_1035
         * @tc.number Security_HUKS_Hmac_API8_abnormal_1035
         * @tc.desc   Security_HUKS_Hmac_API8_abnormal_1035
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_abnormal_1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAlias = 'Security_HUKS_Hmac_API8_abnormal_1035';
            if (useSoftware) {
                await publicHmacGenFunc(srcKeyAlias, HuksOptions);
                await publicHmacInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicHmacDelete(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData63Kb;
                await publicHmacUpdateFunc(HuksOptions, 0);
                await publicHmacFinish(HuksOptions, 'finish', 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_DigestSHA1_101
         * @tc.number Security_HUKS_Hmac_API8_DigestSHA1_101
         * @tc.desc   Security_HUKS_Hmac_API8_DigestSHA1_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_DigestSHA1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testHmacDigestSHA1KeyAlias101';
            let first = new Array(HuksHmac.HuksTagDigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData63Kb);
            if (useSoftware) {
                await publicHmacFunc(srcKeyAlias, HuksOptions, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_DigestSHA1_102
         * @tc.number Security_HUKS_Hmac_API8_DigestSHA1_102
         * @tc.desc   Security_HUKS_Hmac_API8_DigestSHA1_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_DigestSHA1_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testHmacDigestSHA1KeyAlias102';
            let first = new Array(HuksHmac.HuksTagDigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData63Kb);
            if (useSoftware) {
                await publicHmacFunc(srcKeyAlias, HuksOptions, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_DigestSHA1_103
         * @tc.number Security_HUKS_Hmac_API8_DigestSHA1_103
         * @tc.desc   Security_HUKS_Hmac_API8_DigestSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_DigestSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testHmacDigestSHA1KeyAlias103';
            let first = new Array(HuksHmac.HuksTagDigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData65Kb);
            if (useSoftware) {
                await publicHmacFunc(srcKeyAlias, HuksOptions, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_DigestSHA1_104
         * @tc.number Security_HUKS_Hmac_API8_DigestSHA1_104
         * @tc.desc   Security_HUKS_Hmac_API8_DigestSHA1_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_DigestSHA1_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testHmacDigestSHA1KeyAlias104';
            let first = new Array(HuksHmac.HuksTagDigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData65Kb);
            if (useSoftware) {
                await publicHmacFunc(srcKeyAlias, HuksOptions, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_DigestSHA224_103
         * @tc.number Security_HUKS_Hmac_API8_DigestSHA224_103
         * @tc.desc   Security_HUKS_Hmac_API8_DigestSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_DigestSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testHmacDigestSHA224KeyAlias103';
            let first = new Array(HuksHmac.HuksTagDigestSHA224);
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData65Kb);
            if (useSoftware) {
                await publicHmacFunc(srcKeyAlias, HuksOptions, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_DigestSHA256_103
         * @tc.number Security_HUKS_Hmac_API8_DigestSHA256_103
         * @tc.desc   Security_HUKS_Hmac_API8_DigestSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_DigestSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testHmacDigestSHA256KeyAlias103';
            let first = new Array(HuksHmac.HuksTagDigestSHA256);
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData65Kb);
            await publicHmacFunc(srcKeyAlias, HuksOptions, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_DigestSHA384_103
         * @tc.number Security_HUKS_Hmac_API8_DigestSHA384_103
         * @tc.desc   Security_HUKS_Hmac_API8_DigestSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_DigestSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testHmacDigestSHA384KeyAlias103';
            let first = new Array(HuksHmac.HuksTagDigestSHA384);
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData65Kb);
            await publicHmacFunc(srcKeyAlias, HuksOptions, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Hmac_API8_DigestSHA512_103
         * @tc.number Security_HUKS_Hmac_API8_DigestSHA512_103
         * @tc.desc   Security_HUKS_Hmac_API8_DigestSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Hmac_API8_DigestSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testHmacDigestSHA512KeyAlias103';
            let first = new Array(HuksHmac.HuksTagDigestSHA512);
            let HuksOptions = makeOptions(baseHuksOptions, 2, first, srcData65Kb);
            await publicHmacFunc(srcKeyAlias, HuksOptions, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1004
         * @tc.number Security_HUKS_errorCode_API8_1004
         * @tc.desc   Security_HUKS_errorCode_API8_1004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testErrorCodeHmacAlias_01_004';
            let HuksOptions1 = {
                properties: new Array(HuksHmac.HuksKeyAlgHMAC, HuksHmac.HuksKeyPurposeHMAC, HuksHmac.HuksKeyDIGESTSHA1),
                inData: srcData63Kb,
            };
            let HuksOptions2 = {
                properties: new Array(HuksHmac.HuksKeyAlgHMAC, HuksHmac.HuksKeyPurposeHMAC, {
                    tag: HksTag.HKS_TAG_DIGEST,
                    value: 100,
                }),
                inData: srcData63Kb,
            };
            await publicHmacGenFunc(srcKeyAliasFirst, HuksOptions1);
            await publicHmacInitFunc(srcKeyAliasFirst, HuksOptions2, -3);
            await publicHmacDelete(srcKeyAliasFirst, HuksOptions1, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1010
         * @tc.number Security_HUKS_errorCode_API8_1010
         * @tc.desc   Security_HUKS_errorCode_API8_1010
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testErrorCodeHmacAlias_01_010';
            let srcKeyAliasSecond = 'security_huks_third_errorCode_Exceptions_1010';
            let HuksOptions1 = {
                properties: new Array(HuksHmac.HuksKeyAlgHMAC, HuksHmac.HuksKeyPurposeHMAC, HuksHmac.HuksKeyDIGESTSHA1),
                inData: srcData63Kb,
            };
            await publicHmacGenFunc(srcKeyAliasFirst, HuksOptions1);
            await publicHmacInitFunc(srcKeyAliasSecond, HuksOptions1, -13);
            await publicHmacDelete(srcKeyAliasFirst, HuksOptions1, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1011
         * @tc.number Security_HUKS_errorCode_API8_1011
         * @tc.desc   Security_HUKS_errorCode_API8_1011
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_011';
            let HuksOptions1 = {
                properties: new Array(HuksHmac.HuksKeyAlgHMAC, HuksHmac.HuksKeyPurposeHMAC, HuksHmac.HuksKeyDIGESTSHA1),
                inData: srcData63Kb,
            };
            let HuksOptions2 = {
                properties: new Array(HuksHmac.HuksKeyAlgHMAC, HuksHmac.HuksKeyDIGESTSHA1),
                inData: srcData63Kb,
            };
            await publicHmacGenFunc(srcKeyAliasFirst, HuksOptions1);
            await publicHmacInitFunc(srcKeyAliasFirst, HuksOptions2, -3);
            await publicHmacDelete(srcKeyAliasFirst, HuksOptions1, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1012
         * @tc.number Security_HUKS_errorCode_API8_1012
         * @tc.desc   Security_HUKS_errorCode_API8_1012
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_012';
            let HuksOptions1 = {
                properties: new Array(HuksHmac.HuksKeyAlgHMAC, HuksHmac.HuksKeyPurposeHMAC, HuksHmac.HuksKeyDIGESTSHA1),
                inData: srcData63Kb,
            };
            let HuksOptions2 = {
                properties: new Array(HuksHmac.HuksKeyAlgHMAC, HuksHmac.HuksKeyPurposeHMAC),
                inData: srcData63Kb,
            };
            await publicHmacGenFunc(srcKeyAliasFirst, HuksOptions1);
            await publicHmacInitFunc(srcKeyAliasFirst, HuksOptions2, -3);
            await publicHmacDelete(srcKeyAliasFirst, HuksOptions1, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1013
         * @tc.number Security_HUKS_errorCode_API8_1013
         * @tc.desc   Security_HUKS_errorCode_API8_1013
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_013';
            let HuksOptions1 = {
                properties: new Array(HuksHmac.HuksKeyAlgHMAC, HuksHmac.HuksKeyPurposeHMAC, HuksHmac.HuksKeyDIGESTSHA1),
                inData: srcData63Kb,
            };
            let HuksOptions2 = {
                properties: new Array(
                    HuksHmac.HuksKeyAlgHMAC,
                    { tag: HksTag.HKS_TAG_PURPOSE, value: 384 },
                    HuksHmac.HuksKeyDIGESTSHA1
                ),
                inData: srcData63Kb,
            };
            await publicHmacGenFunc(srcKeyAliasFirst, HuksOptions1);
            await publicHmacInitFunc(srcKeyAliasFirst, HuksOptions2, -3);
            await publicHmacDelete(srcKeyAliasFirst, HuksOptions1, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1015
         * @tc.number Security_HUKS_errorCode_API8_1015
         * @tc.desc   Security_HUKS_errorCode_API8_1015
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_015';
            let HuksOptions = {
                properties: new Array(HuksHmac.HuksKeyAlgHMAC, HuksHmac.HuksKeyPurposeHMAC, HuksHmac.HuksKeyDIGESTSHA1),
                inData: srcData63Kb,
            };
            await publicHmacGenFunc(srcKeyAliasFirst, HuksOptions);
            HuksOptions = {
                properties: new Array(HuksHmac.HuksKeyPurposeHMAC, HuksHmac.HuksKeyDIGESTSHA1),
                inData: srcData63Kb,
            };
            await publicHmacInitFunc(srcKeyAliasFirst, HuksOptions, -3);
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1029
         * @tc.number Security_HUKS_errorCode_API8_1029
         * @tc.desc   Security_HUKS_errorCode_API8_1029
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testAgreeDHKeyAlias_01_029';
            let HuksOptions1 = {
                properties: new Array(HuksHmac.HuksKeyAlgHMAC, HuksHmac.HuksKeyPurposeHMAC, HuksHmac.HuksKeyDIGESTSHA1),
                inData: srcData63Kb,
            };
            if (useSoftware) {
                await publicHmacGenFunc(srcKeyAliasFirst, HuksOptions1);
                await publicHmacInitFunc(srcKeyAliasFirst, HuksOptions1, 0);
                handle = 124830659;
                await publicHmacUpdateFunc(HuksOptions1, -13);
                await publicHmacDelete(srcKeyAliasFirst, HuksOptions1, 0);
            }
            done();
        });
    });
}
