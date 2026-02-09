/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext | undefined;
export default function abilityTest() {
    describe('AVSessionManagerCallback', () => {
        console.info('TestLog: SAVSessionManagerCallback 1');
        let tag = 'ApplicationA';
        let type = 'audio';

        console.info('TestLog: SAVSessionManagerCallback 2');
        beforeAll(() => {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info('TestLog: Start Testing AVSessionManager Interfaces');
        })

        beforeEach(() => {
            console.info('TestLog: Start testing testcase');
        })

        afterEach(async (): Promise<void> => {
            console.info('TestLog: End testing testcase');
            await Utils.msSleep(1000);
        })

        afterAll(() => {
            console.info('TestLog: End Testing AVSessionManager Interfaces');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_STATIC_0100
         * @tc.desc   Testing createAVSession with right parameter audio - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let session: avSession.AVSession | null = null;
            avSession.createAVSession(context!, tag, 'audio', (err , value) => {
                if (err?.code) {
                    console.info(`TestLog: AVSession created error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue()
                } else if (value?.sessionId.length === 64){
                    session = value!;
                    console.info(`TestLog: AVSession :${session!.sessionId}created successfully`);
                    expect(true).assertTrue()
                } else {
                    console.info('TestLog: AVSession created failed');
                    expect(false).assertTrue();
                }
            });
            await Utils.msSleep(500);
            try{
                console.info('TestLog: Session 1');
                await session!.destroy()
                console.info('TestLog: Session Destroy SUCCESS');
                console.info(`TestLog: AVSession :${session!.sessionId}destroyed successfully`);
            }catch(err){
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_STATIC_0300
         * @tc.desc   createAVSession(callback) with invalid param(errcode 401) - empty string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            avSession.createAVSession(context!, '', 'audio', (err, data) => {
                if (err) {
                    console.info(`TestLog: AVSession created error: code: ${err.code}, message: ${err.message}`);
                    expect(err?.code).assertEqual(401);
                } else {
                    console.info(`TestLog: AVSession ${data?.sessionId} created successfully`);
                    expect(false).assertTrue();
                }
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_STATIC_0400
         * @tc.desc   Testing createAVSession with right parameter video - callback
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_CALLBACK_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let session: avSession.AVSession|undefined;
            avSession.createAVSession(context!, tag, "video", (err, value) => {
                if (err?.code) {
                    console.info(`TestLog: AVSession created error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue()
                } else if (value?.sessionId.length === 64){
                    session = value;
                    console.info(`TestLog: AVSession :${session?.sessionId}created successfully`);
                } else {
                    console.info('TestLog: AVSession created failed');
                    expect(false).assertTrue();
                }
            });
            await Utils.msSleep(500);
            try{
                await session!.destroy()
                console.info('TestLog: Session Destroy SUCCESS');
                console.info(`TestLog: AVSession :${session?.sessionId}destroyed successfully`);
            }catch(err){
                console.info(`TestLog: Session Destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })
    })
}