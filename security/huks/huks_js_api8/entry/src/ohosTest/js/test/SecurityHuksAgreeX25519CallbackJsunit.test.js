/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import Data from './utils/common/data';
import { HuksKeyAlgX25519 } from './utils/param/agree/publicAgreeParam.js';
import { makeOptions, stringToUint8Array } from './utils/param/publicFunc.js';
import { HksTag } from './utils/param/publicParam.js';
import { publicAgreeFunc } from './utils/param/agree/publicAgreeCallback.js';

let HuksOptions65kb = {};
let baseHuksOptions = {};
let srcData65 = Data.Data_65KB;
let srcData65Kb = stringToUint8Array(srcData65);

export default function SecurityHuksAgreeX25519CallbackJsunit() {
    describe('SecurityHuksAgreeX25519CallbackJsunit', function () {
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
         * @tc.name   Security_HUKS_Agree_API8_X25519_Size256AbortAgree_001
         * @tc.number Security_HUKS_Agree_API8_X25519_Size256AbortAgree_001
         * @tc.desc   Security_HUKS_Agree_API8_X25519_Size256AbortAgree_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_X25519_Size256AbortAgree_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
         * @tc.name   Security_HUKS_Agree_API8_X25519_Size256FinishAgree_001
         * @tc.number Security_HUKS_Agree_API8_X25519_Size256FinishAgree_001
         * @tc.desc   Security_HUKS_Agree_API8_X25519_Size256FinishAgree_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_Agree_API8_X25519_Size256FinishAgree_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
    });
};