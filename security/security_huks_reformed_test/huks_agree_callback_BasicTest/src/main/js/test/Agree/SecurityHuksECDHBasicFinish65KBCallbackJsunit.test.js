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
import { HuksAgreeECDH } from '../../../../../../utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from '../../../../../../utils/param/agree/publicAgreeCallback';
import { HksTag } from '../../../../../../utils/param/publicParam';
let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);

let HuksOptions65kb = {
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

export default function SecurityHuksECDHBasicFinish65KBCallbackJsunit() {
describe('SecurityHuksECDHBasicFinish65KBCallbackJsunit', function () {
  it('testReformedAgreeEDCH003', 0, async function (done) {
    const srcKeyAliesFirst = 'testAgreeECDHSize256Finish65KBAgreeKeyAlias_01_001';
    const srcKeyAliesSecond = 'testAgreeECDHSize256Finish65KBAgreeKeyAlias_02_001';
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
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksAgreeECDH.HuksKeyPADDINGNONE,
        HuksAgreeECDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions65kb, huksOptionsFinish, 'finish');
    done();
  });
});
}
