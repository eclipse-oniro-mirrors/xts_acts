/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import avSession from '@ohos.multimedia.avsession';
import common from '@ohos.app.ability.common';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext;
const TAG = "[AVSessionJSTest]";
export default function abilityTest() {
    describe("AVSessionJsTest", () => {
        let session: avSession.AVSession | null;
        let controller: avSession.AVSessionController;
        let receivedCallback = false;
        let receivedCallback2 = false;
        let receivedString: string;
        let receivedString2: string;
        let receivedParam: Record<string, Object>;
        let receivedParam2: Record<string, Object>;
        const INVALID_STRING = "invalid string";
        const UPDATE_LYRICS_EVENT = "dynamic_lyrics";
        const UPDATE_LYRICS_WANT_PARAMS: Record<string, Object> = {
            'lyric': "This is my lyrics"
        };
        const COMMON_COMMAND_STRING = "common_command";
        const COMMON_COMMAND_PARAMS: Record<string, Object> = {
            'command': "This is my command"
        };
        const CUSTOM_EXTRAS: Record<string, Object> = {
            'extras': "This is custom media packet"
        };

        beforeAll(()=> {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        afterAll(async () => {
            if (session != null) {
                try{
                    await session!.destroy()
                    console.info(`${TAG}: Session destroy success`);
                }catch(err: BusinessError){
                    console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`${TAG}: Session is already destroy`);
            }
        })

        beforeEach(async () => {
            try{
                session = await avSession.createAVSession(context, "AVSessionDemo", 'video_call');
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

        afterEach(() => {
            console.info(TAG + 'afterEach called')
        })

        let commonCommandCallback1 = (command: string, args: Record<string, Object>) => {
            console.log(TAG + "Callback1 received event: " + JSON.stringify(command));
            console.log(TAG + "Callback1 received args: " + JSON.stringify(args));
            if (command != COMMON_COMMAND_STRING) {
                console.error(TAG + "Callback1 common command unmatch");
                expect(true).assertFalse();
            }
            receivedCallback = true;
            receivedString = command;
            receivedParam = args;
        }

        let commonCommandCallback2 = (command: string, args: Record<string, Object>) => {
            console.log(TAG + "Callback2 received event: " + JSON.stringify(command));
            console.log(TAG + "Callback2 received args: " + JSON.stringify(args));
            if (command != COMMON_COMMAND_STRING) {
                console.error(TAG + "Callback2 common command unmatch");
                expect(true).assertFalse();
            }
            receivedCallback2 = true;
            receivedString2 = command;
            receivedParam2 = args;
        }

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0100
         * @tc.desc   Testing call dispatchSessionEvent(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS, (err) => {
                if (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0100 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                    done();
                }
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0100 finished");
                expect(true).assertTrue();
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0200
         * @tc.desc   Testing call dispatchSessionEvent(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await session!.dispatchSessionEvent(UPDATE_LYRICS_EVENT, UPDATE_LYRICS_WANT_PARAMS)
            }catch(err: BusinessError){
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_DISPATCHSESSIONEVENT_STATIC_0200 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0100
         * @tc.desc   Testing call setExtras(callback)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.setExtras(CUSTOM_EXTRAS, (err) => {
                if (err) {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0100 error " + JSON.stringify(err));
                    expect(true).assertFalse();
                    done();
                }
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0100 finished");
                expect(true).assertTrue();
                done();
            });
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0200
         * @tc.desc   Testing call setExtras(promise)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await session!.setExtras(CUSTOM_EXTRAS)
            }catch(err: BusinessError){
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0200 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_SETEXTRAS_STATIC_0200 finished");
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0100
         * @tc.desc   bind one callback on commonCommand event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.onCommonCommand(commonCommandCallback1);
            try {
                await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS)
            }catch(err: BusinessError){
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0100 error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            Utils.msSleep(200).then(() => {
                if (receivedCallback) {
                    console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0100 Received common command");
                    expect(receivedString == COMMON_COMMAND_STRING).assertTrue();
                    expect(receivedParam['command'] == COMMON_COMMAND_PARAMS['command']).assertTrue();
                } else {
                    console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0100 Common command not received");
                    expect(true).assertFalse();
                }
                receivedCallback = false;
                receivedString = {};
                receivedParam = {};
                done();
            })
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0200
         * @tc.desc   bind two callbacks on commonCommand event
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.onCommonCommand(commonCommandCallback1);
            session!.onCommonCommand(commonCommandCallback2);
            try {
                await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS)
            }catch(err: BusinessError){
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0200 Send common command error " + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (receivedCallback && receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0200 Received common command");
                expect(receivedString == COMMON_COMMAND_STRING).assertTrue();
                expect(receivedParam['command'] == COMMON_COMMAND_PARAMS['command']).assertTrue();
                expect(receivedString2 == COMMON_COMMAND_STRING).assertTrue();
                expect(receivedParam2['command'] == COMMON_COMMAND_PARAMS['command']).assertTrue();
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_ONCOMMONCOMMAND_STATIC_0200 Common command not received");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            receivedString = {};
            receivedParam = {};
            receivedCallback2 = false;
            receivedString2 = {};
            receivedParam2 = {};
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0100
         * @tc.desc   bind two callbacks on commonCommand event, off one of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.onCommonCommand(commonCommandCallback1);
            session!.onCommonCommand(commonCommandCallback2);
            session!.offCommonCommand(commonCommandCallback2);
            try {
                await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS)
            }catch(err: BusinessError){
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0100 Send common command error" + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0100 finished");
                expect(receivedString == COMMON_COMMAND_STRING).assertTrue();
                expect(receivedParam['command'] == COMMON_COMMAND_PARAMS['command']).assertTrue();
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0100 failed");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            receivedString = {};
            receivedParam = {};
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0200
         * @tc.desc   bind two callbacks on commonCommand event, off two of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.onCommonCommand(commonCommandCallback1);
            session!.onCommonCommand(commonCommandCallback2);
            session!.offCommonCommand(commonCommandCallback1);
            session!.offCommonCommand(commonCommandCallback2);
            try {
                await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS)
            }catch(err: BusinessError){
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0200 Send common command error" + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (!receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0200 finished");
                expect(true).assertTrue();
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0200 failed");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0300
         * @tc.desc   bind two callbacks on commonCommand event, off all of them
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.onCommonCommand(commonCommandCallback1);
            session!.onCommonCommand(commonCommandCallback2);
            session!.offCommonCommand();
            try {
                await controller.sendCommonCommand(COMMON_COMMAND_STRING, COMMON_COMMAND_PARAMS)
            }catch(err: BusinessError){
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0300 Send common command error" + JSON.stringify(err));
                expect(true).assertFalse();
                done();
            };
            await Utils.msSleep(200);
            if (!receivedCallback && !receivedCallback2) {
                console.log(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0300 finished");
            } else {
                console.error(TAG + "SUB_MULTIMEDIA_AVSESSION_OFFCOMMONCOMMAND_STATIC_0300 failed");
                expect(true).assertFalse();
            }
            receivedCallback = false;
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICESYNC_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICESYNC_STATIC_0100
         * @tc.desc   Testing call session getOutputDeviceSync(sync)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICESYNC_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                let outputDeviceInfo: avSession.OutputDeviceInfo;
                outputDeviceInfo = session!.getOutputDeviceSync();
                console.log(`TestLog: Get output device info: ${outputDeviceInfo}`);
                console.log(`TestLog: Get output device info: ${outputDeviceInfo.devices[0].deviceId}`);
                expect(outputDeviceInfo.devices[0].deviceId).assertEqual("0");
            } catch (err: BusinessError) {
                expect(true).assertFalse();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0100
         * @tc.desc   Testing call session castDisplayChange(CastDisplayState.STATE_ON|CastDisplayState.STATE_OFF)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                session!.onCastDisplayChange((display) => {
                    if (display.state === avSession.CastDisplayState.STATE_ON) {
                        let castDisplay = display
                        if (typeof castDisplay.id === 'int'){
                            console.info('castDisplay id type ture')
                        } else {
                            console.info(`castDisplay id type false`);
                        }
                        console.info('castDisplayChange display : ${display.id} ON');
                    } else if (display.state === avSession.CastDisplayState.STATE_OFF) {
                        console.info('castDisplayChange display : ${display.id} OFF');
                    }
                });
            } catch (err: BusinessError) {
                expect(err.code).assertEqual(6600101);
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0100 finished");
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0200
         * @tc.desc   Testing call session castDisplayChange()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                session!.onCastDisplayChange((display) => {
                    if (display.state === avSession.CastDisplayState.STATE_ON) {
                        let castDisplay = display
                        if (typeof castDisplay.name === 'string'){
                            console.info('castDisplay name type ture')
                        } else {
                            console.info(`castDisplay name type false`);
                        }
                        console.info('castDisplayChange display : ${display.id} ON');
                    } else if (display.state === avSession.CastDisplayState.STATE_OFF) {
                        console.info('castDisplayChange display : ${display.id} OFF');
                    }
                });
            } catch (err: BusinessError) {
                expect(err.code).assertEqual(6600101);
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0100 finished");
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0300
         * @tc.desc   Testing call session castDisplayChange()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                session!.onCastDisplayChange((display) => {
                    if (display.state === avSession.CastDisplayState.STATE_ON) {
                        let castDisplay = display
                        if (typeof castDisplay.width === 'int'){
                            console.info('castDisplay width type ture')
                        } else {
                            console.info(`castDisplay width type false`);
                        }
                        console.info('castDisplayChange display : ${display.id} ON');
                    } else if (display.state === avSession.CastDisplayState.STATE_OFF) {
                        console.info('castDisplayChange display : ${display.id} OFF');
                    }
                });
            } catch (err: BusinessError) {
                expect(err.code).assertEqual(6600101);
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0100 finished");
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0400
         * @tc.desc   Testing call session castDisplayChange()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it("SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                session!.onCastDisplayChange((display) => {
                    if (display.state === avSession.CastDisplayState.STATE_ON) {
                        let castDisplay = display
                        if (typeof castDisplay.height === 'int'){
                            console.info('castDisplay height type ture')
                        } else {
                            console.info(`castDisplay height type false`);
                        }
                        console.info('castDisplayChange display : ${display.id} ON');
                    } else if (display.state === avSession.CastDisplayState.STATE_OFF) {
                        console.info('castDisplayChange display : ${display.id} OFF');
                    }
                });
            } catch (err: BusinessError) {
                expect(err.code).assertEqual(6600101);
                console.info(TAG + "SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYCHANGE_STATIC_0100 finished");
            }
            if (session != null) {
                await session!.destroy();
            }
            done();
        })
    })
}
