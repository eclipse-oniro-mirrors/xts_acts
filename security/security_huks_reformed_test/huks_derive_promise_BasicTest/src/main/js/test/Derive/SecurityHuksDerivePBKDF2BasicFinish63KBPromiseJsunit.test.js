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
import { HuksDerivePBKDF2 } from '../../../../../../utils/param/derive/publicDeriveParam';
import { stringToUint8Array } from '../../../../../../utils/param/publicFunc';
import { publicDeriveFunc } from '../../../../../../utils/param/derive/publicDerivePromise';
import { HksTag } from '../../../../../../utils/param/publicParam';

let srcData63 = Data.Date63KB;
let srcData63Kb = stringToUint8Array(srcData63);

let HuksOptions63kb = {
  properties: new Array(
    HuksDerivePBKDF2.HuksKeyAlgAES,
    HuksDerivePBKDF2.HuksKeyPurposePBKDF2,
    HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA256,
    HuksDerivePBKDF2.HuksKeyPBKDF2Size192,
    HuksDerivePBKDF2.HuksKeyPBKDF2Iteration,
    HuksDerivePBKDF2.HuksKeyPBKDF2Salt
  ),
  inData: srcData63Kb,
};

export default function SecurityHuksDerivePBKDF2BasicFinish63KBPromiseJsunit() {
describe('SecurityHuksDerivePBKDF2BasicFinish63KBPromiseJsunit', function () {
  it('testReformedDerivePBKDF2101', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size192SHA256Finish63KBDeriveKeyAlias_01_101';
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeySTORAGE,
        HuksDerivePBKDF2.HuksKeyISKEYALIAS,
        HuksDerivePBKDF2.HuksKeyALGORITHMAES,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
        HuksDerivePBKDF2.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2,HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });

  it('testDerivePBKDF2Size192SHA256Finish63KBDerive108', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size192SHA256Finish63KBDeriveKeyAlias_01_108';
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeyAlgAES,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
        HuksDerivePBKDF2.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
  
  it('testDerivePBKDF2Size192SHA256Finish63KBDerive130', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size192SHA256Finish63KBDeriveKeyAlias_01_130';
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeMAC,
        HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
  
  it('testDerivePBKDF2Size256SHA256Finish63KBDerive101', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA256Finish63KBDeriveKeyAlias_01_101';
    HuksOptions63kb.properties.splice(3, 1, HuksDerivePBKDF2.HuksKeyPBKDF2Size256);
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeySTORAGE,
        HuksDerivePBKDF2.HuksKeyISKEYALIAS,
        HuksDerivePBKDF2.HuksKeyAlgAES,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
        HuksDerivePBKDF2.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
  
  it('testDerivePBKDF2Size256SHA256Finish63KBDerive108', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA256Finish63KBDeriveKeyAlias_01_108';
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeyAlgAES,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
        HuksDerivePBKDF2.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
  
  it('testDerivePBKDF2Size256SHA256Finish63KBDerive130', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA256Finish63KBDeriveKeyAlias_01_130';
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeMAC,
        HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
  
  it('testDerivePBKDF2Size256SHA384Finish63KBDerive101', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA384Finish63KBDeriveKeyAlias_01_101';
    HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA384);
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeySTORAGE,
        HuksDerivePBKDF2.HuksKeyISKEYALIAS,
        HuksDerivePBKDF2.HuksKeyAlgAES,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
        HuksDerivePBKDF2.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
  
  it('testDerivePBKDF2Size256SHA384Finish63KBDerive108', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA384Finish63KBDeriveKeyAlias_01_108';
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeyAlgAES,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
        HuksDerivePBKDF2.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
  
  it('testDerivePBKDF2Size256SHA384Finish63KBDerive130', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA384Finish63KBDeriveKeyAlias_01_130';
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeMAC,
        HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
  
  it('testDerivePBKDF2Size256SHA512Finish63KBDerive101', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA512Finish63KBDeriveKeyAlias_01_101';
    HuksOptions63kb.properties.splice(2, 1, HuksDerivePBKDF2.HuksTagPBKDF2DigestSHA512);
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeySTORAGE,
        HuksDerivePBKDF2.HuksKeyISKEYALIAS,
        HuksDerivePBKDF2.HuksKeyAlgAES,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeENCRYPTDECRYPT,
        HuksDerivePBKDF2.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
  
  it('testDerivePBKDF2Size256SHA512Finish63KBDerive108', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA512Finish63KBDeriveKeyAlias_01_108';
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeyAlgAES,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeDERIVE,
        HuksDerivePBKDF2.HuksKeyDIGESTNONE,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
  
  it('testDerivePBKDF2Size256SHA512Finish63KBDerive130', 0, async function (done) {
    const srcKeyAliesFirst = 'testDerivePBKDF2Size256SHA512Finish63KBDeriveKeyAlias_01_130';
    let huksOptionsFinish = {
      properties: new Array(
        HuksDerivePBKDF2.HuksKeyALGORITHMHMAC,
        HuksDerivePBKDF2.HuksKeySIZE256,
        HuksDerivePBKDF2.HuksKeyPurposeMAC,
        HuksDerivePBKDF2.HuksKeyDIGESTSHA256,
        {
          tag: HksTag.HKS_TAG_KEY_ALIAS,
          value: stringToUint8Array(srcKeyAliesFirst),
        },
        HuksDerivePBKDF2.HuksKeyPADDINGNONE,
        HuksDerivePBKDF2.HuksKeyBLOCKMODEGCM
      ),
      inData: srcData63Kb,
    };
    let deriveArray = new Array(HuksDerivePBKDF2.HuksKeyAlgPBKDF2, HuksDerivePBKDF2.HuksKeyDERIVEKEYSIZE);
    await publicDeriveFunc(srcKeyAliesFirst, HuksOptions63kb, huksOptionsFinish, deriveArray, 'finish');
    done();
  });
});
}
