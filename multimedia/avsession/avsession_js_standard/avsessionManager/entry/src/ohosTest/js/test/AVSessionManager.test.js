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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import featureAbility from '@ohos.ability.featureAbility';

export default function AVSessionManager() {
    describe('AVSessionManager', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let currentAVSession;
        let context = featureAbility.getContext();

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        beforeAll(function () {
            console.info('TestLog: Init Session And Controller');

        })

        beforeEach(function () {
            console.info('TestLog: Start testing testcase');
        })

        afterEach(async function () {
            await currentAVSession.destroy().then(() => {
                console.info('TestLog: Session destroy success');  
            }).catch((err) => {
                console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            console.info('TestLog: End testing testcase');
        })

        afterAll(function () {
            console.info('TestLog: End testing describe');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0100
         * @tc.desc   Testing createAVSession with right parameter audio - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0100]";
            await avSession.createAVSession(context, tag, "audio").then((data) => {
                currentAVSession = data;
                console.info(`${TAG}TestLog: avSession create successfully:length = ${currentAVSession.sessionId.length}`);
                expect(currentAVSession.sessionId.length).assertEqual(64);
                
            }).catch((err) => {
                console.info(`${TAG}TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })


        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0200
         * @tc.desc   test createAVSession(promise) errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await avSession.createAVSession(context, tag, 'aaa').then((data) => {
                console.info('TestLog: avSession create successfully');
            }).catch((err) => {
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            sleep(200);
            currentAVSession = await avSession.createAVSession(context,tag,"audio");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0300
         * @tc.desc   test createAVSession(promise) errcode 401
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            await avSession.createAVSession(context, '', type).then((data) => {
                console.info('TestLog: avSession create successfully');
            }).catch((err) => {
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            sleep(200);
            currentAVSession = await avSession.createAVSession(context,tag,"audio");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0400
         * @tc.desc   Testing createAVSession with right parameter video - promise
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0400]";
            await avSession.createAVSession(context, tag, "video").then((data) => {
                currentAVSession = data;
                console.info(`${TAG}TestLog: avSession create successfully:length = ${currentAVSession.sessionId.length}`);
                expect(currentAVSession.sessionId.length).assertEqual(64);    
            }).catch((err) => {
                console.info(`${TAG}TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            });
            done();
        })



        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_0100
         * @tc.desc   Testing call getavcastcontroller(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_0100]";
            try {
                await avSession.createAVSession(context, tag, "audio").then((data) => {
                    currentAVSession = data;
                    console.info(`${TAG}CreateAVSession : SUCCESS : sessionId = ${currentAVSession.sessionId}`);
                }).catch((err) => {
                    console.info(`${TAG}CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                });

                let aVCastController;
                currentAVSession.getAVCastController().then((avcontroller) => {
                    aVCastController = avcontroller;
                    console.info(`${TAG}getAVCastController : SUCCESS : sessionid : ${aVCastController.sessionId}`);
                }).catch(async(err) => {
                    console.error(`${TAG}getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 6600109).assertTrue();
                });
            } catch (error) {
                console.info(`${TAG}getAVCastController failed: code: ${error.code}, message: ${error.message}`);
                console.info(`${TAG}getAVCastController callback successfully`);
                expect(error.message).assertEqual("Cannot read property then of undefined");
                
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_0100
         * @tc.desc   Testing call getavcastcontroller(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_0100]"
            try {
                currentAVSession = await avSession.createAVSession(context, tag, "audio");
                console.info(`${TAG}CreateAVSession 111BusinessError: code: `);
                let aVCastController;
                console.info(`${TAG}CreateAVSession 333BusinessError: code: `);
                aVCastController = await currentAVSession.getAVCastController(async(err, data) => {
                    if (err) {
                        console.error(`${TAG}getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                        expect(err.code == 6600109).assertTrue();
                    }
                });
            } catch (error) {
                console.error(`${TAG}getAVCastController BusinessError: code: ${error.code}, message: ${error.message}`);
                console.info(`${TAG}getAVCastController promise successfully`);
                expect(error.message).assertEqual("Cannot read property catch of undefined");
                
            }
            done();
        })



        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_0100
         * @tc.desc   Testing call stopCasting(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_0100]";
            try {
                await avSession.createAVSession(context, tag, "audio").then((data) => {
                    currentAVSession = data;
                    console.info(`${TAG}CreateAVSession : SUCCESS : sessionId = ${currentAVSession.sessionId}`);
                    currentAVSession.stopCasting(function (err) {
                        if (err) {
                            console.info(`${TAG}stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
                        } else {
                            console.info(`${TAG}stopCasting successfully`);
                        }
                    }).catch((err) => {
                        console.info(`${TAG}CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                    });

                });
            } catch (error) {
                console.info(`${TAG}stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
                console.info(`${TAG}stopCasting callback successfully`);
                expect(error.message).assertEqual("Cannot read property catch of undefined");

            }
            done();
        })
        
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_0100
         * @tc.desc   Testing call stopCasting(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_0100]";
            try {
                await avSession.createAVSession(context, tag, "audio").then((data) => {
                    currentAVSession = data;
                    console.info(`${TAG}CreateAVSession : SUCCESS : sessionId = ${currentAVSession.sessionId}`);
                }).catch((err) => {
                    console.info(`${TAG}CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                });
                currentAVSession.stopCasting().then(() => {
                    console.info(`${TAG}stopCasting successfully`);
                }).catch((err) => {
                    console.info(`${TAG}stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                });
            } catch (error) {
                console.error(`${TAG}stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`)
                console.info(`${TAG}stopCasting promise successfully`);
                expect(error.message).assertEqual("Cannot read property then of undefined");
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_0100
         * @tc.desc   Testing call getCurrentItem(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_0100]";
            try {
                await avSession.createAVSession(context, tag, "audio").then((data) => {
                    currentAVSession = data;
                    console.info(`${TAG}CreateAVSession : SUCCESS : sessionId = ${currentAVSession.sessionId}`);
                }).catch((err) => {
                    console.info(`${TAG}CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                });
                let aVCastController;
                currentAVSession.getAVCastController().then((avcontroller) => {
                    aVCastController = avcontroller;
                    console.info(`${TAG}getAVCastController : SUCCESS : sessionid : ${aVCastController.sessionId}`);
                    aVCastController.getCurrentItem(function (err, value) {
                        if (err) {
                            console.error(`${TAG}getCurrentItem BusinessError: code: ${err.code}, message: ${err.message}`);
                        } else {
                            console.info(`${TAG}getCurrentItem successfully`);
                        }
                    });
                }).catch(async(err) => {
                    console.error(`${TAG}getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 6600109).assertTrue();
                });
            } catch (error) {
                console.error(`${TAG}getCurrentItem BusinessError2: code: ${error.code}, message: ${error.message}`)
                console.info(`${TAG}getCurrentItem callback successfully`);
                expect(error.message).assertEqual("Cannot read property then of undefined");
                
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_0100
         * @tc.desc   Testing call getCurrentItem(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let TAG = "[SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_0100]";
            try {
                await avSession.createAVSession(context, tag, "audio").then((data) => {
                    currentAVSession = data;
                    console.info(`${TAG}CreateAVSession : SUCCESS : sessionId = ${currentAVSession.sessionId}`);
                }).catch((err) => {
                    console.info(`${TAG}CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                });
                let aVCastController;
                currentAVSession.getAVCastController().then((avcontroller) => {
                    aVCastController = avcontroller;
                    console.info(`${TAG}getAVCastController : SUCCESS : sessionid : ${aVCastController.sessionId}`);
                    aVCastController.getCurrentItem().then((AVQueueItem) => {
                        console.info(`${TAG}getCurrentItem successfully`);
                    }).catch((err) => {
                        console.error(`${TAG}getCurrentItem BusinessError: code: ${err.code}, message: ${err.message}`);
                    });
                }).catch(async(err) => {
                    console.error(`${TAG}getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 6600109).assertTrue();
                });
            } catch (error) {
                console.error(`${TAG}getAVCastController BusinessError2: code: ${error.code}, message: ${error.message}`);
                console.info(`${TAG}getCurrentItem promise successfully`);
                expect(error.message).assertEqual("Cannot read property then of undefined");

            }
            done();
        })
    })
}