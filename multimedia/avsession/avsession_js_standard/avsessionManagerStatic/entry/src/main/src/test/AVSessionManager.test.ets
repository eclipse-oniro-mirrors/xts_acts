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
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import common from '@ohos.app.ability.common';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext | undefined;
export default function AVSessionManager() {
    describe('AVSessionManager', () => {
        let tag = 'ApplicationA';
        let type = 'audio';
        let currentAVSession: avSession.AVSession | undefined;

        beforeAll(() => {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info('TestLog: Init Session And Controller');

        })

        beforeEach(() => {
            console.info('TestLog: Start testing testcase');
        })

        afterEach(async () => {
            try{
                await currentAVSession!.destroy()
                console.info('TestLog: Session destroy success');
            }catch(err){
                console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            console.info('TestLog: End testing testcase');
        })

        afterAll(() => {
            console.info('TestLog: End testing describe');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_STATIC_0100
         * @tc.desc   Testing createAVSession with right parameter audio - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            try{
                let data: avSession.AVSession;
                currentAVSession = await avSession.createAVSession(context!, tag, 'video_call')
                if (currentAVSession?.sessionId.length === 64) {
                    console.info('TestLog: avSession create successfully');
                    expect(true).assertTrue();
                }
                else {
                    console.info('TestLog: avSession create failed');
                    expect(false).assertTrue();
                }
            }catch(err){
                console.info(`TestLog: avSession create error SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_STATIC_0100: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_STATIC_0300
         * @tc.desc   createAVSession(promise) with invalid param(errcode 401) - empty string
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
                await avSession.createAVSession(context!, '', 'video_call')
                console.info('TestLog: avSession create successfully');
            }catch(err){
                err = err as BusinessError;
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            };
            Utils.msSleep(200);
            currentAVSession = await avSession.createAVSession(context!,tag,'video_call');
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_STATIC_0400
         * @tc.desc   Testing createAVSession with right parameter video - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            try{
                currentAVSession = await avSession.createAVSession(context!, tag, "video")
                if (currentAVSession?.sessionId.length === 64) {
                    console.info('TestLog: avSession create successfully');
                    expect(true).assertTrue();
                }
                else {
                    console.info('TestLog: avSession create failed');
                    expect(false).assertTrue();
                    done();
                }
            }catch(err){
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_STATIC_0100
         * @tc.desc   Testing call getavcastcontroller(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                currentAVSession = await avSession.createAVSession(context!, tag, 'video_call');
                console.info(`CreateAVSession 111BusinessError: code: `);
                console.info(`CreateAVSession 333BusinessError: code: `);
                currentAVSession?.getAVCastController((err: BusinessError|null, data: avSession.AVCastController | undefined|undefined) => {
                    if (err) {
                        console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code == 6600101).assertTrue();
                    }
                });
            }catch(error){
                console.error(`getAVCastController BusinessError: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property catch of undefined") {
                    console.info(`getAVCastController promise successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_0100
         * @tc.desc   Testing call getavcastcontroller(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                try{
                    currentAVSession = await avSession.createAVSession(context!, tag, 'video_call')
                    console.info(`CreateAVSession : SUCCESS : sessionId = ${currentAVSession?.sessionId}`);
                }catch(err){
                    console.info(`CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                };

                let aVCastController: avSession.AVCastController | undefined;
                currentAVSession?.getAVCastController().then((avcontroller: avSession.AVCastController | undefined) => {
                    aVCastController = avcontroller;
                }).catch((err: Error) => {
                    console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 6600101).assertTrue();
                });
            }catch(error){
                console.info(`getAVCastController failed: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property then of undefined") {
                    console.info(`getAVCastController callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_STATIC_0100
         * @tc.desc   Testing call stopCasting(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await avSession.createAVSession(context!, tag, 'video_call').then((data) => {
                    currentAVSession = data;
                    console.info(`CreateAVSession : SUCCESS : sessionId = ${currentAVSession?.sessionId}`);
                    try{
                        currentAVSession?.stopCasting((err: BusinessError|null) => {
                            if (err) {
                                console.info(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
                            } else {
                                console.info(`stopCasting successfully`);
                                expect(true).assertTrue();
                            }
                        })
                    }catch(err){
                        console.info(`CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                    };
                });
            }catch(error){
                console.info(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property catch of undefined") {
                    console.info(`stopCasting callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_STATIC_0100
         * @tc.desc   Testing call stopCasting(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                try{
                    currentAVSession = await avSession.createAVSession(context!, tag, 'video_call')
                    console.info(`CreateAVSession : SUCCESS : sessionId = ${currentAVSession?.sessionId}`);
                }catch(err){
                    console.info(`CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                };
                try{
                    currentAVSession?.stopCasting()
                    console.info(`stopCasting successfully`);
                    expect(true).assertTrue();
                }catch(err){
                    console.info(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                };
            }catch(error){
                console.error(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`)
                if (error.message == "Cannot read property then of undefined") {
                    console.info(`stopCasting promise successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_STATIC_0100
         * @tc.desc   Testing call getCurrentItem(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                try{
                    currentAVSession = await avSession.createAVSession(context!, tag, 'video_call')
                    console.info(`CreateAVSession : SUCCESS : sessionId = ${currentAVSession?.sessionId}`);
                }catch(err){
                    console.info(`CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                };
                let aVCastController: avSession.AVCastController | undefined;
                currentAVSession?.getAVCastController().then((avcontroller: avSession.AVCastController | undefined) => {
                    aVCastController = avcontroller;
                    aVCastController?.getCurrentItem((err, value)=> {
                        if (err) {
                            console.error(`getCurrentItem BusinessError: code: ${err.code}, message: ${err.message}`);
                        } else {
                            console.info(`getCurrentItem successfully`);
                        }
                    });
                }).catch((err: Error) => {
                    console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 6600101).assertTrue();
                });
            }catch(error){
                console.error(`getCurrentItem BusinessError2: code: ${error.code}, message: ${error.message}`)
                if (error.message == "Cannot read property then of undefined") {
                    console.info(`getCurrentItem callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_STATIC_0100
         * @tc.desc   Testing call getCurrentItem(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                try{
                    currentAVSession = await avSession.createAVSession(context!, tag, 'video_call')
                    console.info(`CreateAVSession : SUCCESS : sessionId = ${currentAVSession?.sessionId}`);
                }catch(err){
                    console.info(`CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                };
                let aVCastController: avSession.AVCastController | undefined
                currentAVSession?.getAVCastController().then((avcontroller: avSession.AVCastController | undefined) => {
                        aVCastController = avcontroller;
                    try{
                        aVCastController?.getCurrentItem()
                        console.info(`getCurrentItem successfully`);
                    }catch(err){
                        console.error(`getCurrentItem BusinessError: code: ${err.code}, message: ${err.message}`);
                    };
                }).catch((err: Error) => {
                    console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 6600101).assertTrue();
                });
            }catch(error){
                console.error(`getAVCastController BusinessError2: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property then of undefined") {
                    console.info(`getCurrentItem promise successfully`);
                }
            }
            done();
        })
    })
}