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
import { describe, it, TestType, Size, Level } from '@ohos/hypium';
import Data from './utils/data.json';
import { HuksSignVerifyED25519 } from './utils/param/signverify/publicSignverifyParam';
import { stringToUint8Array } from './utils/param/publicFunc';
import { publicSignVerifyFunc } from './utils/param/signverify/publicSignverifyCallback.js';

let srcData63 = Data.Data63b;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data65b;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;

export default function SecurityHuksSignVerifyED25519CallbackJsunit() {
    describe('SecurityHuksSignVerifyED25519CallbackJsunit', function () {
        /**
         * @tc.name   Security_HUKS_SignVerify_API9_ED25519_001
         * @tc.number Security_HUKS_SignVerify_API9_ED25519_001
         * @tc.desc   Security_HUKS_SignVerify_API9_ED25519_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_ED25519_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyED25519Size256SIGNKeyAlias001';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData63Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData63Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeVERIFY,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData63Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API9_ED25519_002
         * @tc.number Security_HUKS_SignVerify_API9_ED25519_002
         * @tc.desc   Security_HUKS_SignVerify_API9_ED25519_002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_ED25519_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyED25519Size256SIGNKeyAlias002';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData63Kb,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData63Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API9_ED25519_003
         * @tc.number Security_HUKS_SignVerify_API9_ED25519_003
         * @tc.desc   Security_HUKS_SignVerify_API9_ED25519_003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_ED25519_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyED25519Size256SIGNKeyAlias003';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeVERIFY,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'finish', false, srcData65Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API9_ED25519_004
         * @tc.number Security_HUKS_SignVerify_API9_ED25519_004
         * @tc.desc   Security_HUKS_SignVerify_API9_ED25519_004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API9_ED25519_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlies = 'testSignVerifyED25519Size256SIGNKeyAlias004';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData65Kb,
            };
            await publicSignVerifyFunc(srcKeyAlies, HuksOptions, 'abort', true, srcData63Kb);
            done();
        });
    });
}
