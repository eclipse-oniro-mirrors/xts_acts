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

import { describe, it, expect } from '@ohos/hypium';
import { stringToUint8Array } from '../../../../../../../utils/param/publicFunc';
import { HuksAgreeECDH } from '../../../../../../../utils/param/agree/publicAgreeParam';
import { publicAgreeFunc } from '../../../../../../../utils/param/agree/publicAgreeCallback';
import { HksTag } from '../../../../../../../utils/param/publicParam';
import { checkAESChiper } from '../../../../../../../utils/param/checkAES';

let HuksOptions63kb = {
  properties: new Array(
    HuksAgreeECDH.HuksKeyAlgECC,
    HuksAgreeECDH.HuksKeyPurposeECDH,
    HuksAgreeECDH.HuksKeyECCSize256,
    HuksAgreeECDH.HuksKeyECCDIGEST,
    HuksAgreeECDH.HuksKeyECCPADDING,
    HuksAgreeECDH.HuksKeyECCBLOCKMODE
  ),
};

export default function SecurityHuksECDHBasicFinish63KBCallbackJsunit() {
describe('SecurityHuksECDHBasicFinish63KBCallbackJsunit', function () {
  it('Security_HUKS_Agree_API8_ECDH_001', 0, async function (done) {
    const srcKeyAliesFirst = 'testAgreeECDHSize256Finish63KBAgreeKeyAlias_01_001';
    const srcKeyAliesSecond = 'testAgreeECDHSize256Finish63KBAgreeKeyAlias_02_001';
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
        HuksAgreeECDH.HuksKeyBLOCKMODECBC
      ),
    };
    await publicAgreeFunc(srcKeyAliesFirst, srcKeyAliesSecond, HuksOptions63kb, huksOptionsFinish, 'finish', false);

    // AES Check
      let IV = '0000000000000000';
      let huksOptionsCipher = {
        properties: new Array(
          HuksAgreeECDH.HuksKeyALGORITHMAES,
          HuksAgreeECDH.HuksKeySIZE256,
          HuksAgreeECDH.HuksKeyPurposeENCRYPTDECRYPT,
          HuksAgreeECDH.HuksKeyDIGESTNONE,
          HuksAgreeECDH.HuksKeyPADDINGNONE,
          HuksAgreeECDH.HuksKeyBLOCKMODECBC,
          { tag: HksTag.HKS_TAG_IV, value: stringToUint8Array(IV) },
        ),
      };
      let res = await checkAESChiper(srcKeyAliesFirst+ 'final', srcKeyAliesSecond + 'final',huksOptionsCipher);
      expect(res).assertTrue();
    done();
  });
});
}