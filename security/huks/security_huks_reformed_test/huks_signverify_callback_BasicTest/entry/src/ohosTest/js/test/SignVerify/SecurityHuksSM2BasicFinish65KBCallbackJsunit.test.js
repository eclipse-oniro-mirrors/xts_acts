/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import Data from '../../../../../../../utils/data.json';
import { HuksSignVerifySM2 } from '../../../../../../../utils/param/signverify/publicSignverifyParam';
import { stringToUint8Array } from '../../../../../../../utils/param/publicFunc';
import { publicSignVerifyFunc } from '../../../../../../../utils/param/signverify/publicSignverifyCallback.js';
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;
export default function SecurityHuksSM2BasicFinish65KBCallbackJsunit() {
describe('SecurityHuksSM2BasicFinish65KBCallbackJsunit', function () {
    it('Security_HUKS_SignVerify_API9_SM2_003', 0, async function (done) {
        const srcKeyAlies = 'testSignVerifySM2Size256SIGNSM3KeyAlias003';
        let HuksOptions = {
            properties: new Array(
                HuksSignVerifySM2.HuksKeyAlgSM2,
                HuksSignVerifySM2.HuksKeySM2PurposeSIGN,
                HuksSignVerifySM2.HuksTagSM2DigestSM3,
                HuksSignVerifySM2.HuksKeySize256
            ),
            inData: srcData65Kb,
        };
        finishOutData = await publicSignVerifyFunc(
            srcKeyAlies,
            HuksOptions,
            'finish',
            true,
            srcData65Kb
        );
        HuksOptions = {
            properties: new Array(
                HuksSignVerifySM2.HuksKeyAlgSM2,
                HuksSignVerifySM2.HuksKeySM2PurposeVERIFY,
                HuksSignVerifySM2.HuksTagSM2DigestSM3,
                HuksSignVerifySM2.HuksKeySize256
            ),
            inData: finishOutData,
        };
        await publicSignVerifyFunc(
            srcKeyAlies,
            HuksOptions,
            'finish',
            false,
            srcData65Kb
        );
        done();
    });
});}