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
import { HuksSignVerifyECC } from '../../../../../../utils/param/signverify/publicSignverifyParam';
import { stringToUint8Array } from '../../../../../../utils/param/publicFunc';
import { publicSignVerifyFunc } from '../../../../../../utils/param/signverify/publicSignverifyPromise.js';
let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData63AfterSha256 = new Uint8Array([
  0xD2, 0xE1, 0x24, 0x8F, 0x0D, 0xBB, 0x2F, 0x98, 0x64, 0x13, 0x27, 0xE0, 0x0D, 0xEA, 0x34, 0xBB,
  0x1D, 0x1C, 0xC2, 0xA1, 0xBE, 0x10, 0xF0, 0xB1, 0x6F, 0x8E, 0xDF, 0x9B, 0x42, 0xBA, 0x38, 0x5D,
]);
export default function SecurityHuksECCBasicAbort63KBPromiseJsunit() {
describe('SecurityHuksECCBasicAbort63KBPromiseJsunit', function () {
  it('Security_HUKS_SignVerify_API8_ECC_102', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyECCSize256SIGNNONEKeyAlias102';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyECC.HuksKeyAlgECC,
        HuksSignVerifyECC.HuksKeyECCPurposeSIGN,
        HuksSignVerifyECC.HuksTagECCDigestNONE,
        HuksSignVerifyECC.HuksKeyECCSize256
      ),
      inData: srcData63AfterSha256,
    };
    await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData63AfterSha256);
    done();
  });
});
}
