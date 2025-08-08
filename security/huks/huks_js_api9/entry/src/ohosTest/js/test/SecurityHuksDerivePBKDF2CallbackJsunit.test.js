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
import { HuksDerivePBKDF2 } from './utils/param/derive/publicDeriveParam';
import { stringToUint8Array } from './utils/param/publicFunc';
import { publicDeriveFunc } from './utils/param/derive/publicDeriveCallback';
import { HksTag } from './utils/param/publicParam';

let srcData63 = Data.Date63KB;
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

export default function SecurityHuksDerivePBKDF2CallbackJsunit() {
    describe('SecurityHuksDerivePBKDF2CallbackJsunit', function () {
        it('Security_HUKS_Derive_API9_PBKDF2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA256Finish63KBDeriveKeyAlias_01_001';
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
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                    HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
            done();
        });

        it('Security_HUKS_Derive_API9_PBKDF2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA256Abort63KBDeriveKeyAlias_01_001';
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
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksDerivePBKDF2.HuksKeyPADDINGNONE,
                    HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
                ),
                inData: srcData63Kb,
            };
            let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
            await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'abort');
            done();
        });
    });
}
