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

import { describe, it, beforeAll } from '@ohos/hypium';
import * as Data from '../../../../../../utils/data.json';
import { stringToUint8Array, checkSoftware } from '../../../../../../utils/param/publicFunc';
import { HuksAgreeDH } from '../../../../../../utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from '../../../../../../utils/param/agree/publicAgreeCallback';
import { HksTag } from '../../../../../../utils/param/publicParam';
let srcData65 = Data.Date65KB;
let srcData65Kb = stringToUint8Array(srcData65);
let useSoftware = true;

let HuksOptions2048 = {
  properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH, HuksAgreeDH.HuksKeyDHSize2048),
  inData: srcData65Kb,
};

let HuksOptions3072 = {
  properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH, HuksAgreeDH.HuksKeyDHSize3072),
  inData: srcData65Kb,
};

let HuksOptions4096 = {
  properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH, HuksAgreeDH.HuksKeyDHSize4096),
  inData: srcData65Kb,
};

function makehuksOptionsFinish(srcKeyAliesFirst) {
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

export default function SecurityHuksDHBasicFinish65KBCallbackJsunit() {
  describe('SecurityHuksDHBasicFinish65KBCallbackJsunit', function () {
    beforeAll(async function (done) {
      useSoftware = await checkSoftware();
      done();
    })
    it('testReformedAgreeDH003', 0, async function (done) {
      const srcKeyAliesFirst = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_01_001';
      const srcKeyAliesSecond = 'testAgreeDHSize2048Finish65KBAgreeKeyAlias_02_001';
      let huksOptionsFinish = makehuksOptionsFinish(srcKeyAliesFirst);
      await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions2048, huksOptionsFinish, 'finish');
      done();
    });

    it('testAgreeDHSize3072Finish65KBAgree001', 0, async function (done) {
      const srcKeyAliesFirst = 'testAgreeDHSize3072Finish65KBAgreeKeyAlias_01_001';
      const srcKeyAliesSecond = 'testAgreeDHSize3072Finish65KBAgreeKeyAlias_02_001';
      if (useSoftware) {
        let huksOptionsFinish = makehuksOptionsFinish(srcKeyAliesFirst);
        await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions3072, huksOptionsFinish, 'finish');
      }
      done();
    });

    it('testAgreeDHSize4096Finish65KBAgree001', 0, async function (done) {
      const srcKeyAliesFirst = 'testAgreeDHSize4096Finish65KBAgreeKeyAlias_01_001';
      const srcKeyAliesSecond = 'testAgreeDHSize4096Finish65KBAgreeKeyAlias_02_001';
      if (useSoftware) {
        let huksOptionsFinish = makehuksOptionsFinish(srcKeyAliesFirst);
        await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions4096, huksOptionsFinish, 'finish');
      }
      done();
    });
  });
}