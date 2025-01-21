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

import { describe, it, beforeAll, beforeEach, expect } from '@ohos/hypium';
import { stringToUint8Array, checkSoftware } from '../../../../../../../utils/param/publicFunc';
import { HuksAgreeDH } from '../../../../../../../utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from '../../../../../../../utils/param/agree/publicAgreePromise';
import { HksTag } from '../../../../../../../utils/param/publicParam';
import { checkAESChiper } from '../../../../../../../utils/param/checkAES';


let useSoftware = true;
let HuksOptions63kb = {
  properties: new Array(HuksAgreeDH.HuksKeyAlgDH, HuksAgreeDH.HuksKeyPurposeDH, HuksAgreeDH.HuksKeyDHSize2048),
};

export default function SecurityHuksAgreeDHBasicFinish63KBPromiseJsunit() {
  describe('SecurityHuksAgreeDHBasicFinish63KBPromiseJsunit', function () {
    beforeAll(async function (done) {
      useSoftware = await checkSoftware();
      done();
    })
    it('Security_HUKS_Agree_API8_DH_101', 0, async function (done) {
      const srcKeyAliesFirst = 'testAgreeDHSize2048Finish63KBAgreeKeyAlias_01_101';
      const srcKeyAliesSecond = 'testAgreeDHSize2048Finish63KBAgreeKeyAlias_02_101';
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
          HuksAgreeDH.HuksKeyBLOCKMODECBC
        ),

      };
      if (useSoftware) {
        await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions63kb, huksOptionsFinish, 'finish', false);

        // AES Check
        let IV = '0000000000000000';
        let huksOptionsCipher = {
          properties: new Array(
            HuksAgreeDH.HuksKeyALGORITHMAES,
            HuksAgreeDH.HuksKeySIZE256,
            HuksAgreeDH.HuksKeyPurposeENCRYPTDECRYPT,
            HuksAgreeDH.HuksKeyDIGESTNONE,
            HuksAgreeDH.HuksKeyPADDINGNONE,
            HuksAgreeDH.HuksKeyBLOCKMODECBC,
            { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) },
          ),
        };
        let res = await checkAESChiper(srcKeyAliesFirst + 'final', srcKeyAliesSecond + 'final', huksOptionsCipher);
        expect(res).assertTrue();
      };
      done();
    });
  });
}
