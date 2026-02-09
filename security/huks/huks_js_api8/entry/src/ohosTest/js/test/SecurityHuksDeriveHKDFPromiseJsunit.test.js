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

import { beforeEach, describe, it, Level, Size, TestType } from '@ohos/hypium';
import Data, { GetData } from './utils/common/data';
import { HuksDeriveAES, HuksDeriveHKDF } from './utils/param/derive/publicDeriveParam';
import { makeOptions, stringToUint8Array } from './utils/param/publicFunc';
import {
    publicDeriveDeleteFunc,
    publicDeriveFinishAbortFunc,
    publicDeriveFunc,
    publicDeriveGenFunc,
    publicDeriveInitFunc,
    publicDeriveUpdateFunc
} from './utils/param/derive/publicDerivePromise';
import { HksTag, huksMaxAliasLength } from './utils/param/publicParam';

let srcData63 = Data.Data_63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData64 = Data.Data_64KB;
let srcData64Kb = stringToUint8Array(srcData64);
let HuksOptions63kb = {
    properties: new Array(
        HuksDeriveHKDF.HuksKeyAlgAES,
        HuksDeriveHKDF.HuksKeyPurposeHKDF,
        HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
        HuksDeriveHKDF.HuksKeyHKDFSize256
    ),
    inData: srcData63Kb,
};
let baseHuksOptions = {};

let HuksOptions;
let HuksOptionsFinish;

