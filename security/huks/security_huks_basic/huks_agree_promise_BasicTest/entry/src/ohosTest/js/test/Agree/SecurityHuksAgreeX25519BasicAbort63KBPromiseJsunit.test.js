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

import { describe, it, beforeAll, beforeEach, expect} from '@ohos/hypium';
import { stringToUint8Array, checkSoftware } from '../../../../../../../utils/param/publicFunc';
import { HuksKeyAlgX25519 } from '../../../../../../../utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from '../../../../../../../utils/param/agree/publicAgreePromise';
import { HksTag } from '../../../../../../../utils/param/publicParam';
import { checkAESChiper } from '../../../../../../../utils/param/checkAES';

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

export default function SecurityHuksAgreeX25519BasicAbort63KBPromiseJsunit() {
describe('SecurityHuksAgreeX25519BasicAbort63KBPromiseJsunit', function () {
  it('Security_HUKS_Agree_API8_X25519_102', 0, async function (done) {
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
    await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions63kb, huksOptionsFinish, 'abort');
    done();
  });
});
}
