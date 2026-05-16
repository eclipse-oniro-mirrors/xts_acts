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
import Data from './utils/common/data.js';
import { HuksDerivePBKDF2 } from './utils/param/derive/publicDeriveParam';
import { checkSoftware, makeOptions, stringToUint8Array } from './utils/param/publicFunc';
import { publicDeriveFunc } from './utils/param/derive/publicDerivePromise';
import { HksTag } from './utils/param/publicParam';

let srcData63 = Data.Data_63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let HuksOptions63kb = {
    properties: new Array(
        HuksDerivePBKDF2.HuksKeyAlgAES,
        HuksDerivePBKDF2.HuksKeyPurposePBKDF2,
        HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256,
        HuksDerivePBKDF2.HuksKeyPBKDF2Size256,
        HuksDerivePBKDF2.HuksKeyPBKDF2Iteration,
        HuksDerivePBKDF2.HuksKeyPBKDF2Salt
    ),
    inData: srcData63Kb,
};
let baseHuksOptions = {};
let useSoftware = true

export default function SecurityHuksDerivePBKDF2PromiseJsunit() {
    describe('SecurityHuksDerivePBKDF2PromiseJsunit', function () {
        beforeAll(async function (done) {
            useSoftware = await checkSoftware();
            done();
        });
        beforeEach(function () {
            HuksOptions63kb = {
                properties: new Array(
                    HuksDerivePBKDF2.HuksKeyAlgAES,
                    HuksDerivePBKDF2.HuksKeyPurposePBKDF2,
                    HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256,
                    HuksDerivePBKDF2.HuksKeyPBKDF2Size128,
                    HuksDerivePBKDF2.HuksKeyPBKDF2Iteration,
                    HuksDerivePBKDF2.HuksKeyPBKDF2Salt
                ),
                inData: srcData63Kb,
            };
            baseHuksOptions = {
                properties: new Array(HuksDerivePBKDF2.HuksKeySTORAGE, HuksDerivePBKDF2.HuksKeyISKEYALIAS),
                inData: new Array(),
            };
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF_2101
         * @tc.number Security_HUKS_Derive_API8_PBKDF_2101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF_2101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF_2101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA256Finish63KBDeriveKeyAlias_01_101';
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDerivePBKDF2.HuksKeySTORAGE,
                    HuksDerivePBKDF2.HuksKeyISKEYALIAS,
                    HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                    HuksDerivePBKDF2.HuksKeySIZE256,
                    HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliasFirst),
                    },
                    HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                    HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });
        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF_2102
         * @tc.number Security_HUKS_Derive_API8_PBKDF_2102
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF_2102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF_2102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA256Abort63KBDeriveKeyAlias_01_101';
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDerivePBKDF2.HuksKeySTORAGE,
                    HuksDerivePBKDF2.HuksKeyISKEYALIAS,
                    HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                    HuksDerivePBKDF2.HuksKeySIZE256,
                    HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliasFirst),
                    },
                    HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                    HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA256Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA256Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA256Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA256Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA256Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeMAC,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA384Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size128);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA384Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size128);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA384Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size128);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA384Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA384Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeMAC,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size128);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA512Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size128);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA512Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size128);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA512Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size128);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size128SHA512Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size128SHA512Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeMAC,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size128);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA256Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA256Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA256Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA256Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA256Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeMAC,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA384Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA384Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA384Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA384Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA384Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeMAC,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA512Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA512Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA512Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size192SHA512Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size192SHA512Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeMAC,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size192);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA256Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA256Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA256Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA256Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA256Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeMAC,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA384Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA384Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA384Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA384Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA384Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeMAC,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Abort63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Abort63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Abort63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Abort63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA512Abort63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_101
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_101
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA512Finish63KBDeriveKeyAlias_01_101';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
                HuksDerivePBKDF2.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_108
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_108
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA512Finish63KBDeriveKeyAlias_01_108';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMAES,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_130
         * @tc.number Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_130
         * @tc.desc   Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_PBKDF2_Size256SHA512Finish63KB_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDerivePBKDF2Size256SHA512Finish63KBDeriveKeyAlias_01_030';
            let params = new Array(
                HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
                HuksDerivePBKDF2.HuksKeySIZE256,
                HuksDerivePBKDF2.HuksKeyPurposeMAC,
                HuksDerivePBKDF2.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                HuksDerivePBKDF2.HuksKeyBLOCKMODEECB
            );
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
            if (useSoftware) {
                await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            }
            done();
        });
    });
}
