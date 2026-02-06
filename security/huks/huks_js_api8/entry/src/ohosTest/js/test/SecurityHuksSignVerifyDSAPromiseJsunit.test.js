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
import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '@ohos/hypium';
import Data from './utils/common/data';
import { HuksSignVerifyDSA } from './utils/param/signVerify/publicSignVerifyParam';
import { checkSoftware, makeOptions, stringToUint8Array } from './utils/param/publicFunc.js';
import {
    publicAbortFunc,
    publicDeleteKeyFunc,
    publicFinishFunc,
    publicGenerateKeyFunc,
    publicImportKey,
    publicInitFunc,
    publicSignVerify,
    publicSignVerifyFunc,
    publicUpdateFunc
} from './utils/param/signVerify/publicSignVerifyPromise';

let srcData63 = Data.data63B;
let srcData63b = stringToUint8Array(srcData63);
let srcData65 = Data.data65B;
let srcData65b = stringToUint8Array(srcData65);

let srcData63KB = Data.Data_63KB;
let srcData63Kb = stringToUint8Array(srcData63KB);
let srcData64KB = Data.Data_64KB;
let srcData64Kb = stringToUint8Array(srcData64KB);

let finishOutData;
let useSoftware = true
let HuksOptions;

let srcData63B = Data.data63B;
let srcData63Byte = stringToUint8Array(srcData63B);
let srcData65Kb = stringToUint8Array(srcData65);
let srcData65B = Data.data65B;
let srcData65Byte = stringToUint8Array(srcData65B);
let baseHuksOptions = {};
let baseHuksOptions1 = {};
let baseHuksOptions2 = {};

async function resetOptions() {
    baseHuksOptions = {
        properties: new Array(HuksSignVerifyDSA.HuksKeyAlgDSA, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN),
    };
    baseHuksOptions1 = {
        properties: new Array(HuksSignVerifyDSA.HuksKeyAlgDSA, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN),
    };
    baseHuksOptions2 = {
        properties: new Array(HuksSignVerifyDSA.HuksKeyAlgDSA, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY),
    };
}

