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
import { HuksSignVerifyRSA } from '../../../../../../utils/param/signverify/publicSignverifyParam';
import { stringToUint8Array } from '../../../../../../utils/param/publicFunc';
import { publicSignVerifyFunc } from '../../../../../../utils/param/signverify/publicSignverifyPromise.js';
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
export default function SecurityHuksRSABasicAbort65KBCallbackJsunit() {
describe('SecurityHuksRSABasicAbort65KBCallbackJsunit', function () {
  it('Security_HUKS_SignVerify_API9_RSA_004', 0, async function (done) {
    const srcKeyAlies = 'testSignVerifyRSASize4096SIGNPKCS1SHA256KeyAlias004';
    let HuksOptions = {
      properties: new Array(
        HuksSignVerifyRSA.HuksKeyAlgRSA,
        HuksSignVerifyRSA.HuksKeyRSAPurposeSIGN,
        HuksSignVerifyRSA.HuksTagPKCS1DigestSHA256,
        HuksSignVerifyRSA.HuksKeyRSAPADDINGPKCS1V15,
        HuksSignVerifyRSA.HuksKeyRSASize4096
      ),
      inData: srcData65Kb,
    };
    await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData65Kb);
    done();
  });
});
}
