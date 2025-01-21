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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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
            await sleep(5000);
            if (currentAVSession){
                await currentAVSession.destroy();
            }
            console.info('TestLog: End testing testcase');
        })

        afterAll(function () {
            console.info('TestLog: End testing describe');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0100
         * @tc.name      : create AVSession(audio) - promise
         * @tc.desc      : Testing createAVSession with right parameter audio - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0100', 0, async function (done) {
            await avSession.createAVSession(context, tag, "audio").then((data) => {
                currentAVSession = data;
                if (currentAVSession.sessionId.length === 64) {
                    console.info('TestLog: avSession create successfully');
                    expect(true).assertTrue();
                }
                else {
                    console.info('TestLog: avSession create failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })
        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0200
         * @tc.name      : createAVSession(promise) with invalid param(errcode 401) - invalid value
         * @tc.desc      : test createAVSession(promise) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0200', 0, async function (done) {
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

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0300
         * @tc.name      : createAVSession(promise) with invalid param(errcode 401) - empty string
         * @tc.desc      : test createAVSession(promise) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0300', 0, async function (done) {
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

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0400
         * @tc.name      : create AVSession(video) - promise
         * @tc.desc      : Testing createAVSession with right parameter video - promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0400', 0, async function (done) {
            await avSession.createAVSession(context, tag, "video").then((data) => {
                currentAVSession = data;
                if (currentAVSession.sessionId.length === 64) {
                    console.info('TestLog: avSession create successfully');
                    expect(true).assertTrue();
                }
                else {
                    console.info('TestLog: avSession create failed');
                    expect(false).assertTrue();
                }
            }).catch((err) => {
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            done();
        })



        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_0100
         * @tc.name      : getavcastcontroller - callback
         * @tc.desc      : Testing call getavcastcontroller(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_0100', 0, async function (done) {
            try {
                await avSession.createAVSession(context, tag, "audio").then((data) => {
                    currentAVSession = data;
                    console.info(`CreateAVSession : SUCCESS : sessionId = ${currentAVSession.sessionId}`);
                }).catch((err) => {
                    console.info(`CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                });

                let aVCastController;
                currentAVSession.getAVCastController().then((avcontroller) => {
                    aVCastController = avcontroller;
                    console.info(`getAVCastController : SUCCESS : sessionid : ${aVCastController.sessionId}`);
                }).catch(async(err) => {
                    console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 6600101).assertTrue();
                });
            } catch (error) {
                console.info(`getAVCastController failed: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property then of undefined") {
                    console.info(`getAVCastController callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_0100
         * @tc.name      : getavcastcontroller - promise
         * @tc.desc      : Testing call getavcastcontroller(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_0100', 0, async function (done) {
            try {
                currentAVSession = await avSession.createAVSession(context, tag, "audio");
                console.info(`CreateAVSession 111BusinessError: code: `);
                let aVCastController;
                console.info(`CreateAVSession 333BusinessError: code: `);
                aVCastController = await currentAVSession.getAVCastController(async(err, data) => {
                    if (err) {
                        console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                        expect(err.code == 6600101).assertTrue();
                    }
                });
            } catch (error) {
                console.error(`getAVCastController BusinessError: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property catch of undefined") {
                    console.info(`getAVCastController promise successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })



        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_0100
         * @tc.name      : stopCasting - callback
         * @tc.desc      : Testing call stopCasting(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_0100', 0, async function (done) {
            try {
                await avSession.createAVSession(context, tag, "audio").then((data) => {
                    currentAVSession = data;
                    console.info(`CreateAVSession : SUCCESS : sessionId = ${currentAVSession.sessionId}`);
                    currentAVSession.stopCasting(function (err) {
                        if (err) {
                            console.info(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
                        } else {
                            console.info(`stopCasting successfully`);
                            expect(true).assertTrue();
                        }
                    }).catch((err) => {
                        console.info(`CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                    });

                });
            } catch (error) {
                console.info(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property catch of undefined") {
                    console.info(`stopCasting callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })
        
        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_0100
         * @tc.name      : stopCasting - promise
         * @tc.desc      : Testing call stopCasting(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_0100', 0, async function (done) {
            try {
                await avSession.createAVSession(context, tag, "audio").then((data) => {
                    currentAVSession = data;
                    console.info(`CreateAVSession : SUCCESS : sessionId = ${currentAVSession.sessionId}`);
                }).catch((err) => {
                    console.info(`CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                });
                currentAVSession.stopCasting().then(() => {
                    console.info(`stopCasting successfully`);
                    expect(true).assertTrue();
                }).catch((err) => {
                    console.info(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                });
            } catch (error) {
                console.error(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`)
                if (error.message == "Cannot read property then of undefined") {
                    console.info(`stopCasting promise successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_0100
         * @tc.name      : getCurrentItem - callback
         * @tc.desc      : Testing call getCurrentItem(callback)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_0100', 0, async function (done) {
            try {
                await avSession.createAVSession(context, tag, "audio").then((data) => {
                    currentAVSession = data;
                    console.info(`CreateAVSession : SUCCESS : sessionId = ${currentAVSession.sessionId}`);
                }).catch((err) => {
                    console.info(`CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                });
                let aVCastController;
                currentAVSession.getAVCastController().then((avcontroller) => {
                    aVCastController = avcontroller;
                    console.info(`getAVCastController : SUCCESS : sessionid : ${aVCastController.sessionId}`);
                    aVCastController.getCurrentItem(function (err, value) {
                        if (err) {
                            console.error(`getCurrentItem BusinessError: code: ${err.code}, message: ${err.message}`);
                        } else {
                            console.info(`getCurrentItem successfully`);
                        }
                    });
                }).catch(async(err) => {
                    console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 6600101).assertTrue();
                });
            } catch (error) {
                console.error(`getCurrentItem BusinessError2: code: ${error.code}, message: ${error.message}`)
                if (error.message == "Cannot read property then of undefined") {
                    console.info(`getCurrentItem callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_0100
         * @tc.name      : getCurrentItem - promise
         * @tc.desc      : Testing call getCurrentItem(promise)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_0100', 0, async function (done) {
            try {
                await avSession.createAVSession(context, tag, "audio").then((data) => {
                    currentAVSession = data;
                    console.info(`CreateAVSession : SUCCESS : sessionId = ${currentAVSession.sessionId}`);
                }).catch((err) => {
                    console.info(`CreateAVSession BusinessError: code: ${err.code}, message: ${err.message}`);
                });
                let aVCastController;
                currentAVSession.getAVCastController().then((avcontroller) => {
                    aVCastController = avcontroller;
                    console.info(`getAVCastController : SUCCESS : sessionid : ${aVCastController.sessionId}`);
                    aVCastController.getCurrentItem().then((AVQueueItem) => {
                        console.info(`getCurrentItem successfully`);
                    }).catch((err) => {
                        console.error(`getCurrentItem BusinessError: code: ${err.code}, message: ${err.message}`);
                    });
                }).catch(async(err) => {
                    console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code == 6600101).assertTrue();
                });
            } catch (error) {
                console.error(`getAVCastController BusinessError2: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property then of undefined") {
                    console.info(`getCurrentItem promise successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })
    })
}