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
import Data from './utils/common/data.js';
import { HuksDeriveHKDF } from './utils/param/derive/publicDeriveParam';
import { makeOptions, stringToUint8Array } from './utils/param/publicFunc';
import { publicDeriveFunc } from './utils/param/derive/publicDeriveCallback';
import { HksTag } from './utils/param/publicParam';

let srcData63 = Data.Data_63KB;
let srcData63Kb = stringToUint8Array(srcData63);
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

export default function SecurityHuksDeriveHKDFCallbackJsunit() {
    describe('SecurityHuksDeriveHKDFCallbackJsunit', function () {
        beforeEach(function () {
            HuksOptions63kb = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyAlgAES,
                    HuksDeriveHKDF.HuksKeyPurposeHKDF,
                    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
                    HuksDeriveHKDF.HuksKeyHKDFSize128
                ),
                inData: srcData63Kb,
            };
            baseHuksOptions = {
                properties: new Array(HuksDeriveHKDF.HuksKeySTORAGE, HuksDeriveHKDF.HuksKeyISKEYALIAS),
                inData: new Array(),
            };
        });
        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA256Finish63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_002
         * @tc.number Security_HUKS_Derive_API8_HKDF_002
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA256Abort63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA256Abort63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA256Abort63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA256Abort63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA256Abort63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            let srcKeyAliasFirst = 'testDeriveHKDFSize128SHA256Abort63KBDeriveKeyAlias_01_001';
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
                }
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA256Finish63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA256Finish63KBDeriveKeyAlias_01_001';
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
                }
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA384Abort63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA384Abort63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA384Abort63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA384Abort63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA384Abort63KBDeriveKeyAlias_01_001';
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
                }
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA384Finish63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA384Finish63KBDeriveKeyAlias_01_001';
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
                }
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA512Abort63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA512Abort63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA512Abort63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA512Abort63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA512Abort63KBDeriveKeyAlias_01_001';
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
                }
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size128SHA512Finish63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize128SHA512Finish63KBDeriveKeyAlias_01_001';
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
                }
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize128);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA256Abort63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA256Abort63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA256Abort63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA256Abort63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA256Abort63KBDeriveKeyAlias_01_001';
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
                }
            );
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData63Kb);
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA256);
            HuksOptions63kb.properties.splice(3, 1, HuksDeriveHKDF.HuksKeyHKDFSize192);
            await publicDeriveFunc(srcKeyAliasFirst, HuksOptions63kb, HuksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA256Finish63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA256Finish63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA384Finish63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA384Finish63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA384Abort63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA384Abort63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA384Abort63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA384Abort63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA384Abort63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA512Abort63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA512Abort63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA512Abort63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA512Abort63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA512Abort63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size192SHA512Finish63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize192SHA512Finish63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA256Abort63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA256Abort63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA256Abort63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA256Abort63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA256Abort63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA256Finish63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA256Finish63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA384Abort63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA384Abort63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA384Abort63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA384Abort63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA384Abort63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA384Finish63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA384Finish63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA512Abort63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA512Abort63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA512Abort63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA512Abort63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA512Abort63KBDeriveKeyAlias_01_001';
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
         * @tc.name   Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_001
         * @tc.number Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_001
         * @tc.desc   Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API8_HKDF_Size256SHA512Finish63KB_001', TestType.FUNCTION| Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testDeriveHKDFSize256SHA512Finish63KBDeriveKeyAlias_01_001';
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
    });
}
