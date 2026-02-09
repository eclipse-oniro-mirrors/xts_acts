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
import { beforeEach, describe, it, Level, Size, TestType } from '@ohos/hypium';
import Data from './utils/common/data';
import { HuksSignVerifyED25519 } from './utils/param/signVerify/publicSignVerifyParam';
import { makeOptions, stringToUint8Array } from './utils/param/publicFunc.js';
import { publicSignVerifyFunc } from './utils/param/signVerify/publicSignVerifyCallback';

let srcData63 = Data.Data_63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data_65KB;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;
let baseHuksOptionsSign = {};
let baseHuksOptionsVerify = {};

async function resetOptions() {
    baseHuksOptionsSign = {
        properties: new Array(
            HuksSignVerifyED25519.HuksKeyAlgED25519,
            HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
            HuksSignVerifyED25519.HuksKeyED25519Size256,
            HuksSignVerifyED25519.HuksTagDigestSHA1
        ),
        inData: new Array(),
    };
    baseHuksOptionsVerify = {
        properties: new Array(
            HuksSignVerifyED25519.HuksKeyAlgED25519,
            HuksSignVerifyED25519.HuksKeyED25519PurposeVERIFY,
            HuksSignVerifyED25519.HuksKeyED25519Size256,
            HuksSignVerifyED25519.HuksTagDigestSHA1
        ),
        inData: new Array(),
    };
}

export default function SecurityHuksSignVerifyED25519CallbackJsunit() {
    describe('SecurityHuksSignVerifyED25519CallbackJsunit', function () {
        beforeEach(function () {
            resetOptions();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ED_25519001
         * @tc.number Security_HUKS_SignVerify_API8_ED_25519001
         * @tc.desc   Security_HUKS_SignVerify_API8_ED_25519001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED_25519001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias001';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData63Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63Kb);

            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeVERIFY,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ED_25519002
         * @tc.number Security_HUKS_SignVerify_API8_ED_25519002
         * @tc.desc   Security_HUKS_SignVerify_API8_ED_25519002
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED_25519002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias002';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData63Kb,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ED_25519003
         * @tc.number Security_HUKS_SignVerify_API8_ED_25519003
         * @tc.desc   Security_HUKS_SignVerify_API8_ED_25519003
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED_25519003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias003';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData65Kb,
            };
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData65Kb);
            HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeVERIFY,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: finishOutData,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData65Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ED_25519004
         * @tc.number Security_HUKS_SignVerify_API8_ED_25519004
         * @tc.desc   Security_HUKS_SignVerify_API8_ED_25519004
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED_25519004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias004';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData65Kb,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData63Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_001
         * @tc.number Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_001
         * @tc.desc   Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_001
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias001';
            let HuksOptions = makeOptions(baseHuksOptionsSign, 4, [], srcData63Kb);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63Kb);
            await resetOptions();
            HuksOptions = makeOptions(baseHuksOptionsVerify, 4, [], finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63Kb);
            done();
        });
    });
}
