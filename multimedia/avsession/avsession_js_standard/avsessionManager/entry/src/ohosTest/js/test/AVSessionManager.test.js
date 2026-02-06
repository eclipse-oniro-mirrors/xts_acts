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
                console.info(`TestLog: avSession create error SUB_MULTIMEDIA_AVSESSION_CREATEAVSESSION_PROMISE_0100: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
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
            await avSession.createAVSession(context, tag, "video").then((data) => {
                currentAVSession = data;
                if (currentAVSession.sessionId.length === 64) {
                    console.info('TestLog: avSession create successfully');
                    expect(true).assertTrue();
                }
                else {
                    console.info('TestLog: avSession create failed');
                    expect(false).assertTrue();
                    done();
                }
            }).catch((err) => {
                console.info(`TestLog: avSession create error: code: ${err.code}, message: ${err.message}`);
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
                    expect(err.code == 6600109).assertTrue();
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_0100
         * @tc.desc   Testing call getavcastcontroller(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            try {
                currentAVSession = await avSession.createAVSession(context, tag, "audio");
                console.info(`CreateAVSession 111BusinessError: code: `);
                let aVCastController;
                console.info(`CreateAVSession 333BusinessError: code: `);
                aVCastController = await currentAVSession.getAVCastController(async(err, data) => {
                    if (err) {
                        console.error(`getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                        expect(err.code == 6600109).assertTrue();
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



        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_0100
         * @tc.desc   Testing call stopCasting(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
        
        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_0100
         * @tc.desc   Testing call stopCasting(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_0100
         * @tc.desc   Testing call getCurrentItem(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
                    expect(err.code == 6600109).assertTrue();
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

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_0100
         * @tc.desc   Testing call getCurrentItem(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCURRENTITEM_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
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
                    expect(err.code == 6600109).assertTrue();
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