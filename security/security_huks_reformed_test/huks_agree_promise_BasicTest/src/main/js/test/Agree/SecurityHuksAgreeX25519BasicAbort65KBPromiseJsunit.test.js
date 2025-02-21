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

import { describe, it } from '@ohos/hypium';
import * as Data from '../../../../../../utils/data.json';
import { stringToUint8Array } from '../../../../../../utils/param/publicFunc';
import { HuksKeyAlgX25519 } from '../../../../../../utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from '../../../../../../utils/param/agree/publicAgreePromise';
import { HksTag } from '../../../../../../utils/param/publicParam';
let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);

let HuksOptions65kb = {
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

export default function SecurityHuksAgreeX25519BasicAbort65KBPromiseJsunit() {
describe('SecurityHuksAgreeX25519BasicAbort65KBPromiseJsunit', function () {
  it('testReformedAgreeX25519104', 0, async function (done) {
    const srcKeyAliesFirst = 'testAgreeX25519Size256Abort65KBAgreeKeyAlias_01_101';
    const srcKeyAliesSecond = 'testAgreeX25519Size256Abort65KBAgreeKeyAlias_02_101';
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
      inData: srcData65Kb,
    };
    await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions65kb, huksOptionsFinish, 'abort');
    done();
  });
});
}
