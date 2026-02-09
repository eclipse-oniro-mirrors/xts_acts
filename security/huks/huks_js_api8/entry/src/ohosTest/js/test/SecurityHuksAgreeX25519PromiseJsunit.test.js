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
import { HuksKeyAlgX25519 } from './utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from './utils/param/agree/publicAgreePromise';
import { HksTag } from './utils/param/publicParam';
import { checkAESCipher } from './utils/param/checkAES';
import Data from './utils/common/data';

let HuksOptions63kb = {
    properties: new Array(
        HuksKeyAlgX25519.HuksKeyAlgX25519,
        HuksKeyAlgX25519.HuksKeyPurposeAGREE,
        HuksKeyAlgX25519.HuksKeyCURVE25519Size256,
        HuksKeyAlgX25519.HuksKeyDIGEST,
        HuksKeyAlgX25519.HuksKeyPADDING,
        HuksKeyAlgX25519.HuksKeyBLOCKMODE
    ),
};
let HuksOptions65kb = {};
let baseHuksOptions = {};
let srcData65 = Data.Data_65KB;
let srcData65Kb = stringToUint8Array(srcData65);

export default function SecurityHuksKeyAlgX25519PromiseJsunit() {
    describe('SecurityHuksKeyAlgX25519PromiseJsunit', function () {
        beforeEach(function () {
            HuksOptions65kb = {
                properties: new Array(
                    HuksKeyAlgX25519.HuksKeyAlgX25519,
                    HuksKeyAlgX25519.HuksKeyPurposeAGREE,
                    HuksKeyAlgX25519.HuksKeyCURVE25519Size256,
                    HuksKeyAlgX25519.HuksKeyDIGEST,
                    HuksKeyAlgX25519.HuksKeyPADDING,
                    HuksKeyAlgX25519.HuksKeyBLOCKMODE
                ),
                inData: srcData65Kb,
            };
            baseHuksOptions = {
                properties: new Array(HuksKeyAlgX25519.HuksKeySTORAGE, HuksKeyAlgX25519.HuksKeyISKEYALIAS),
                inData: new Array(),
            };
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_X25519_101
         * @tc.number Security_HUKS_Agree_API8_X25519_101
         * @tc.desc   Security_HUKS_Agree_API8_X25519_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_X25519_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeX25519Size256Finish63KBAgreeKeyAlias_01_101';
            const srcKeyAliasSecond = 'testAgreeX25519Size256Finish63KBAgreeKeyAlias_02_101';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksKeyAlgX25519.HuksKeySTORAGE,
                    HuksKeyAlgX25519.HuksKeyISKEYALIAS,
                    HuksKeyAlgX25519.HuksKeyALGORITHMAES,
                    HuksKeyAlgX25519.HuksKeySIZE256,
                    HuksKeyAlgX25519.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksKeyAlgX25519.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliasFirst),
                    },
                    HuksKeyAlgX25519.HuksKeyPADDINGNONE,
                    HuksKeyAlgX25519.HuksKeyBLOCKMODECBC
                ),

            };
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions63kb, huksOptionsFinish, 'finish', false);

            // AES Check
            let IV = '0000000000000000';
            let huksOptionsCipher = {
                properties: new Array(
                    HuksKeyAlgX25519.HuksKeyALGORITHMAES,
                    HuksKeyAlgX25519.HuksKeySIZE256,
                    HuksKeyAlgX25519.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksKeyAlgX25519.HuksKeyDIGESTNONE,
                    HuksKeyAlgX25519.HuksKeyPADDINGNONE,
                    HuksKeyAlgX25519.HuksKeyBLOCKMODECBC,
                    { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) },
                ),
            };
            let res = await checkAESCipher(srcKeyAliasFirst + 'final', srcKeyAliasSecond + 'final', huksOptionsCipher);
            expect(res).assertTrue();
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_X25519_102
         * @tc.number Security_HUKS_Agree_API8_X25519_102
         * @tc.desc   Security_HUKS_Agree_API8_X25519_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_X25519_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeX25519Size256Abort63KBAgreeKeyAlias_01_101';
            const srcKeyAliasSecond = 'testAgreeX25519Size256Abort63KBAgreeKeyAlias_02_101';
            let huksOptionsFinish = {
                properties: new Array(
                    HuksKeyAlgX25519.HuksKeySTORAGE,
                    HuksKeyAlgX25519.HuksKeyISKEYALIAS,
                    HuksKeyAlgX25519.HuksKeyALGORITHMAES,
                    HuksKeyAlgX25519.HuksKeySIZE256,
                    HuksKeyAlgX25519.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksKeyAlgX25519.HuksKeyDIGESTNONE,
                    {
                        tag: HksTag.HKS_TAG_KEY_ALIAS,
                        value: stringToUint8Array(srcKeyAliasFirst),
                    },
                    HuksKeyAlgX25519.HuksKeyPADDINGNONE,
                    HuksKeyAlgX25519.HuksKeyBLOCKMODEECB
                ),

            };
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions63kb, huksOptionsFinish, 'abort');
            done();
        });


        /**
         * @tc.name   Security_HUKS_Agree_API8_X25519_Size256AbortAgree_101
         * @tc.number Security_HUKS_Agree_API8_X25519_Size256AbortAgree_101
         * @tc.desc   Security_HUKS_Agree_API8_X25519_Size256AbortAgree_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_X25519_Size256AbortAgree_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_001';
            const srcKeyAliasSecond = 'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_001';
            let params = new Array(
                HuksKeyAlgX25519.HuksKeyALGORITHMAES,
                HuksKeyAlgX25519.HuksKeySIZE256,
                HuksKeyAlgX25519.HuksKeyPurposeENCRYPTDECRYPT,
                HuksKeyAlgX25519.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksKeyAlgX25519.HuksKeyPADDINGNONE,
                HuksKeyAlgX25519.HuksKeyBLOCKMODEECB
            );
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions65kb, HuksOptionsFinish, 'abort');
            done();
        });
        /**
         * @tc.name   Security_HUKS_Agree_API8_X25519_Size256FinishAgree_101
         * @tc.number Security_HUKS_Agree_API8_X25519_Size256FinishAgree_101
         * @tc.desc   Security_HUKS_Agree_API8_X25519_Size256FinishAgree_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_X25519_Size256FinishAgree_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeX25519Size256Finish65KBAgreeKeyAlias_01_001';
            const srcKeyAliasSecond = 'testAgreeX25519Size256Finish65KBAgreeKeyAlias_02_001';
            let params = new Array(
                HuksKeyAlgX25519.HuksKeyALGORITHMAES,
                HuksKeyAlgX25519.HuksKeySIZE256,
                HuksKeyAlgX25519.HuksKeyPurposeENCRYPTDECRYPT,
                HuksKeyAlgX25519.HuksKeyDIGESTNONE,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksKeyAlgX25519.HuksKeyPADDINGNONE,
                HuksKeyAlgX25519.HuksKeyBLOCKMODEECB
            );
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions65kb, HuksOptionsFinish, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_X25519_Size256FinishAgree_108
         * @tc.number Security_HUKS_Agree_API8_X25519_Size256FinishAgree_108
         * @tc.desc   Security_HUKS_Agree_API8_X25519_Size256FinishAgree_108
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_X25519_Size256FinishAgree_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeX25519Size256Finish65KBAgreeKeyAlias_01_008';
            const srcKeyAliasSecond = 'testAgreeX25519Size256Finish65KBAgreeKeyAlias_02_008';
            let params = new Array(
                HuksKeyAlgX25519.HuksKeyALGORITHMAES,
                HuksKeyAlgX25519.HuksKeySIZE256,
                HuksKeyAlgX25519.HuksKeyPurposeDERIVE,
                HuksKeyAlgX25519.HuksKeyDIGESTSHA256,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksKeyAlgX25519.HuksKeyPADDINGNONE,
                HuksKeyAlgX25519.HuksKeyBLOCKMODEECB
            );
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions65kb, HuksOptionsFinish, 'finish');
            done();
        });

        /**
         * @tc.name   Security_HUKS_Agree_API8_X25519_Size256FinishAgree_130
         * @tc.number Security_HUKS_Agree_API8_X25519_Size256FinishAgree_130
         * @tc.desc   Security_HUKS_Agree_API8_X25519_Size256FinishAgree_130
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_X25519_Size256FinishAgree_130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliasFirst = 'testAgreeX25519Size256Finish65KBAgreeKeyAlias_01_030';
            const srcKeyAliasSecond = 'testAgreeX25519Size256Finish65KBAgreeKeyAlias_02_030';
            let params = new Array(
                HuksKeyAlgX25519.HuksKeyALGORITHMHMAC,
                HuksKeyAlgX25519.HuksKeySIZE256,
                HuksKeyAlgX25519.HuksKeyPurposeMAC,
                HuksKeyAlgX25519.HuksKeyDIGESTSHA1,
                {
                    tag: HksTag.HKS_TAG_KEY_ALIAS,
                    value: stringToUint8Array(srcKeyAliasFirst),
                },
                HuksKeyAlgX25519.HuksKeyPADDINGNONE,
                HuksKeyAlgX25519.HuksKeyBLOCKMODEECB
            );
            let HuksOptionsFinish = makeOptions(baseHuksOptions, 2, params, srcData65Kb);
            await publicAgreeFunc(srcKeyAliasFirst, srcKeyAliasSecond, HuksOptions65kb, HuksOptionsFinish, 'finish');
            done();
        });
    });
}
