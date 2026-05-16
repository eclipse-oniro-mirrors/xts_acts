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
import { publicSignVerifyFunc } from './utils/param/signVerify/publicSignVerifyPromise';

let srcData63 = Data.Data_63KB;
let srcData63Kb = stringToUint8Array(srcData63);
let srcData65 = Data.Data_65KB;
let srcData65Kb = stringToUint8Array(srcData65);
let finishOutData;
let srcData63B = Data.data63B;
let srcData63Byte = stringToUint8Array(srcData63B);
let srcData65B = Data.data65B;
let srcData65Byte = stringToUint8Array(srcData65B);
let baseHuksOptions1 = {};
let baseHuksOptions2 = {};

async function resetOptions() {
    baseHuksOptions1 = {
        properties: new Array(
            HuksSignVerifyED25519.HuksKeyAlgED25519,
            HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
            HuksSignVerifyED25519.HuksKeyED25519Size256,
            HuksSignVerifyED25519.HuksTagDigestSHA1
        ),
    };
    baseHuksOptions2 = {
        properties: new Array(
            HuksSignVerifyED25519.HuksKeyAlgED25519,
            HuksSignVerifyED25519.HuksKeyED25519PurposeVERIFY,
            HuksSignVerifyED25519.HuksKeyED25519Size256,
            HuksSignVerifyED25519.HuksTagDigestSHA1
        ),
    };
}

export default function SecurityHuksSignVerifyED25519PromiseJsunit() {
    describe('SecurityHuksSignVerifyED25519PromiseJsunit', function () {
        beforeEach(function () {
            resetOptions();
        });
        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ED_25519101
         * @tc.number Security_HUKS_SignVerify_API8_ED_25519101
         * @tc.desc   Security_HUKS_SignVerify_API8_ED_25519101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED_25519101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias101';
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
         * @tc.name   Security_HUKS_SignVerify_API8_ED_25519102
         * @tc.number Security_HUKS_SignVerify_API8_ED_25519102
         * @tc.desc   Security_HUKS_SignVerify_API8_ED_25519102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED_25519102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias102';
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
         * @tc.name   Security_HUKS_SignVerify_API8_ED_25519103
         * @tc.number Security_HUKS_SignVerify_API8_ED_25519103
         * @tc.desc   Security_HUKS_SignVerify_API8_ED_25519103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED_25519103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias103';
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
         * @tc.name   Security_HUKS_SignVerify_API8_ED_25519104
         * @tc.number Security_HUKS_SignVerify_API8_ED_25519104
         * @tc.desc   Security_HUKS_SignVerify_API8_ED_25519104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED_25519104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias104';
            let HuksOptions = {
                properties: new Array(
                    HuksSignVerifyED25519.HuksKeyAlgED25519,
                    HuksSignVerifyED25519.HuksKeyED25519PurposeSIGN,
                    HuksSignVerifyED25519.HuksKeyED25519Size256,
                    HuksSignVerifyED25519.HuksTagDigestSHA1
                ),
                inData: srcData65Kb,
            };
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, true, srcData65Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_101
         * @tc.number Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_101
         * @tc.desc   Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_101
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias101';
            let HuksOptions = makeOptions(baseHuksOptions1, 4, [], srcData63Kb);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, true, srcData63Kb);
            HuksOptions = makeOptions(baseHuksOptions2, 4, [], finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, true, srcData63Kb);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_102
         * @tc.number Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_102
         * @tc.desc   Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias102';
            let HuksOptions = makeOptions(baseHuksOptions1, 4, [], srcData63Byte);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, false, srcData63Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_103
         * @tc.number Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_103
         * @tc.desc   Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias103';
            let HuksOptions = makeOptions(baseHuksOptions1, 4, [], srcData65Byte);
            finishOutData = await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', true, false, srcData65Byte);
            HuksOptions = makeOptions(baseHuksOptions2, 4, [], finishOutData);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'finish', false, false, srcData65Byte);
            done();
        });

        /**
         * @tc.name   Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_104
         * @tc.number Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_104
         * @tc.desc   Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_104
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('Security_HUKS_SignVerify_API8_ED25519_Size256SIGN_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function (done) {
            const srcKeyAlias = 'testSignVerifyED25519Size256SIGNKeyAlias104';
            let HuksOptions = makeOptions(baseHuksOptions1, 4, [], srcData65Byte);
            await publicSignVerifyFunc(srcKeyAlias, HuksOptions, 'abort', true, false, srcData65Byte);
            done();
        });
    });
}