export default function SecurityHuksSignVerifyDSAPromiseJsunit() {
    describe('SecurityHuksSignVerifyDSAPromiseJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        })
        beforeEach(function () {
            resetOptions();
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData63b,
            };
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_101
         * @tc.number Security_HUKS_SignVerify_API8_DSA_101
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias101';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData63b,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63b);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyDSA.HuksKeyAlgDSA,
                        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
                        HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                        HuksSignVerifyDSA.HuksTagDSACOMMONSIZE
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63b);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_102
         * @tc.number Security_HUKS_SignVerify_API8_DSA_102
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias102';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData63b,
            };
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63b);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_103
         * @tc.number Security_HUKS_SignVerify_API8_DSA_103
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias103';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData65b,
            };
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData65b);
                HuksOptions = {
                    properties: new Array(
                        HuksSignVerifyDSA.HuksKeyAlgDSA,
                        HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY,
                        HuksSignVerifyDSA.HuksTagDSADigestSHA1,
                        HuksSignVerifyDSA.HuksKeySIZE1024
                    ),
                    inData: finishOutData,
                };
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData65b);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_104
         * @tc.number Security_HUKS_SignVerify_API8_DSA_104
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias104';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyDSA.HuksKeyAlgDSA,
                    HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN,
                    HuksSignVerifyDSA.HuksTagDSADigestSHA1
                ),
                inData: srcData65b,
            };
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData65b);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1013
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1013
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1013
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1013';
            HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
            await publicInitFunc(srcKeyAlias, HuksOptions, -13);
            await publicUpdateFunc(HuksOptions, true, -13);
            HuksOptions.inData = new Uint8Array(new Array());
            await publicFinishFunc(HuksOptions, -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1014
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1014
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1014
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
            await publicUpdateFunc(HuksOptions, true, -13);
            HuksOptions.inData = new Uint8Array(new Array());
            await publicFinishFunc(HuksOptions, -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1015
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1015
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1015
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
            HuksOptions.inData = new Uint8Array(new Array());
            await publicFinishFunc(HuksOptions, -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1016
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1016
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1016
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
            HuksOptions.inData = new Uint8Array(new Array());
            await publicAbortFunc(HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1017
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1017
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1017
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1017';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1018
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1018
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1018
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1018';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicAbortFunc(HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1019
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1019
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1019
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1019';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1020
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1020
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1020
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1020';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicUpdateFunc(HuksOptions, true, -13);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1021
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1021
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1021
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1021';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, -13);
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1022
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1022
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1022
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1022';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, -13);
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1023
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1023
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1023
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1023';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1024
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1024
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1024
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1024';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicUpdateFunc(HuksOptions, true, -13);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1025
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1025
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1025
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1025';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicAbortFunc(HuksOptions, 0);
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1026
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1026
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1026
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1026';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicAbortFunc(HuksOptions, 0);
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1027
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1027
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1027
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1027';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1028
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1028
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1028
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1028';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1029
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1029
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1029
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1029';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, -13);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1030
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1030
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1030
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1030';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicAbortFunc(HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1031
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1031
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1031
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1031';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, -13);
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1032
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1032
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1032
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1032';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicAbortFunc(HuksOptions, 0);
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1033
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1033
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1033
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1033';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicUpdateFunc(HuksOptions, true, 0);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1034
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1034
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1034
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1034';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicUpdateFunc(HuksOptions, true, 0);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicAbortFunc(HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1035
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1035
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1035
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1035';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicUpdateFunc(HuksOptions, true, 0);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1036
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1036
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1036
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1036';
            if (useSoftware) {
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                HuksOptions.properties.splice(2, 0, HuksSignVerifyDSA.HuksKeySIZE1024);
                await publicGenerateKeyFunc(srcKeyAlias, HuksOptions);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeSIGN);
                HuksOptions.properties.splice(2, 1);
                await publicInitFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicUpdateFunc(HuksOptions, true, 0);
                HuksOptions.inData = new Uint8Array(new Array());
                await publicFinishFunc(HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1038
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1038
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1038
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1038';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                HuksOptions.inData = srcData63Kb;
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1039
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1039
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1039
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1039';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1040
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1040
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1040
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1040';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1041
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1041
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1041
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1041';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1041';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);

                let updateOutData = HuksOptions.inData;
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -31);
                HuksOptions.inData = updateOutData;
                await publicUpdateFunc(HuksOptions, true, -13);

                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1042
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1042
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1042
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1042';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1042';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                let updateOutData = HuksOptions.inData;
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.inData = updateOutData;
                await publicUpdateFunc(HuksOptions, true, -13);

                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1043
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1043
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1043
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1043';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1043';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1044
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1044
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1044
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1044';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1044';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1045
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1045
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1045
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1045';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1045';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1046
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1046
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1046
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1046';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1046';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1047
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1047
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1047
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1047';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1047';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1048
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1048
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1048
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1048';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1048';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1049
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1049
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1049
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1049';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1049';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1050
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1050
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1050
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1050';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1050';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1051
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1051
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1051
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1051';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1051';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1052
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1052
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1052
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1052';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1052';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1053
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1053
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1053
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1053';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1053';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1054
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1054
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1054
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1054';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1054';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1055
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1055
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1055
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1055';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1055';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1056
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1056
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1056
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1056';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1056';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1057
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1057
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1057
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1057';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1057';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicUpdateFunc(HuksOptions, true, 0);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -31);
                HuksOptions.inData = srcData63Kb;
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1058
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1058
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1058
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1058';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1058';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicUpdateFunc(HuksOptions, true, 0);
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.inData = srcData63Kb;
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1059
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1059
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1059
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1059';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1059';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.inData = srcData64Kb;
                await publicUpdateFunc(HuksOptions, true, 0);
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                await publicUpdateFunc(HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1060
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1060
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1060
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1060';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1060';
            if (useSoftware) {
                HuksOptions.inData = srcData63Kb;
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicImportKey(newSrcKeyAlias, HuksOptions, 0);
                await publicInitFunc(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                await publicDeleteKeyFunc(newSrcKeyAlias, HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.inData = srcData63Kb;
                await publicUpdateFunc(HuksOptions, true, 0);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1061
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1061
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1061
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1061';
            const newSrcKeyAlias = 'security_huks_third_abnormal_signVerify_new_1061';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicInitFunc(newSrcKeyAlias, HuksOptions, -13);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1062
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1062
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1062
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1062';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                await publicUpdateFunc(HuksOptions, true, -13);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1063
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1063
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1063
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1063';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                HuksOptions.inData = finishOutData;
                await publicFinishFunc(HuksOptions, -13);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_abnormal_1064
         * @tc.number Security_HUKS_SignVerify_API8_abnormal_1064
         * @tc.desc   Security_HUKS_SignVerify_API8_abnormal_1064
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_abnormal_1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_SignVerify_API8_abnormal_1064';
            if (useSoftware) {
                finishOutData = await publicSignVerify(srcKeyAlias, HuksOptions, true, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyDSAPurposeVERIFY);
                HuksOptions.properties.splice(-1, 0, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                HuksOptions.inData = finishOutData;
                await publicAbortFunc(HuksOptions, 0);
                HuksOptions.properties.splice(1, 1, HuksSignVerifyDSA.HuksKeyRSAPurposeSINGVERIFY);
                await publicDeleteKeyFunc(srcKeyAlias, HuksOptions, 0);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_102
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_102
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias102';
            let params = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_102
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_102
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA224KeyAlias102';
            let params = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA224);
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData63Byte);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, false, srcData63Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1__104
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA1__104
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1__104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA1__104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias104';
            let params = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_104
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_104
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA224KeyAlias104';
            let params = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA224);
            let HuksOptions = makeOptions(baseHuksOptions, 2, params, srcData65Byte);
            if (useSoftware) {
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_101
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_101
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias101';
            let params1 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData63Kb);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63Kb);
                let params2 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA1, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_101
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_101
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA224KeyAlias101';
            let params1 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA224);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData63Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData63Byte);
                let params2 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA224, HuksSignVerifyDSA.HuksTagDSACOMMONSIZE);
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData63Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_103
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_103
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA1_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA1KeyAlias103';
            let params1 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA1);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Kb);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData65Kb);
                let params2 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA1, HuksSignVerifyDSA.HuksKeySIZE1024);
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData65Kb);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_103
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_103
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA224_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA224KeyAlias103';
            let params1 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA224);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA224, HuksSignVerifyDSA.HuksKeySIZE1024);
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA256_103
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA256_103
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA256_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA256_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA256KeyAlias103';
            let params1 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA256);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA256, HuksSignVerifyDSA.HuksKeySIZE1024);
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA384_103
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA384_103
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA384_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA384_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA384KeyAlias103';
            let params1 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA384);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA384, HuksSignVerifyDSA.HuksKeySIZE1024);
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_DSA_SIGNSHA512_103
         * @tc.number Security_HUKS_SignVerify_API8_DSA_SIGNSHA512_103
         * @tc.desc   Security_HUKS_SignVerify_API8_DSA_SIGNSHA512_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_DSA_SIGNSHA512_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyDSASIGNSHA512KeyAlias103';
            let params1 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA512);
            let HuksOptions = makeOptions(baseHuksOptions1, 2, params1, srcData65Byte);
            if (useSoftware) {
                finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
                let params2 = new Array(HuksSignVerifyDSA.HuksTagDSADigestSHA512, HuksSignVerifyDSA.HuksKeySIZE1024);
                HuksOptions = makeOptions(baseHuksOptions2, 2, params2, finishOutData);
                await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            }
            done();
        });
    });
}
