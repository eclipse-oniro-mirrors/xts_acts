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

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import * as Data from './utils/data.json';
import { stringToUint8Array } from './utils/param/publicFunc';
import { HuksKeyAlgX25519 } from './utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from './utils/param/agree/publicAgreePromise';
import { HksTag } from './utils/param/publicParam';
import { checkAESChiper } from './utils/param/checkAES';

let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);

let HuksOptions63kb = {
    properties: new Array(
        HuksKeyAlgX25519.HuksKeyAlgX25519,
        HuksKeyAlgX25519.HuksKeyPurposeAGREE,
        HuksKeyAlgX25519.HuksKeyCURVE25519Size256,
    ),
};

export default function SecurityHuksAgreeX25519PromiseJsunit() {
    describe('SecurityHuksAgreeX25519PromiseJsunit', function () {
        it('Security_HUKS_Agree_API9_X25519_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testAgreeX25519Size256Finish63KBAgreeKeyAlias_01_101';
            const srcKeyAliesSecond = 'testAgreeX25519Size256Finish63KBAgreeKeyAlias_02_101';
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
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksKeyAlgX25519.HuksKeyPADDINGNONE,
                    HuksKeyAlgX25519.HuksKeyBLOCKMODECBC
                ),
            };
            await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions63kb, huksOptionsFinish, 'finish');
            //AES/256/ECB/NoPadding/

            let IV = '0000000000000000';
            let huksOptionsCipher = {
                properties: new Array(
                    HuksKeyAlgX25519.HuksKeyALGORITHMAES,
                    HuksKeyAlgX25519.HuksKeySIZE256,
                    HuksKeyAlgX25519.HuksKeyPurposeENCRYPTDECRYPT,
                    HuksKeyAlgX25519.HuksKeyDIGESTNONE,
                    HuksKeyAlgX25519.HuksKeyPADDINGNONE,
                    HuksKeyAlgX25519.HuksKeyBLOCKMODECBC,
                    {
                        tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV)
                    },
                ),
            };
            let res = await checkAESChiper(srcKeyAliesFirst + 'final', srcKeyAliesSecond + 'final', huksOptionsCipher);
            expect(res).assertTrue();
            done();
        });

        //abort
        it('Security_HUKS_Agree_API9_X25519_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAliesFirst = 'testAgreeX25519Size256Abort63KBAgreeKeyAlias_01_101';
            const srcKeyAliesSecond = 'testAgreeX25519Size256Abort63KBAgreeKeyAlias_02_101';
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
                        value: stringToUint8Array(srcKeyAliesFirst),
                    },
                    HuksKeyAlgX25519.HuksKeyPADDINGNONE,
                    HuksKeyAlgX25519.HuksKeyBLOCKMODEECB
                ),
            };
            await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions63kb, huksOptionsFinish, 'abort',
                true);
            done();
        });
    });
}
