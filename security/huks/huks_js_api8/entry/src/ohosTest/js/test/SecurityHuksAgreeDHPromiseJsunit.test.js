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
import { stringToUint8Array } from './utils/param/publicFunc';
import { HuksAgreeDH } from './utils/param/agree/publicAgreeParam';
import {
    publicAgreeDeleteFunc,
    publicAgreeExportFunc,
    publicAgreeFinishAbortFunc,
    publicAgreeFunc,
    publicAgreeGenFunc,
    publicAgreeInitFunc,
    publicAgreeUpdateFunc,
    resetHandle
} from './utils/param/agree/publicAgreePromise';
import { HksTag } from './utils/param/publicParam';
import { checkAESCipher } from './utils/param/checkAES';
import Data from './utils/common/data';

let srcData63 = Data.Data_63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData64 = Data.Data_64KB;
let srcData64Kb = stringToUint8Array(srcData64);

let HuksOptions;
let HuksOptionsFinish;
let HuksOptions63kb = {
    properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH, HuksAgreeDH.HuksKeyDHSize2048),
};

export default function SecurityHuksAgreeDHPromiseJsunit() {
    describe('SecurityHuksAgreeDHPromiseJsunit', function () {
        beforeAll(async function (done) {
            done();
        })
        beforeEach(function () {
            resetHandle();
            HuksOptions = {
                properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH, HuksAgreeDH.HuksKeyDHSize2048),
                inData: srcData63Kb,
            };
            HuksOptionsFinish = {
                properties: new Array(
                    HuksAgreeDH.HuksKeySTORAGE,
                    HuksAgreeDH.HuksKeyISKEYALIAS,
                    HuksAgreeDH.HuksKeyALGORITHMAES,
                    HuksAgreeDH.HuksKeySIZE256,
                    HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeDH.HuksKeyDIGESTNONE,
                    HuksAgreeDH.HuksKeyPADDINGNONE,
                    HuksAgreeDH.HuksKeyBLOCKMODEECB
                ),
                inData: srcData63Kb,
            };
        });
        /**
         * @tc.name   Security_HUKS_Agree_API8_DH_101
         * @tc.number Security_HUKS_Agree_API8_DH_101
         * @tc.desc   Security_HUKS_Agree_API8_DH_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_DH_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeDHSize2048Finish63KBAgreeKeyAlias_01_101';
            const srcKeyAliasSecond = 'testAgreeDHSize2048Finish63KBAgreeKeyAlias_02_101';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeDH.HuksKeySTORAGE,
                    HuksAgreeDH.HuksKeyISKEYALIAS,
                    HuksAgreeDH.HuksKeyALGORITHMAES,
                    HuksAgreeDH.HuksKeySIZE256,
                    HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeDH.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliasFirst),
                    },
                    HuksAgreeDH.HuksKeyPADDINGNONE,
                    HuksAgreeDH.HuksKeyBLOCKMODECBC
                ),

            };
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions63kb, huksOptionsFinish, 'finish', false);

            // AES Check
            let IV = '0000000000000000';
            let huksOptionsCipher = {
                properties: new Array(
                    HuksAgreeDH.HuksKeyALGORITHMAES,
                    HuksAgreeDH.HuksKeySIZE256,
                    HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeDH.HuksKeyDIGESTNONE,
                    HuksAgreeDH.HuksKeyPADDINGNONE,
                    HuksAgreeDH.HuksKeyBLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) },
                ),
            };
            let res = await checkAESCipher(srcKeyAliasFirst + 'final', srcKeyAliasSecond + 'final', huksOptionsCipher);
            expect(res).assertTrue();
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_DH_102
         * @tc.number Security_HUKS_Agree_API8_DH_102
         * @tc.desc   Security_HUKS_Agree_API8_DH_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_DH_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_01_101';
            const srcKeyAliasSecond = 'testAgreeDHSize2048Abort63KBAgreeKeyAlias_02_101';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeDH.HuksKeySTORAGE,
                    HuksAgreeDH.HuksKeyISKEYALIAS,
                    HuksAgreeDH.HuksKeyALGORITHMAES,
                    HuksAgreeDH.HuksKeySIZE256,
                    HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeDH.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliasFirst),
                    },
                    HuksAgreeDH.HuksKeyPADDINGNONE,
                    HuksAgreeDH.HuksKeyBLOCKMODEECB
                ),
            };
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions63kb, huksOptionsFinish, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1016
         * @tc.number Security_HUKS_Agree_API8_abnormal_1016
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1016
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1016_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1016_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1017
         * @tc.number Security_HUKS_Agree_API8_abnormal_1017
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1017
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1017_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1017_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1018
         * @tc.number Security_HUKS_Agree_API8_abnormal_1018
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1018
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1018_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1018_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1020
         * @tc.number Security_HUKS_Agree_API8_abnormal_1020
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1020
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1020_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1020_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeUpdateFunc(HuksOptions, 2, 0);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1022
         * @tc.number Security_HUKS_Agree_API8_abnormal_1022
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1022
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1022_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1022_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeUpdateFunc(HuksOptions, 1, 0);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeInitFunc(srcKeyAliasSecond, HuksOptions, 0);
            await publicAgreeUpdateFunc(HuksOptions, 1, 0);
            HuksOptionsFinish.properties.splice(7, 1, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasSecond + 'final'),
            });
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            let srcKeyAliasThird = srcKeyAliasSecond + 'final';
            await publicAgreeDeleteFunc(srcKeyAliasThird, HuksOptions, -13);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1023
         * @tc.number Security_HUKS_Agree_API8_abnormal_1023
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1023
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1023_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1023_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1024
         * @tc.number Security_HUKS_Agree_API8_abnormal_1024
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1024
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1024_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1024_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1025
         * @tc.number Security_HUKS_Agree_API8_abnormal_1025
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1025
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1025_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1025_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1026
         * @tc.number Security_HUKS_Agree_API8_abnormal_1026
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1026
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1026_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1026_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1027
         * @tc.number Security_HUKS_Agree_API8_abnormal_1027
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1027
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1027_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1027_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1028
         * @tc.number Security_HUKS_Agree_API8_abnormal_1028
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1028
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1028_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1028_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1029
         * @tc.number Security_HUKS_Agree_API8_abnormal_1029
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1029
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1029_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1029_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1030
         * @tc.number Security_HUKS_Agree_API8_abnormal_1030
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1030
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1030_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1030_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1031
         * @tc.number Security_HUKS_Agree_API8_abnormal_1031
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1031
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1031_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1031_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1032
         * @tc.number Security_HUKS_Agree_API8_abnormal_1032
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1032
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1032_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1032_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1033
         * @tc.number Security_HUKS_Agree_API8_abnormal_1033
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1033
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1033_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1033_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1034
         * @tc.number Security_HUKS_Agree_API8_abnormal_1034
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1034
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1034_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1034_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1035
         * @tc.number Security_HUKS_Agree_API8_abnormal_1035
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1035
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1035_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1035_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'finish', -13);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1036
         * @tc.number Security_HUKS_Agree_API8_abnormal_1036
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1036
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1036_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1036_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1038
         * @tc.number Security_HUKS_Agree_API8_abnormal_1038
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1038
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1038_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1038_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
            HuksOptions.inData = srcData64Kb;
            await publicAgreeUpdateFunc(HuksOptions, 1, 0);
            await publicAgreeFinishAbortFunc(HuksOptionsFinish, 'abort', 0);
            await publicAgreeUpdateFunc(HuksOptions, 1, -13);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_abnormal_1039
         * @tc.number Security_HUKS_Agree_API8_abnormal_1039
         * @tc.desc   Security_HUKS_Agree_API8_abnormal_1039
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_abnormal_1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'Security_HUKS_Agree_API8_abnormal_1039_1';
            let srcKeyAliasSecond = 'Security_HUKS_Agree_API8_abnormal_1039_2';
            HuksOptionsFinish.properties.splice(7, 0, {
                tag: HksTag.HKS_TAG_KEY_ALIAS,
                value: stringToUint8Array(srcKeyAliasFirst),
            });
            await publicAgreeGenFunc(srcKeyAliasFirst, HuksOptions);
            await publicAgreeGenFunc(srcKeyAliasSecond, HuksOptions);
            await publicAgreeExportFunc(srcKeyAliasFirst, HuksOptions, 1);
            await publicAgreeExportFunc(srcKeyAliasSecond, HuksOptions, 2);
            await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
            HuksOptions.inData = srcData64Kb;
            await publicAgreeUpdateFunc(HuksOptions, 1, 0);
            await publicAgreeInitFunc(srcKeyAliasFirst, HuksOptions, 0);
            HuksOptions.inData = srcData63Kb;
            await publicAgreeUpdateFunc(HuksOptions, 1, 0);
            await publicAgreeDeleteFunc(srcKeyAliasFirst, HuksOptions, 0);
            await publicAgreeDeleteFunc(srcKeyAliasSecond, HuksOptions, 0);
            done();
        });
    });
}
