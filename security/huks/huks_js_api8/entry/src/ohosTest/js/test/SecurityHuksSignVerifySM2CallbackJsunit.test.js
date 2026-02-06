/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, TestType, Size, Level } from '@ohos/hypium';
import Data from './utils/data.json';
import { HuksSignVerifySM2 } from './utils/param/signverify/publicSignverifyParam.js';
import { stringToUint8Array } from './utils/param/publicFunc.js';
import { publicSignVerifyFunc } from './utils/param/signverify/publicSignverifyCallback.js';

let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;

export default function SecurityHuksSignVerifySM2CallbackJsunit() {
    describe('SecurityHuksSignVerifySM2CallbackJsunit', function () {
        it('Security_HUKS_SignVerify_API8_SM2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifySM2Size256SIGNSM3KeyAlias001';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSIGN,
                    HuksSignVerifySM2.HuksTagSM2DigestSM3,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: srcData63Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData63Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeVERIFY,
                    HuksSignVerifySM2.HuksTagSM2DigestSM3,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData63Kb);
            done();
        });

        it('Security_HUKS_SignVerify_API8_SM2_00211111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifySm2Size256SIGNSM3KeyAlias002';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSIGN,
                    HuksSignVerifySM2.HuksTagSM2DigestSM3,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: srcData63Kb,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData63Kb);
            done();
        });

        it('Security_HUKS_SignVerify_API8_SM2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
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
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeVERIFY,
                    HuksSignVerifySM2.HuksTagSM2DigestSM3,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        it('Security_HUKS_SignVerify_API8_SM2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifySM2Size256SIGNSM3KeyAlias004';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifySM2.HuksKeyAlgSM2,
                    HuksSignVerifySM2.HuksKeySM2PurposeSIGN,
                    HuksSignVerifySM2.HuksTagSM2DigestSM3,
                    HuksSignVerifySM2.HuksKeySize256
                ),
                inData: srcData65Kb,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData65Kb);
            done();
        });
    });
}
