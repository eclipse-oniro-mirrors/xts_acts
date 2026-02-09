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

import { describe, it, TestType, Size, Level } from '@ohos/hypium';
import Data from './utils/data.json';
import { HuksDeriveHKDF } from './utils/param/derive/publicDeriveParam';
import { stringToUint8Array } from './utils/param/publicFunc';
import { publicDeriveFunc } from './utils/param/derive/publicDerivePromise';
import { HksTag } from './utils/param/publicParam';

let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let HuksOptions63kb = {
    properties: new Array(
        HuksDeriveHKDF.HuksKeyAlgAES,
        HuksDeriveHKDF.HuksKeyPurposeHKDF,
        HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
        HuksDeriveHKDF.HuksKeyHKDFSize192
    ),
    inData: srcData63Kb,
};

export default function SecurityHuksDeriveHKDFPromiseJsunit() {
    describe('SecurityHuksDeriveHKDFPromiseJsunit', function () {
        /**
         * @tc.name   Security_HUKS_Derive_API9_HKDF_101
         * @tc.number Security_HUKS_Derive_API9_HKDF_101
         * @tc.desc   Security_HUKS_Derive_API9_HKDF_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API9_HKDF_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize192SHA256Finish63KBDeriveKeyAlias_01_101';
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
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Derive_API9_HKDF_102
         * @tc.number Security_HUKS_Derive_API9_HKDF_102
         * @tc.desc   Security_HUKS_Derive_API9_HKDF_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Derive_API9_HKDF_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize192SHA256Abort63KBDeriveKeyAlias_01_101';
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
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'abort');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize192SHA256Finish63KBDerive108
         * @tc.number testDeriveHKDFSize192SHA256Finish63KBDerive108
         * @tc.desc   testDeriveHKDFSize192SHA256Finish63KBDerive108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize192SHA256Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize192SHA256Finish63KBDeriveKeyAlias_01_108';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyALGORITHMAES,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                    HuksDeriveHKDF.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize192SHA256Finish63KBDerive130
         * @tc.number testDeriveHKDFSize192SHA256Finish63KBDerive130
         * @tc.desc   testDeriveHKDFSize192SHA256Finish63KBDerive130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize192SHA256Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize192SHA256Finish63KBDeriveKeyAlias_01_130';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeMAC,
                    HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize256SHA256Finish63KBDerive101
         * @tc.number testDeriveHKDFSize256SHA256Finish63KBDerive101
         * @tc.desc   testDeriveHKDFSize256SHA256Finish63KBDerive101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize256SHA256Finish63KBDerive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize256SHA256Finish63KBDeriveKeyAlias_01_101';
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
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize256SHA256Finish63KBDerive108
         * @tc.number testDeriveHKDFSize256SHA256Finish63KBDerive108
         * @tc.desc   testDeriveHKDFSize256SHA256Finish63KBDerive108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize256SHA256Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize256SHA256Finish63KBDeriveKeyAlias_01_108';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyALGORITHMAES,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                    HuksDeriveHKDF.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize256SHA256Finish63KBDerive130
         * @tc.number testDeriveHKDFSize256SHA256Finish63KBDerive130
         * @tc.desc   testDeriveHKDFSize256SHA256Finish63KBDerive130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize256SHA256Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize256SHA256Finish63KBDeriveKeyAlias_01_130';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeMAC,
                    HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize256SHA384Finish63KBDerive101
         * @tc.number testDeriveHKDFSize256SHA384Finish63KBDerive101
         * @tc.desc   testDeriveHKDFSize256SHA384Finish63KBDerive101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize256SHA384Finish63KBDerive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize256SHA384Finish63KBDeriveKeyAlias_01_101';
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA384);
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
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize256SHA384Finish63KBDerive108
         * @tc.number testDeriveHKDFSize256SHA384Finish63KBDerive108
         * @tc.desc   testDeriveHKDFSize256SHA384Finish63KBDerive108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize256SHA384Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize256SHA384Finish63KBDeriveKeyAlias_01_108';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyALGORITHMAES,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                    HuksDeriveHKDF.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize256SHA384Finish63KBDerive130
         * @tc.number testDeriveHKDFSize256SHA384Finish63KBDerive130
         * @tc.desc   testDeriveHKDFSize256SHA384Finish63KBDerive130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize256SHA384Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize256SHA384Finish63KBDeriveKeyAlias_01_130';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeMAC,
                    HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize256SHA512Finish63KBDerive101
         * @tc.number testDeriveHKDFSize256SHA512Finish63KBDerive101
         * @tc.desc   testDeriveHKDFSize256SHA512Finish63KBDerive101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize256SHA512Finish63KBDerive101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize256SHA512Finish63KBDeriveKeyAlias_01_101';
            HuksOptions63kb.properties.splice(2, 1, HuksDeriveHKDF.HuksTagHKDFDigestSHA512);
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
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize256SHA512Finish63KBDerive108
         * @tc.number testDeriveHKDFSize256SHA512Finish63KBDerive108
         * @tc.desc   testDeriveHKDFSize256SHA512Finish63KBDerive108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize256SHA512Finish63KBDerive108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize256SHA512Finish63KBDeriveKeyAlias_01_108';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyALGORITHMAES,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeDERIVE,
                    HuksDeriveHKDF.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        /**
         * @tc.name   testDeriveHKDFSize256SHA512Finish63KBDerive130
         * @tc.number testDeriveHKDFSize256SHA512Finish63KBDerive130
         * @tc.desc   testDeriveHKDFSize256SHA512Finish63KBDerive130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('testDeriveHKDFSize256SHA512Finish63KBDerive130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDeriveHKDFSize256SHA512Finish63KBDeriveKeyAlias_01_130';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksDeriveHKDF.HuksKeyALGORITHMHMAC,
                    HuksDeriveHKDF.HuksKeySIZE256,
                    HuksDeriveHKDF.HuksKeyPurposeMAC,
                    HuksDeriveHKDF.HuksKeyDIGESTSHA256,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDeriveHKDF.HuksKeyPADDINGNONE,
                    HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF, HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });


    });
}
