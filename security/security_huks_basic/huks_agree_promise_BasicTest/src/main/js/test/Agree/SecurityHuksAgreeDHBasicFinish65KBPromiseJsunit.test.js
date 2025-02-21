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
import { HuksAgreeDH } from '../../../../../../utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from '../../../../../../utils/param/agree/publicAgreePromise';
import { HksTag } from '../../../../../../utils/param/publicParam';
let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);

let HuksOptions65kb = {
  properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH, HuksAgreeDH.HuksKeyDHSize2048),
  inData: srcData65Kb,
};

export default function SecurityHuksAgreeDHBasicFinish65KBPromiseJsunit() {
describe('SecurityHuksAgreeDHBasicFinish65KBPromiseJsunit', function () {
  it('testAgreeDH103', 0, async function (done) {
    const srcKeyAliesFirst = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_01_101';
    const srcKeyAliesSecond = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_02_101';
    let huksOptionsFinish = {
      properties: new Array(
        HuksAgreeDH.HuksKeySTORAGE,
        HuksAgreeDH.HuksKeyISKEYALIAS,
        HuksAgreeDH.HuksKeyALGORITHMAES,
        HuksAgreeDH.HuksKeySIZE256,
        HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
        HuksAgreeDH.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksAgreeDH.HuksKeyPADDINGNONE,
        HuksAgreeDH.HuksKeyBLOCKMODEECB
      ),
      inData: srcData65Kb,
    };
    await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions65kb, huksOptionsFinish, 'finish');
    done();
  });
});
}