export default function SecurityHuksDeriveHKDFPromiseJsunit() {
    describe('SecurityHuksDeriveHKDFPromiseJsunit', function () {
        beforeEach(function () {
            HuksOptions = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgAES,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
                    HuksDeriveHKDF.HuksKeyHKDFSize128
                ),
                inData: srcData63Kb,
            };
            HuksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeySTORAGE,
                    HuksDeriveHKDF.HuksKeyISKEYALIAS,
                    HuksDeriveHKDF.HuksKeyALGORITHMAES,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksDeriveHKDF.HuksKeyDIGESTNONE,
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEECB
                ),
                inData: srcData63Kb,
            };
            baseHuksOptions = {
                properties: new Array(HuksDeriveHKDF.HuksKeySTORAGE, HuksDeriveHKDF.HuksKeyISKEYALIAS),
                inData: new Array(),
            };
        });
        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA256Finish63KBDeriveKeyAlias_01_101';
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeySTORAGE,
                    HuksDeriveHKDF.HuksKeyISKEYALIAS,
                    HuksDeriveHKDF.HuksKeyALGORITHMAES,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksDeriveHKDF.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliasFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_102
         * @tc.number Security_HUKS_Derive_API8_HKDF_102
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA256Abort63KBDeriveKeyAlias_01_101';
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeySTORAGE,
                    HuksDeriveHKDF.HuksKeyISKEYALIAS,
                    HuksDeriveHKDF.HuksKeyALGORITHMAES,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksDeriveHKDF.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliasFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1014
         * @tc.number Security_HUKS_Derive_API8_abnormal_1014
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1014
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1014';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveInitFunc(srcKeyAlias, HuksOptions, -13);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1015
         * @tc.number Security_HUKS_Derive_API8_abnormal_1015
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1015
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1015';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1016
         * @tc.number Security_HUKS_Derive_API8_abnormal_1016
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1016
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1016';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1017
         * @tc.number Security_HUKS_Derive_API8_abnormal_1017
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1017
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1017';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1018
         * @tc.number Security_HUKS_Derive_API8_abnormal_1018
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1018
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1018';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveInitFunc(srcKeyAlias, HuksOptions, 0);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -14);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1019
         * @tc.number Security_HUKS_Derive_API8_abnormal_1019
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1019
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1019';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveInitFunc(srcKeyAlias, HuksOptions, 0);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', -14);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1020
         * @tc.number Security_HUKS_Derive_API8_abnormal_1020
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1020
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1020';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1021
         * @tc.number Security_HUKS_Derive_API8_abnormal_1021
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1021
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1021';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1022
         * @tc.number Security_HUKS_Derive_API8_abnormal_1022
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1022
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1022';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1023
         * @tc.number Security_HUKS_Derive_API8_abnormal_1023
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1023
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1023';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1024
         * @tc.number Security_HUKS_Derive_API8_abnormal_1024
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1024
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1024';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1025
         * @tc.number Security_HUKS_Derive_API8_abnormal_1025
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1025
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1025';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1026
         * @tc.number Security_HUKS_Derive_API8_abnormal_1026
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1026
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1026';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1027
         * @tc.number Security_HUKS_Derive_API8_abnormal_1027
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1027
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1027';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1028
         * @tc.number Security_HUKS_Derive_API8_abnormal_1028
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1028
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1028';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1029
         * @tc.number Security_HUKS_Derive_API8_abnormal_1029
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1029
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1029';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1030
         * @tc.number Security_HUKS_Derive_API8_abnormal_1030
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1030
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1030';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1031
         * @tc.number Security_HUKS_Derive_API8_abnormal_1031
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1031
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1031';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1032
         * @tc.number Security_HUKS_Derive_API8_abnormal_1032
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1032
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1032';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1033
         * @tc.number Security_HUKS_Derive_API8_abnormal_1033
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1033
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1033';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1034
         * @tc.number Security_HUKS_Derive_API8_abnormal_1034
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1034
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1034';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveInitFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.inData = srcData64Kb;
            await publicDeriveUpdateFunc(HuksOptions, 0);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'finish', 0);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1035
         * @tc.number Security_HUKS_Derive_API8_abnormal_1035
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1035
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1035';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveInitFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.inData = srcData64Kb;
            await publicDeriveUpdateFunc(HuksOptions, 0);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicDeriveUpdateFunc(HuksOptions, -13);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1036
         * @tc.number Security_HUKS_Derive_API8_abnormal_1036
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1036
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1036';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveInitFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.inData = srcData64Kb;
            await publicDeriveUpdateFunc(HuksOptions, 0);
            await publicDeriveInitFunc(srcKeyAlias, HuksOptions, 0);
            await publicDeriveUpdateFunc(HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_abnormal_1037
         * @tc.number Security_HUKS_Derive_API8_abnormal_1037
         * @tc.desc   Security_HUKS_Derive_API8_abnormal_1037
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_abnormal_1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'Security_HUKS_Derive_API8_abnormal_1037';
            HuksOptionsFinish.properties.splice(6, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAlias),
            });
            await publicDeriveGenFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveInitFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgAES);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveDeleteFunc(srcKeyAlias, HuksOptions, 0);
            HuksOptions.properties.splice(0, 1, HuksDeriveHKDF.HuksKeyAlgHKDF);
            HuksOptions.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveUpdateFunc(HuksOptions, 0);
            await publicDeriveFinishAbortFunc(HuksOptionsFinish, 'Finish', 0);
            done();
        });
        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA256Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA256Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA256Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA256Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testDeriveHKDFSize128SHA256Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA256Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA256Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA256Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeMAC,
                HuksDeriveHKDF.HuksKeyDIGESTSHA1,
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA384Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA384Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA384Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA384Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA384Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA384Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA384Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA384Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeMAC,
                HuksDeriveHKDF.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA512Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA512Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA512Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA512Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA512Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA512Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA512Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA512Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeMAC,
                HuksDeriveHKDF.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA256Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA256Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA256Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA256Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA256Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA256Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA256Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA256Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeMAC,
                HuksDeriveHKDF.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA384Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA384Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA384Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA384Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA384Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA384Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA384Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA384Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeMAC,
                HuksDeriveHKDF.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA512Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA512Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA512Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA512Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA512Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA512Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA512Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA512Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeMAC,
                HuksDeriveHKDF.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA256Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA256Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA256Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA256Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA256Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA256Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA256Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA256Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeMAC,
                HuksDeriveHKDF.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA384Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA384Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA384Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA384Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA384Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA384Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA384Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA384Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeMAC,
                HuksDeriveHKDF.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA512Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA512Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA512Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA512Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA512Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA512Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDeriveHKDF.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA512Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMAES,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA512Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                HuksDeriveHKDF.HuksKeySIZE256,
                HuksDeriveHKDF.HuksKeyPurposeMAC,
                HuksDeriveHKDF.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDeriveHKDF.HuksKeyPADDINGNONE,
                HuksDeriveHKDF.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize256);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_errorCode_API8_1003
         * @tc.number Security_HUKS_errorCode_API8_1003
         * @tc.desc   Security_HUKS_errorCode_API8_1003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_errorCode_API8_1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = GetData(huksMaxAliasLength + 1);
            let HuksOptions1 = {
                properties: new Array(
                    HuksDeriveAES.HuksKeyAlgAES,
                    HuksDeriveAES.HuksKeyPurposeHKDF,
                    HuksDeriveAES.HuksTagHKDFDigestSHA256,
                    HuksDeriveAES.HuksKeyHKDFSize128
                ),
                inData: srcData63Kb,
            };
            await publicDeriveGenFunc(srcKeyAliasFirst, HuksOptions1, -3);
            HuksOptions1.properties.splice(0, 1, HuksDeriveAES.HuksKeyAlgHKDF);
            HuksOptions1.properties.splice(3, 1, HuksDeriveAES.HuksKeyDERIVEKEYSIZE);
            await publicDeriveInitFunc(srcKeyAliasFirst, HuksOptions1, -3);
            done();
        });
    });
}
