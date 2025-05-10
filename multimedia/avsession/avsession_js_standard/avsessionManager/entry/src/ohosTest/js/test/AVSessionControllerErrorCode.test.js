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

export default function AVSessionControllerErrorCode() {
    describe('AVSessionControllerErrorCode', function () {
        let tag = 'ApplicationA';
        let type = 'audio';
        let session;
        let controller;
        let keyItem = { code: 0x49, pressedTime: 123456789, deviceId: 0 };
        let event = { action: 2, key: keyItem, keys: [keyItem] };
        let errEvent = { action: 3, key: keyItem, keys: [keyItem] };
        const COMMON_COMMAND_STRING = "common_command";
		const COMMON_COMMAND_PARAMS = {
			command: "This is my command"
		};
        const QUEUE_ITEM_ID = 666;
        const INVALID_STRING = "invalid string";
        let context = featureAbility.getContext();

        function sleep(ms) {
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        async function invalidSession(validFunc) {
            await session.destroy().then(async () => {
                console.info('TestLog: session destroy success');
                await validFunc();
                session = null;
            }).catch(err => {
                console.info(`TestLog: session destroy error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            })
        }

        async function invalidSessionState(validFunc) {
            await session.deactivate().then(async () => {
                console.info('TestLog: session deactivate success');
                await validFunc();
            }).catch(err => {
                console.info(`TestLog: session deactivate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            })
        }

        async function invalidController(validFunc) {
            await controller.destroy().then(async () => {
                console.info('TestLog: controller destroy success');
                await validFunc();
                controller = null;
            }).catch(err => {
                console.info(`TestLog: controller destroy error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            })
        }

        function callback1() { }
        function callback2() { }

        function offCallbackInvalidParam(eventName) {
            try {
                controller.off(eventName, callback1, callback2);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(401);
            }
        }

        async function offCallbackInvalidController(eventName) {
			await invalidController(() => {
                try {
                    controller.off(eventName);
                    expect().assertFail();
                } catch (error) {
                    expect(error.code).assertEqual(6600103);
                }
            });
		}

        async function offCallbackInvalidSession(eventName) {
            await invalidSession(() => {
                try {
                    session.off(eventName)
                    expect().assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(6600102);
                }
            });
        }

        async function onCallbackInvalidSession(eventName) {
            await invalidSession(() => {
                try {
                    session.on(eventName, callback1);
                    expect().assertFail();
                } catch (err) {
                    expect(err.code).assertEqual(6600102);
                }
            });
        }

        async function onCallbackInvalidController(eventName) {
			await invalidController(() => {
                try {
                    controller.on(eventName, callback1);
                    expect().assertFail();
                } catch (error) {
                    expect(error.code).assertEqual(6600103);
                }
            });
		}

        function onCallbackInvalidParam(eventName) {
            try {
                controller.on(eventName);
                expect().assertFail();
            } catch (error) {
                expect(error.code).assertEqual(401);
            }
        }

        beforeAll(function () {
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async function () {
            console.info('TestLog: Init Session And Controller');
            if (!session) {
                await avSession.createAVSession(context, tag, type).then((data) => {
                    session = data;
                }).catch((err) => {
                    expect(err.code == 6600101).assertTrue();
                    console.info(avSession.AVSessionErrorCode.ERR_CODE_SERVICE_EXCEPTION);
                    console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                });
            }

            await session.activate().then(() => {
                console.info('TestLog: Session activate');
            }).catch((err) => {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            });

            controller = await session.getController();
        })

        afterEach(async function (done) {
            console.info('TestLog: Destroy Session And Controller');
            if (session) {
                await session.destroy().then(() => {
                    console.info('TestLog: Session destroy success');
                    session = null;
                }).catch((err) => {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                });
            }
            if (controller) {
                await controller.destroy().then(() => {
                    console.info('TestLog: Controller destroy success');
                    controller = null;
                }).catch((err) => {
                    console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                });
            }
            done();
        })

        afterAll(function () {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0100
         * @tc.name      : sendAVKeyEvent(callback) with invalid params(errcode 401)
         * @tc.desc      : test sendAVKeyEvent(callback) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0100', 0, async function (done) {
            try {
                controller.sendAVKeyEvent(err => {
                    if (err) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('sendAVKeyEvent Successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0200
         * @tc.name      : sendAVKeyEvent(callback) with controller does not exist(errcode 6600103)
         * @tc.desc      : test sendAVKeyEvent(callback) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0200', 0, async function (done) {
            await invalidController(() => {
                try {
                    controller.sendAVKeyEvent(event, err => {
                        if (err) {
                            console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('sendAVKeyEvent Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0300
         * @tc.name      : sendAVKeyEvent(callback) with invalid session commands(errcode 6600105)
         * @tc.desc      : test sendAVKeyEvent(callback) errcode 6600105
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0300', 0, async function (done) {
            try {
                controller.sendAVKeyEvent(errEvent, async err => {
                    if (err) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(6600105);
                    } else {
                        console.info('sendAVKeyEvent Successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0400
         * @tc.name      : sendAVKeyEvent(callback) with deactivated session(errcode 6600106)
         * @tc.desc      : test sendAVKeyEvent(callback) errcode 6600106
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0400', 0, async function (done) {
            await session.deactivate().then(() => {
                console.info('TestLog: session deactivate success');
            }).catch(err => {
                console.info(`TestLog: session deactivate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            });
            try {
                controller.sendAVKeyEvent(event, async err => {
                    if (err) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(6600106);
                    } else {
                        console.info('sendAVKeyEvent Successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0500
         * @tc.name      : sendAVKeyEvent(promise) with invalid params(errcode 401)
         * @tc.desc      : test sendAVKeyEvent(promise) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0500', 0, async function (done) {
            await controller.sendAVKeyEvent().then(() => {
                console.info('sendAVKeyEvent Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0600
         * @tc.name      : sendAVKeyEvent(promise) with controller does not exist(errcode 6600103)
         * @tc.desc      : test sendAVKeyEvent(promise) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0600', 0, async function (done) {
            await invalidController(async () => {
                await controller.sendAVKeyEvent(event).then(() => {
                    console.info('sendAVKeyEvent Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            })
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0700
         * @tc.name      : sendAVKeyEvent(promise) with invalid session commands(errcode 6600105)
         * @tc.desc      : test sendAVKeyEvent(promise) errcode 6600105
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0700', 0, async function (done) {
            await controller.sendAVKeyEvent(errEvent).then(() => {
                console.info('sendAVKeyEvent Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600105);
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0800
         * @tc.name      : sendAVKeyEvent(promise) with deactivated session(errcode 6600106)
         * @tc.desc      : test sendAVKeyEvent(promise) errcode 6600106
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0800', 0, async function (done) {
            await session.deactivate().then(() => {
                console.info('TestLog: session deactivate success');
            }).catch(err => {
                console.info(`TestLog: session deactivate error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
            });
            await controller.sendAVKeyEvent(event).then(() => {
                console.info('sendAVKeyEvent Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600106);
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_ERRORCODE_0100
         * @tc.name      : getRealPlaybackPositionSync with controller does not exist(errcode 6600103)
         * @tc.desc      : test getRealPlaybackPositionSync errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_ERRORCODE_0100', 0, async function (done) {
            await invalidController(() => {
                try {
                    controller.getRealPlaybackPositionSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`TestLog: getRealPlaybackPositionSync error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            })
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0100
         * @tc.name      : getValidCommands(promise) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getValidCommands(promise) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0100', 0, async function (done) {
            await invalidController(async () => {
                await controller.getValidCommands().then(() => {
                    console.info(`TestLog: getValidCommands Successfully.`);
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0200
         * @tc.name      : getValidCommands(promise) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getValidCommands(promise) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0200', 0, async function (done) {
            await invalidSession(async () => {
                await controller.getValidCommands().then((data) => {
                    console.info(`TestLog: getValidCommands Successfully.`);
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0300
         * @tc.name      : getValidCommands(callback) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getValidCommands(callback) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0300', 0, async function (done) {
            await invalidController(() => {
                try {
                    controller.getValidCommands(err => {
                        if (err) {
                            console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info(`TestLog: getValidCommands Successfully.`);
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0400
         * @tc.name      : getValidCommands(callback) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getValidCommands(callback) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_0400', 0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getValidCommands(err => {
                        if (err) {
                            console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info(`TestLog: getValidCommands Successfully.`);
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
            
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0100
         * @tc.name      : on('sessionEvent') with none param (errcode 401)
         * @tc.desc      : test on('sessionEvent') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0100", 0, async function (done) {
            onCallbackInvalidParam('sessionEvent');
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0200
         * @tc.name      : on('sessionEvent') with too many params (errcode 401)
         * @tc.desc      : test on('sessionEvent') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0200", 0, async function (done) {
            try {
                controller.on('sessionEvent', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0300
         * @tc.name      : on('sessionEvent') with invalid param type(errcode 401)
         * @tc.desc      : test on('sessionEvent') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0300", 0, async function (done) {
            try {
                controller.on('sessionEvent', INVALID_STRING);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0400
         * @tc.name      : on('sessionEvent') with controller does not exist(errcode 6600103)
         * @tc.desc      : test on('sessionEvent') errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_0400", 0, async function (done) {
            await onCallbackInvalidController('sessionEvent')
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_ERRORCODE_0100
         * @tc.name      : off('sessionEvent') with invalid param number(errcode 401)
         * @tc.desc      : test off('sessionEvent') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_OFFSESSIONEVENT_ERRORCODE_0100", 0, async function (done) {
            offCallbackInvalidParam('sessionEvent');
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0100
         * @tc.name      : sendCommonCommand(promise) with invalid param number(errcode 401)
         * @tc.desc      : test sendCommonCommand(promise) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0100", 0, async function (done) {
            await controller.sendCommonCommand(COMMON_COMMAND_STRING).then(() => {
                console.info('sendCommonCommand Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0200
         * @tc.name      : sendCommonCommand(promise) with invalid param type(errcode 401)
         * @tc.desc      : test sendCommonCommand(promise) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0200", 0, async function (done) {
            await controller.sendCommonCommand(COMMON_COMMAND_PARAMS, COMMON_COMMAND_PARAMS).then(() => {
                console.info('sendCommonCommand Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0300
         * @tc.name      : sendCommonCommand(promise) with avsession does not active(errcode 6600106)
         * @tc.desc      : test sendCommonCommand(promise) errcode 6600106
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0300", 0, async function (done) {
            await invalidSessionState(async () => {
                await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).then(() => {
                    console.info('sendCommonCommand Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600106);
                });
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0400
         * @tc.name      : sendCommonCommand(promise) with controller does not exist(errcode 6600103)
         * @tc.desc      : test sendCommonCommand(promise) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0400", 0, async function (done) {
			await invalidController(async () => {
                await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS).then(() => {
                    console.info('sendCommonCommand Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0500
         * @tc.name      : sendCommonCommand(callback) with invalid param number(errcode 401)
         * @tc.desc      : test sendCommonCommand(callback) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0500", 0, async function (done) {
            try {
                controller.sendCommonCommand(COMMON_COMMAND_STRING, err => {
                    if (err) {
                        console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('sendCommonCommand Successfully');
                        expect().assertFail();
                    }
                    done();
                });
            } catch (err) {
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0600
         * @tc.name      : sendCommonCommand(callback) with invalid param type(errcode 401)
         * @tc.desc      : test sendCommonCommand(callback) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0600", 0, async function (done) {
            try {
                controller.sendCommonCommand(COMMON_COMMAND_PARAMS, COMMON_COMMAND_PARAMS, err => {
                    if (err) {
                        console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('sendCommonCommand Successfully');
                        expect().assertFail();
                    }
                    done();
                });
            } catch (err) {
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0700
         * @tc.name      : sendCommonCommand(callback) with avsession does not active(errcode 6600106)
         * @tc.desc      : test sendCommonCommand(callback) errcode 6600106
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0700", 0, async function (done) {
            await invalidSessionState(() => {
                try {
                    controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS, err => {
                        if (err) {
                            console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600106);
                        } else {
                            console.info('sendCommonCommand Successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0800
         * @tc.name      : sendCommonCommand(callback) with controller does not exist(errcode 6600103)
         * @tc.desc      : test sendCommonCommand(callback) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0800", 0, async function (done) {
			await invalidController(() => {
                try {
                    controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS, err => {
                        if (err) {
                            console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('sendCommonCommand Successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0100
         * @tc.name      : getExtras(promise) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getExtras(promise) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0100", 0, async function (done) {
			await invalidSession(async () => {
                await controller.getExtras().then(() => {
                    console.info('getExtras Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0200
         * @tc.name      : getExtras(promise) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getExtras(promise) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0200", 0, async function (done) {
            await invalidController(async () => {
                await controller.getExtras().then(() => {
                    console.info('getExtras Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0300
         * @tc.name      : getExtras(callback) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getExtras(callback) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0300", 0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getExtras(err => {
                        if (err) {
                            console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('getExtras Successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0400
         * @tc.name      : getExtras(callback) with avsession does not exist(errcode 6600103)
         * @tc.desc      : test getExtras(callback) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_0400", 0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getExtras(err => {
                        if (err) {
                            console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('getExtras Successfully');
                            expect().assertFail();
                        }
                        done();
                    });
                } catch (err) {
                    console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0100
         * @tc.name      : on('extrasChange') with none param (errcode 401)
         * @tc.desc      : test on('extrasChange') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0100", 0, async function (done) {
            onCallbackInvalidParam('extrasChange');
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0200
         * @tc.name      : on('extrasChange') with invalid param number (errcode 401)
         * @tc.desc      : test on('extrasChange') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0200", 0, async function (done) {
			try {
				controller.on('extrasChange', callback1, callback2);
                expect().assertFail();
			} catch (err) {
				expect(err.code == 401).assertTrue();
			}
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0300
         * @tc.name      : on('extrasChange') with invalid param type (errcode 401)
         * @tc.desc      : test on('extrasChange') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0300", 0, async function (done) {
            try {
                controller.on('extrasChange', INVALID_STRING);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0400
         * @tc.name      : on('extrasChange') with controller does not exist(errcode 6600103)
         * @tc.desc      : test on('extrasChange') errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_0400", 0, async function (done) {
            await onCallbackInvalidController('extrasChange')
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_ERRORCODE_0100
         * @tc.name      : off('extrasChange') with invalid param number(errcode 401)
         * @tc.desc      : test off('extrasChange') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_OFFEXTRASCHANGE_ERRORCODE_0100", 0, async function (done) {
            offCallbackInvalidParam('extrasChange');
			done();
		})

		/* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0100
         * @tc.name      : on('queueItemsChange') with none param (errcode 401)
         * @tc.desc      : test on('queueItemsChange') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0100", 0, async function (done) {
            onCallbackInvalidParam('queueItemsChange');
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0200
         * @tc.name      : on('queueItemsChange') with too many params (errcode 401)
         * @tc.desc      : test on('queueItemsChange') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0200", 0, async function (done) {
            try {
                controller.on('queueItemsChange', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0300
         * @tc.name      : on('queueItemsChange') with controller does not exist(errcode 6600103)
         * @tc.desc      : test on('queueItemsChange') errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUEITEMSCHANGE_ERRORCODE_0300", 0, async function (done) {
			await onCallbackInvalidController('queueItemsChange');
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_ERRORCODE_0100
         * @tc.name      : off('queueItemsChange') with invalid param number(errcode 401)
         * @tc.desc      : test off('queueItemsChange') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUEITEMSCHANGE_ERRORCODE_0100", 0, async function (done) {
            offCallbackInvalidParam('queueItemsChange');
			done();
		})

		/* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0100
         * @tc.name      : on('queueTitleChange') with none param (errcode 401)
         * @tc.desc      : test on('queueTitleChange') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0100", 0, async function (done) {
            onCallbackInvalidParam('queueTitleChange');
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0200
         * @tc.name      : on('queueTitleChange') with too many params (errcode 401)
         * @tc.desc      : test on('queueTitleChange') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0200", 0, async function (done) {
            try {
                controller.on('queueTitleChange', callback1, callback2);
                expect().assertFail();
            } catch (err) {
                expect(err.code).assertEqual(401);
            }
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0300
         * @tc.name      : on('queueTitleChange') with controller does not exist(errcode 6600103)
         * @tc.desc      : test on('queueTitleChange') errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ONQUEUETITLECHANGE_ERRORCODE_0300", 0, async function (done) {
			await onCallbackInvalidController('queueTitleChange');
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_ERRRORCODE_0100
         * @tc.name      : off('queueTitleChange') with invalid param number(errcode 401)
         * @tc.desc      : test off('queueTitleChange') errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_OFFQUEUETITLECHANGE_ERRRORCODE_0100", 0, async function (done) {
            offCallbackInvalidParam('queueTitleChange');
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0100
         * @tc.name      : skipToQueueItem(promise) with invalid params(errcode 401)
         * @tc.desc      : test skipToQueueItem(promise) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0100", 0, async function (done) {
            await controller.skipToQueueItem('invalid param').then(() => {
                console.info('skipToQueueItem Successfully');
                expect().assertFail();
            }).catch((err) => {
                console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(401);
            });
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0200
         * @tc.name      : skipToQueueItem(promise) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test skipToQueueItem(promise) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0200", 0, async function (done) {
            await invalidSession(async () => {
                await controller.skipToQueueItem(QUEUE_ITEM_ID).then(() => {
                    console.info('skipToQueueItem Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0300
         * @tc.name      : skipToQueueItem(promise) with controller does not exist(errcode 6600103)
         * @tc.desc      : test skipToQueueItem(promise) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0300", 0, async function (done) {
			await invalidController(async () => {
                await controller.skipToQueueItem(QUEUE_ITEM_ID).then(() => {
                    console.info('skipToQueueItem Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            })
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0400
         * @tc.name      : skipToQueueItem(callback) with invalid params(errcode 401)
         * @tc.desc      : test skipToQueueItem(callback) errcode 401
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0400", 0, async function (done) {
            try {
                controller.skipToQueueItem('invalid param', err => {
                    if (err) {
                        console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(401);
                    } else {
                        console.info('skipToQueueItem Successfully');
                        expect().assertFail();
                    }
                    done();
                })
            } catch (err) {
                console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                expect().assertFail();
                done();
            }
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0500
         * @tc.name      : skipToQueueItem(callback) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test skipToQueueItem(callback) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0500", 0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.skipToQueueItem(QUEUE_ITEM_ID, err => {
                        if (err) {
                            console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('skipToQueueItem Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0600
         * @tc.name      : skipToQueueItem(callback) with controller does not exist(errcode 6600103)
         * @tc.desc      : test skipToQueueItem(callback) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_0600", 0, async function (done) {
            await invalidController(() => {
                try {
                    controller.skipToQueueItem(QUEUE_ITEM_ID, err => {
                        if (err) {
                            console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('skipToQueueItem Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0100
         * @tc.name      : getAVQueueItems(promise) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getAVQueueItems(promise) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0100", 0, async function (done) {
            await invalidSession(async () => {
                await controller.getAVQueueItems().then(() => {
                    console.info('getAVQueueItems Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0200
         * @tc.name      : getAVQueueItems(promise) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getAVQueueItems(promise) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0200", 0, async function (done) {
            await invalidController(async () => {
                await controller.getAVQueueItems().then(() => {
                    console.info('getAVQueueItems Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            })
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0300
         * @tc.name      : getAVQueueItems(callback) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getAVQueueItems(callback) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0300", 0, async function (done) {
			await invalidSession(() => {
                try {
                    controller.getAVQueueItems(err => {
                        if (err) {
                            console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('getAVQueueItems Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0400
         * @tc.name      : getAVQueueItems(callback) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getAVQueueItems(callback) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_0400", 0, async function (done) {
            await invalidController(() => {
                try {
                    controller.getAVQueueItems(err => {
                        if (err) {
                            console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('getAVQueueItems Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0100
         * @tc.name      : getAVQueueTitle(promise) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getAVQueueTitle(promise) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0100", 0, async function (done) {
            await invalidSession(async () => {
                await controller.getAVQueueTitle().then(() => {
                    console.info('getAVQueueTitle Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0200
         * @tc.name      : getAVQueueTitle(promise) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getAVQueueTitle(promise) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0200", 0, async function (done) {
            await invalidController(async () => {
                await controller.getAVQueueTitle().then(() => {
                    console.info('getAVQueueTitle Successfully');
                    expect().assertFail();
                }).catch((err) => {
                    console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                });
            })
            done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0300
         * @tc.name      : getAVQueueTitle(callback) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getAVQueueTitle(callback) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0300", 0, async function (done) {
			await invalidSession(() => {
                try {
                    controller.getAVQueueTitle(err => {
                        if (err) {
                            console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600102);
                        } else {
                            console.info('getAVQueueTitle Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0400
         * @tc.name      : getAVQueueTitle(callback) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getAVQueueTitle(callback) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_0400", 0, async function (done) {
            await invalidController(() => {
                try {
                    controller.getAVQueueTitle(err => {
                        if (err) {
                            console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(6600103);
                        } else {
                            console.info('getAVQueueTitle Successfully');
                            expect().assertFail();
                        }
                        done();
                    })
                } catch (err) {
                    console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_0100
         * @tc.name      : getAVPlaybackStateSync(async) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getAVPlaybackStateSync(async) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_0100", 0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getAVPlaybackStateSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVPlaybackStateSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_0200
         * @tc.name      : getAVPlaybackStateSync(async) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getAVPlaybackStateSync(async) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_0200", 0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getAVPlaybackStateSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVPlaybackStateSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_0100
         * @tc.name      : getAVMetadataSync(async) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getAVMetadataSync(async) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_0100", 0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getAVMetadataSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVMetadataSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_0200
         * @tc.name      : getAVMetadataSync(async) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getAVMetadataSync(async) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_0200", 0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getAVMetadataSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVMetadataSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_0100
         * @tc.name      : getAVQueueTitleSync(async) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getAVQueueTitleSync(async) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_0100", 0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getAVQueueTitleSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVQueueTitleSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_0200
         * @tc.name      : getAVQueueTitleSync(async) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getAVQueueTitleSync(async) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_0200", 0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getAVQueueTitleSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVQueueTitleSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_0100
         * @tc.name      : getAVQueueItemsSync(async) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getAVQueueItemsSync(async) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_0100", 0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getAVQueueItemsSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVQueueItemsSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_0200
         * @tc.name      : getAVQueueItemsSync(async) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getAVQueueItemsSync(async) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_0200", 0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getAVQueueItemsSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getAVQueueItemsSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_ERRORCODE_0100
         * @tc.name      : getOutputDeviceSync(async) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getOutputDeviceSync(async) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_ERRORCODE_0100", 0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getOutputDeviceSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getOutputDeviceSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_0100
         * @tc.name      : isActiveSync(async) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test isActiveSync(async) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_0100", 0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.isActiveSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`isActiveSync failed: code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_0200
         * @tc.name      : isActiveSync(async) with controller does not exist(errcode 6600103)
         * @tc.desc      : test isActiveSync(async) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_0200", 0, async function (done) {
			await invalidController(() => {
                try {
                    controller.isActiveSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`isActiveSync failed: code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_0100
         * @tc.name      : getValidCommandsSync(async) with avsession does not exist(errcode 6600102)
         * @tc.desc      : test getValidCommandsSync(async) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_0100", 0, async function (done) {
            await invalidSession(() => {
                try {
                    controller.getValidCommandsSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getValidCommandsSync failed: code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(6600102);
                }
            });
			done();
		})

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_0200
         * @tc.name      : getValidCommandsSync(async) with controller does not exist(errcode 6600103)
         * @tc.desc      : test getValidCommandsSync(async) errcode 6600103
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
		it("SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_0200", 0, async function (done) {
			await invalidController(() => {
                try {
                    controller.getValidCommandsSync();
                    expect().assertFail();
                } catch (err) {
                    console.info(`getValidCommandsSync failed: code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(6600103);
                }
            });
			done();
		})
    })
}