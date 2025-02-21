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
import Data from '../../../../../../utils/data.json';
import { HuksDeriveHKDF } from '../../../../../../utils/param/derive/publicDeriveParam';
import { stringToUint8Array } from '../../../../../../utils/param/publicFunc';
import { publicDeriveFunc } from '../../../../../../utils/param/derive/publicDeriveCallback';
import { HksTag } from '../../../../../../utils/param/publicParam';

let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let HuksOptions63kb = {
  properties: new Array(
    HuksDeriveHKDF.HuksKeyAlgAES,
    HuksDeriveHKDF.HuksKeyPurposeHKDF,
    HuksDeriveHKDF.HuksTagHKDFDigestSHA256,
    HuksDeriveHKDF.HuksKeyHKDFSize256
  ),
  inData: srcData63Kb,
};

export default function SecurityHuksHKDFBasicFinish63KBCallbackJsunit() {
describe('SecurityHuksHKDFBasicFinish63KBCallbackJsunit', function () {
  it('Security_HUKS_Derive_API8_HKDF_001', 0, async function (done) {
    const srcKeyAliesFirst = 'testDeriveHKDFSize256SHA256Finish63KBDeriveKeyAlias_01_001';
    let huksOptionsFinish = {
      properties: new Array(
        HuksDeriveHKDF.HuksKeySTORAGE,
        HuksDeriveHKDF.HuksKeyISKEYALIAS,
        HuksDeriveHKDF.HuksKeyALGORITHMAES,
        HuksDeriveHKDF.HuksKeySIZE256,
        HuksDeriveHKDF.HuksKeyPurposeENCRYPTDECRYPT,
        HuksDeriveHKDF.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDeriveHKDF.HuksKeyPADDINGNONE,
        HuksDeriveHKDF.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDeriveHKDF.HuksKeyAlgHKDF,HuksDeriveHKDF.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
});
}
