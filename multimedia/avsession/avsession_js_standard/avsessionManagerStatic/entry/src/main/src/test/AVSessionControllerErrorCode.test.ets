/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { KeyEvent, Key, Action } from '@ohos.multimodalInput.keyEvent';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import type { KeyCode } from '@ohos.multimodalInput.keyCode';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext;
export default function abilityTest() {
    describe('AVSessionControllerErrorCode', () => {
        let TAG: string = "[AVSessionTest]";
        let tag: string = 'ApplicationA';
        let session: avSession.AVSession | null;
        let controller: avSession.AVSessionController;
        let OutputDeviceInfo: avSession.OutputDeviceInfo;
        let keyItem: Key = { code: KeyCode.KEYCODE_FN, pressedTime: 123456789, deviceId: 0 };
        let event: KeyEvent = {id:1, deviceId:0, actionTime:1, screenId:1, windowId:1, action:Action.UP, key:keyItem, unicodeChar:0, keys:[keyItem], ctrlKey:false, altKey:false, shiftKey:false, logoKey:false, fnKey:false, capsLock:false, numLock:false, scrollLock:false};

        const COMMON_COMMAND_STRING = "common_command";
        const COMMON_COMMAND_PARAMS: Record<string, Object> = {
            'command': "This is my command"
        };
        const QUEUE_ITEM_ID = 666;
        const INVALID_STRING = "invalid string";

        let invalidSession = async (validFunc: () => Promise<void>) => {
            try{
                await session!.destroy()
                console.info('TestLog: session destroy success');
                await validFunc();

            }catch(err: BusinessError) {
                console.info(`TestLog: session destroy error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
            }
        }

        beforeAll(()=> {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async () => {
            try{
                session = await avSession.createAVSession(context, tag, 'video_call');
            }catch(err: BusinessError){
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
            };
            try{
                await session!.activate();
                console.info(`TestLog: Session activate`);
            }catch(err: BusinessError){
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            };
            try {
                controller = await session!.getController();
                console.info(`TestLog: controller getController`);
            } catch (err: BusinessError) {
                console.info(`TestLog: getController error: code: ${err.code}, message: ${err.message}`);
            }
            await Utils.msSleep(800);
            console.info(`TestLog: beforeEach out`);
        })

        afterEach(async () => {
            console.info(`TestLog: afterEach in`);
            if (session != null) {
                try{
                    await session!.destroy()
                    console.info(`TestLog: Session destroy success`);
                } catch (err: BusinessError) {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`TestLog: Session is already destroy`);
            }
            if (controller != null) {
                try{
                    await controller.destroy()
                    console.info(`TestLog: Controller destroy success`);
                } catch (err: BusinessError) {
                    console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`TestLog: Controller is already destroy`);
            }
            console.info(`TestLog: afterEach out`);
        })

        afterAll(()=> {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0200
         * @tc.desc   sendAVKeyEvent(callback) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.sendAVKeyEvent(event, (err: BusinessError|null) => {
                    if (err?.code) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err?.code}, message: ${err?.message}`);
                        expect(err?.code).assertEqual(6600103);
                    } else {
                        console.info('TestLog: sendAVKeyEvent Successfully');
                        expect(true).assertFalse();
                    }
                    done();
                })
            } catch (err: BusinessError) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0400
         * @tc.desc   sendAVKeyEvent(callback) with deactivated session(errcode 6600106)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
            await session!.deactivate()
                console.info('TestLog: session deactivate success');
            }catch(err: BusinessError) {
                console.info(`TestLog: session deactivate error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
            };
            try {
                controller.sendAVKeyEvent(event, (err: BusinessError|null) => {
                    if (err) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600106);
                    } else {
                        console.info('sendAVKeyEvent Successfully');
                        expect(true).assertFalse();
                    }
                    done();
                })
            } catch (err: BusinessError) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0600
         * @tc.desc   sendAVKeyEvent(promise) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try{
                await controller.sendAVKeyEvent(event);
                console.info('sendAVKeyEvent Successfully');
                expect(true).assertFalse();
            } catch (err: BusinessError) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0800
         * @tc.desc   sendAVKeyEvent(promise) with deactivated session(errcode 6600106)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try{
            await session!.deactivate()
                console.info('TestLog: session deactivate success');
            } catch (err: BusinessError) {
                console.info(`TestLog: session deactivate error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
            };
            try{
                await controller.sendAVKeyEvent(event)
                console.info('sendAVKeyEvent Successfully');
                expect(true).assertFalse();
            } catch (err: BusinessError) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600106);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_ERRORCODE_STATIC_0100
         * @tc.desc   getRealPlaybackPositionSync with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getRealPlaybackPositionSync();
                expect(true).assertFalse();
            } catch (err: BusinessError) {
                console.info(`TestLog: getRealPlaybackPositionSync error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            }
            Utils.msSleep(800);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0100
         * @tc.desc   getValidCommands(promise) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try{
                await controller.getValidCommands()
                console.info(`TestLog: getValidCommands Successfully.`);
                expect(true).assertFalse();
            } catch (err: BusinessError) {
                console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            Utils.msSleep(800);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0200
         * @tc.desc   test getValidCommands(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                await controller.getValidCommands().then((data) => {
                    console.info(`TestLog: getValidCommands Successfully.`);
                    expect().assertFail();
                }).catch((err: Error) => {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0300
         * @tc.desc   getValidCommands(callback) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getValidCommands(err => {
                    if (err) {
                        console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600103);
                    } else {
                        console.info(`TestLog: getValidCommands Successfully.`);
                        expect(true).assertFalse();
                    }
                    done();
                });
            }catch(err: BusinessError){
                console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
            Utils.msSleep(800);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0400
         * @tc.desc   test getValidCommands(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_ERRORCODE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
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
                } catch (err: BusinessError) {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });

        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_STATIC_0400
         * @tc.desc   test on('sessionEvent') errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONSESSIONEVENT_ERRORCODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await controller.destroy();
            try{
                controller.onSessionEvent((command: string, args: Record<string, Object>) => {
                    console.info(`controller on_sessionEvent Successfully`);
                });
            } catch(err: BusinessError) {
                console.info(`controller on_sessionEvent BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0300
         * @tc.desc   sendCommonCommand(promise) with avsession does not active(errcode 6600106)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.deactivate()
            try{await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS)
                console.info('sendCommonCommand Successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600106);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0400
         * @tc.desc   sendCommonCommand(promise) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try{
                await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS)
                console.info('sendCommonCommand Successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            Utils.msSleep(800);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0700
         * @tc.desc   sendCommonCommand(callback) with avsession does not active(errcode 6600106)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await session!.deactivate()
                try {
                    controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS, (err: BusinessError|null) => {
                        if (err) {
                            console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                            expect(err?.code).assertEqual(6600106);
                        } else {
                            console.info('sendCommonCommand Successfully');
                            expect(true).assertFalse();
                        }
                        done();
                    });
                }catch(err: BusinessError){
                    console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                    expect(true).assertFalse();
                    done();
                }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0800
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0800
         * @tc.desc   sendCommonCommand(callback) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_STATIC_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS, (err: BusinessError|null) => {
                    if (err) {
                        console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600103);
                    } else {
                        console.info('sendCommonCommand Successfully');
                        expect(true).assertFalse();
                    }
                    done();
                });
            }catch(err: BusinessError){
                console.info(`TestLog: sendCommonCommand error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
            Utils.msSleep(800);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0100
         * @tc.desc   test getExtras(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async () => {
                await controller.getExtras().then(() => {
                    console.info('getExtras Successfully');
                    expect().assertFail();
                }).catch((err: Error) => {
                    console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0200
         * @tc.desc   getExtras(promise) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try{
                await controller.getExtras()
                console.info('getExtras Successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            Utils.msSleep(800);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0300
         * @tc.desc   test getExtras(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
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
                } catch (err: BusinessError) {
                    console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0400
         * @tc.desc   getExtras(callback) with avsession does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETEXTRAS_ERRORCODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getExtras(err => {
                    if (err) {
                        console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600103);
                    } else {
                        console.info('getExtras Successfully');
                        expect(true).assertFalse();
                    }
                    done();
                });
            } catch (err: BusinessError) {
                console.info(`TestLog: getExtras error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_STATIC_0400
         * @tc.desc   test on('extrasChange') errcode 6600103
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONEXTRASCHANGE_ERRORCODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await controller.destroy();
            try{
                controller.onExtrasChange((extras: Record<string,Object>) => {
                    console.info(`controller on_extrasChange Successfully`);
                });
            } catch(err: BusinessError) {
                console.info(`controller on_extrasChange BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            await Utils.msSleep(300);
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0200
         * @tc.desc   test skipToQueueItem(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                await controller.skipToQueueItem(QUEUE_ITEM_ID).then(() => {
                    console.info('skipToQueueItem Successfully');
                    expect().assertFail();
                }).catch((err: Error) => {
                    console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0300
         * @tc.desc   skipToQueueItem(promise) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try{
                await controller.skipToQueueItem(QUEUE_ITEM_ID);
                console.info('skipToQueueItem Successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0500
         * @tc.desc   test skipToQueueItem(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
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
                } catch (err: BusinessError) {
                    console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0600
         * @tc.desc   skipToQueueItem(callback) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SKIPTOQUEUEITEM_ERRORCODE_STATIC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.skipToQueueItem(QUEUE_ITEM_ID, err => {
                    if (err) {
                        console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600103);
                    } else {
                        console.info('skipToQueueItem Successfully');
                        expect(true).assertFalse();
                    }
                    done();
                })
            } catch (err: BusinessError) {
                console.info(`TestLog: skipToQueueItem error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0100
         * @tc.desc   test getAVQueueItems(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                await controller.getAVQueueItems().then(() => {
                    console.info('getAVQueueItems Successfully');
                    expect().assertFail();
                }).catch((err: Error) => {
                    console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0200
         * @tc.desc   getAVQueueItems(promise) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try{
                await controller.getAVQueueItems()
                console.info('getAVQueueItems Successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0300
         * @tc.desc   test getAVQueueItems(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
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
                } catch (err: BusinessError) {
                    console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0400
         * @tc.desc   getAVQueueItems(callback) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_ERRORCODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getAVQueueItems(err => {
                    if (err) {
                        console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600103);
                    } else {
                        console.info('getAVQueueItems Successfully');
                        expect(true).assertFalse();
                    }
                    done();
                })
            }catch(err: BusinessError){
                console.info(`TestLog: getAVQueueItems error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0100
         * @tc.desc   test getAVQueueTitle(promise) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                await controller.getAVQueueTitle().then(() => {
                    console.info('getAVQueueTitle Successfully');
                    expect().assertFail();
                }).catch((err: Error) => {
                    console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                });
            })
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0200
         * @tc.desc   getAVQueueTitle(promise) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try{
                await controller.getAVQueueTitle()
                console.info('getAVQueueTitle Successfully');
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            };
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0300
         * @tc.desc   test getAVQueueTitle(callback) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
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
                } catch (err: BusinessError) {
                    console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0400
         * @tc.desc   getAVQueueTitle(callback) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLE_ERRORCODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getAVQueueTitle(err => {
                    if (err) {
                        console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                        expect(err?.code).assertEqual(6600103);
                    } else {
                        console.info('getAVQueueTitle Successfully');
                        expect(true).assertFalse();
                    }
                    done();
                })
            }catch(err: BusinessError){
                console.info(`TestLog: getAVQueueTitle error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertFalse();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_STATIC_0100
         * @tc.desc   test getAVPlaybackStateSync(async) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    controller.getAVPlaybackStateSync();
                    expect().assertFail();
                } catch (err: BusinessError) {
                    console.info(`getAVPlaybackStateSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_STATIC_0200
         * @tc.desc   getAVPlaybackStateSync(async) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATESYNC_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getAVPlaybackStateSync();
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`getAVPlaybackStateSync failed: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_STATIC_0100
         * @tc.desc   test getAVMetadataSync(async) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    controller.getAVMetadataSync();
                    expect().assertFail();
                } catch (err: BusinessError) {
                    console.info(`getAVMetadataSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_STATIC_0200
         * @tc.desc   getAVMetadataSync(async) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVMETADATASYNC_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getAVMetadataSync();
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`getAVMetadataSync failed: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_STATIC_0100
         * @tc.desc   test getAVQueueTitleSync(async) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    controller.getAVQueueTitleSync();
                    expect().assertFail();
                } catch (err: BusinessError) {
                    console.info(`getAVQueueTitleSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_STATIC_0200
         * @tc.desc   getAVQueueTitleSync(async) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUETITLESYNC_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getAVQueueTitleSync();
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`getAVQueueTitleSync failed: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_STATIC_0100
         * @tc.desc   test getAVQueueItemsSync(async) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    controller.getAVQueueItemsSync();
                    expect().assertFail();
                } catch (err: BusinessError) {
                    console.info(`getAVQueueItemsSync failed: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                }
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_STATIC_0200
         * @tc.desc   getAVQueueItemsSync(async) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSYNC_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getAVQueueItemsSync();
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`getAVQueueItemsSync failed: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_ERRORCODE_STATIC_0100
         * @tc.desc   getOutputDeviceSync(async) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_CONTROLLER_GETOUTPUTDEVICESYNC_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getOutputDeviceSync();
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`getOutputDeviceSync failed: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600103);
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_STATIC_0100
         * @tc.desc   test isActiveSync(async) errcode 6600102
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await invalidSession(async (): Promise<void> => {
                try {
                    controller.isActiveSync();
                    expect().assertFail();
                } catch (err: BusinessError) {
                    console.info(`isActiveSync failed: code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(6600102);
                }
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_STATIC_0200
         * @tc.desc   isActiveSync(async) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy();
            try {
                controller.isActiveSync();
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`isActiveSync failed: code: ${err.code}, message: ${err.message}`)
                expect(err.code).assertEqual(6600103);
            }
            done();
        })

  /**
   * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_STATIC_0100
   * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_STATIC_0100
   * @tc.desc   test getValidCommandsSync(async) errcode 6600102
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
		it("SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        await invalidSession(async (): Promise<void> => {
                try {
                    controller.getValidCommandsSync();
                    expect().assertFail();
                } catch (err: BusinessError) {
                    console.info(`getValidCommandsSync failed: code: ${err.code}, message: ${err.message}`)
                    expect(err.code).assertEqual(6600102);
                }
            });
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_STATIC_0200
         * @tc.desc   getValidCommandsSync(async) with controller does not exist(errcode 6600103)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_ERRORCODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            await controller.destroy()
            try {
                controller.getValidCommandsSync();
                expect(true).assertFalse();
            }catch(err: BusinessError){
                console.info(`getValidCommandsSync failed: code: ${err.code}, message: ${err.message}`)
                expect(err.code).assertEqual(6600103);
            }
            done();
        })
    })
}