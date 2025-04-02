/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import avSession from '@ohos.multimedia.avsession';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import featureAbility from '@ohos.ability.featureAbility';

export default function AVSessionManagerCallback() {
    describe('AVSessionManagerCallback', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let context = featureAbility.getContext();

        function sleep (ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing AVSessionManager Interfaces');
        })

        beforeEach(function () {
            console.info('TestLog: Start testing testcase');
        })

        afterEach(async function (done) {
            console.info('TestLog: End testing testcase');
            await sleep(1000);
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing AVSessionManager Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0100
         * @tc.name      : create AVSession(audio) - callback
         * @tc.desc      : Testing createAVSession with right parameter audio - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0100', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, "audio", (err, value) => {
                if (err) {
                    console.info(`TestLog: AVSession created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue()
                } else if (value.sessionId.length === 64){
                    session = value;
                    console.info(`TestLog: AVSession :${session.sessionId}created successfully`);
                    expect(true).assertTrue()
                } else {
                    console.info('TestLog: AVSession created failed');
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
                console.info(`TestLog: AVSession :${session.sessionId}destroyed successfully`);
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0200
         * @tc.name      : createAVSession(callback) with invalid param(errcode 401) - invalid value
         * @tc.desc      : test createAVSession(callback) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0200', 0, async function (done) {
            avSession.createAVSession(context, tag, 'aaa', (err, data) => {
                if (err) {
                    console.info(`TestLog: AVSession created error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(401);
                } else {
                    console.info(`TestLog: AVSession ${data.sessionId} created successfully`);
                    expect(false).assertTrue();
                }
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0300
         * @tc.name      : createAVSession(callback) with invalid param(errcode 401) - empty string
         * @tc.desc      : test createAVSession(callback) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0300', 0, async function (done) {
            avSession.createAVSession(context, '', type, (err, data) => {
                if (err) {
                    console.info(`TestLog: AVSession created error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(401);
                } else {
                    console.info(`TestLog: AVSession ${data.sessionId} created successfully`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0400
         * @tc.name      : create AVSession(video) - callback
         * @tc.desc      : Testing createAVSession with right parameter video - callback
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_0400', 0, async function (done) {
            let session;
            avSession.createAVSession(context, tag, "video", (err, value) => {
                if (err) {
                    console.info(`TestLog: AVSession created error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue()
                } else if (value.sessionId.length === 64){
                    session = value;
                    console.info(`TestLog: AVSession :${session.sessionId}created successfully`);
                    expect(true).assertTrue()
                } else {
                    console.info('TestLog: AVSession created failed');
                    expect(false).assertTrue();
                }
            });
            await sleep(500);
            await session.destroy().then(() => {
                console.info('TestLog: Session Destroy SUCCESS');
                console.info(`TestLog: AVSession :${session.sessionId}destroyed successfully`);
            }).catch((err) => {
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })
    })
}