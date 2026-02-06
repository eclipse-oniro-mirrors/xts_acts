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


import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { makeOptions, stringToUint8Array } from './utils/param/publicFunc';
import { HuksAgreeECDH } from './utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from './utils/param/agree/publicAgreePromise';
import { HksTag } from './utils/param/publicParam';
import { checkAESCipher } from './utils/param/checkAES';
import Data from './utils/common/data';

let HuksOptions63kb = {};
let srcData65 = Data.Data_65KB;
let srcData65Kb = stringToUint8Array(srcData65);
let HuksOptions65kb = {};
let baseHuksOptions = {};

export default function SecurityHuksAgreeECDHPromiseJsunit() {
    describe('SecurityHuksAgreeECDHPromiseJsunit', function () {
        beforeEach(function () {
            HuksOptions63kb = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
            };
            HuksOptions65kb = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyAlgECC,
                    HuksAgreeECDH.HuksKeyPurposeECDH,
                    HuksAgreeECDH.HuksKeyECCSize256,
                    HuksAgreeECDH.HuksKeyECCDIGEST,
                    HuksAgreeECDH.HuksKeyECCPADDING,
                    HuksAgreeECDH.HuksKeyECCBLOCKMODE
                ),
                inData: srcData65Kb,
            };
            baseHuksOptions = {
                properties: new Array(HuksAgreeECDH.HuksKeySTORAGE, HuksAgreeECDH.HuksKeyISKEYALIAS),
                inData: new Array(),
            };
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_ECDH_101
         * @tc.number Security_HUKS_Agree_API8_ECDH_101
         * @tc.desc   Security_HUKS_Agree_API8_ECDH_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_ECDH_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeECDHSize256Finish63KBAgreeKeyAlias_01_101';
            const srcKeyAliasSecond = 'testAgreeECDHSize256Finish63KBAgreeKeyAlias_02_101';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeySTORAGE,
                    HuksAgreeECDH.HuksKeyISKEYALIAS,
                    HuksAgreeECDH.HuksKeyALGORITHMAES,
                    HuksAgreeECDH.HuksKeySIZE256,
                    HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeECDH.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliasFirst),
                    },
                    HuksAgreeECDH.HuksKeyPADDINGNONE,
                    HuksAgreeECDH.HuksKeyBLOCKMODECBC
                ),

            };
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions63kb, huksOptionsFinish, 'finish', false);

            // AES Check
            let IV = '0000000000000000';
            let huksOptionsCipher = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeyALGORITHMAES,
                    HuksAgreeECDH.HuksKeySIZE256,
                    HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeECDH.HuksKeyDIGESTNONE,
                    HuksAgreeECDH.HuksKeyPADDINGNONE,
                    HuksAgreeECDH.HuksKeyBLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) },
                ),
            };
            let res = await checkAESCipher(srcKeyAliasFirst + 'final', srcKeyAliasSecond + 'final', huksOptionsCipher);
            expect(res).assertTrue();
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_ECDH_102
         * @tc.number Security_HUKS_Agree_API8_ECDH_102
         * @tc.desc   Security_HUKS_Agree_API8_ECDH_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_ECDH_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeECDHSize256Abort63KBAgreeKeyAlias_01_101';
            const srcKeyAliasSecond = 'testAgreeECDHSize256Abort63KBAgreeKeyAlias_02_101';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksAgreeECDH.HuksKeySTORAGE,
                    HuksAgreeECDH.HuksKeyISKEYALIAS,
                    HuksAgreeECDH.HuksKeyALGORITHMAES,
                    HuksAgreeECDH.HuksKeySIZE256,
                    HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksAgreeECDH.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliasFirst),
                    },
                    HuksAgreeECDH.HuksKeyPADDINGNONE,
                    HuksAgreeECDH.HuksKeyBLOCKMODEECB
                ),
            };
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions63kb, huksOptionsFinish, 'abort');
            done();
        });


        /**
         * @tc.name   Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_101
         * @tc.number Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_101
         * @tc.desc   Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeECDHSize256Finish65KBAgreeKeyAlias_01_001';
            const srcKeyAliasSecond = 'testAgreeECDHSize256Finish65KBAgreeKeyAlias_02_001';
            let params = new Array(
                HuksAgreeECDH.HuksKeyALGORITHMAES,
                HuksAgreeECDH.HuksKeySIZE256,
                HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
                HuksAgreeECDH.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksAgreeECDH.HuksKeyPADDINGNONE,
                HuksAgreeECDH.HuksKeyBLOCKMODEECB
            );
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions65kb, HuksOptionsFinish, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_108
         * @tc.number Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_108
         * @tc.desc   Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeECDHSize256Finish65KBAgreeKeyAlias_01_008';
            const srcKeyAliasSecond = 'testAgreeECDHSize256Finish65KBAgreeKeyAlias_02_008';
            let params = new Array(
                HuksAgreeECDH.HuksKeyALGORITHMAES,
                HuksAgreeECDH.HuksKeySIZE256,
                HuksAgreeECDH.HuksKeyPurposeDERIVE,
                HuksAgreeECDH.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksAgreeECDH.HuksKeyPADDINGNONE,
                HuksAgreeECDH.HuksKeyBLOCKMODEECB
            );
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions65kb, HuksOptionsFinish, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_130
         * @tc.number Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_130
         * @tc.desc   Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_ECDH_Size256FinishAgree_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeECDHSize256Finish65KBAgreeKeyAlias_01_030';
            const srcKeyAliasSecond = 'testAgreeECDHSize256Finish65KBAgreeKeyAlias_02_030';
            let params = new Array(
                HuksAgreeECDH.HuksKeyALGORITHMHMAC,
                HuksAgreeECDH.HuksKeySIZE256,
                HuksAgreeECDH.HuksKeyPurposeMAC,
                HuksAgreeECDH.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksAgreeECDH.HuksKeyPADDINGNONE,
                HuksAgreeECDH.HuksKeyBLOCKMODEECB
            );
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions65kb, HuksOptionsFinish, 'finish');
            done();
        });


        /**
         * @tc.name   Security_HUKS_Agree_API8_ECDH_Size256AbortAgree_101
         * @tc.number Security_HUKS_Agree_API8_ECDH_Size256AbortAgree_101
         * @tc.desc   Security_HUKS_Agree_API8_ECDH_Size256AbortAgree_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_ECDH_Size256AbortAgree_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeECDHSize256Abort65KBAgreeKeyAlias_01_001';
            const srcKeyAliasSecond = 'testAgreeECDHSize256Abort65KBAgreeKeyAlias_02_001';
            let params = new Array(
                HuksAgreeECDH.HuksKeyALGORITHMAES,
                HuksAgreeECDH.HuksKeySIZE256,
                HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
                HuksAgreeECDH.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksAgreeECDH.HuksKeyPADDINGNONE,
                HuksAgreeECDH.HuksKeyBLOCKMODEECB
            );
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions65kb, HuksOptionsFinish, 'abort');
            done();
        });
    });
}
