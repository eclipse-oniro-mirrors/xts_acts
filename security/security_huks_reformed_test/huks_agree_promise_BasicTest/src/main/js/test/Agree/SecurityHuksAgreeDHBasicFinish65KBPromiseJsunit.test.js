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

let HuksOptions2048 = {
  properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH, HuksAgreeDH.HuksKeyDHSize2048),
  inData: srcData65Kb,
};

function makehuksOptionsFinish(srcKeyAliesFirst){
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
  return huksOptionsFinish;
}

function makehuksOptionsDerive(srcKeyAliesFirst){
  let huksOptionsFinish = {
    properties: new Array(
      HuksAgreeDH.HuksKeyALGORITHMAES,
      HuksAgreeDH.HuksKeySIZE256,
      HuksAgreeDH.HuksKeyPurposeDERIVE,
      HuksAgreeDH.HuksKeyDIGESTSHA256,
      HuksAgreeDH.HuksKeyPADDINGNONE,
      HuksAgreeDH.HuksKeyBLOCKMODEECB,
      {
        tag: HksTag.HKS_TAG_KEY_ALIAS,
        value: stringToUint8Array(srcKeyAliesFirst),
      },
      HuksAgreeDH.HuksKeySTORAGE,
      HuksAgreeDH.HuksKeyISKEYALIAS,
    ),
    inData: srcData65Kb,
  };
  return huksOptionsFinish;
}

function makehuksOptionsHmac(srcKeyAliesFirst){
  let huksOptionsFinish = {
    properties: new Array(
      HuksAgreeDH.HuksKeyALGORITHMHMAC,
      HuksAgreeDH.HuksKeySIZE256,
      HuksAgreeDH.HuksKeyPurposeMAC,
      HuksAgreeDH.HuksKeyDIGESTSHA256,
      HuksAgreeDH.HuksKeyPADDINGNONE,
      HuksAgreeDH.HuksKeyBLOCKMODEECB,
      {
        tag: HksTag.HKS_TAG_KEY_ALIAS,
        value: stringToUint8Array(srcKeyAliesFirst),
      },
      HuksAgreeDH.HuksKeySTORAGE,
      HuksAgreeDH.HuksKeyISKEYALIAS,
    ),
    inData: srcData65Kb,
  };
  return huksOptionsFinish;
}

export default function SecurityHuksAgreeDHBasicFinish65KBPromiseJsunit() {
  describe('SecurityHuksAgreeDHBasicFinish65KBPromiseJsunit', function () {
    it('testReformedAgreeDH103', 0, async function (done) {
      const srcKeyAliesFirst = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_01_101';
      const srcKeyAliesSecond = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_02_101';
      let huksOptionsFinish = makehuksOptionsFinish(srcKeyAliesFirst);
      await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions2048, huksOptionsFinish, 'finish');
      done();
    });

    it('testAgreeDHSize2048Finish65KBAgree108', 0, async function (done) {
      const srcKeyAliesFirst = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_01_108';
      const srcKeyAliesSecond = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_02_108';
      let huksOptionsFinish = makehuksOptionsDerive(srcKeyAliesFirst);
      await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions2048, huksOptionsFinish, 'finish');
      done();
    });

    it('testAgreeDHSize2048Finish65KBAgree130', 0, async function (done) {
      const srcKeyAliesFirst = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_01_130';
      const srcKeyAliesSecond = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_02_130';
      let huksOptionsFinish = makehuksOptionsHmac(srcKeyAliesFirst);
      await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions2048, huksOptionsFinish, 'finish');
      done();
    });
  });
}
