/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import avSession from '@ohos.multimedia.avsession';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import { WantAgent } from '@ohos.app.ability.wantAgent';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext | undefined;
export default function abilityTest() {
    describe('AVSessionTest01', () => {
        let TAG: string = "[AVSessionTest]";
        let session: avSession.AVSession | null = null;
        let controller: avSession.AVSessionController | undefined;
        let tag: string = 'AVSessionCoreXTS';
        let customData: Record<string, Object> = {'customData': 'appdata'}

        let invalidSession = async (validFunc:() => Promise<void>) => {
            await session!.destroy().then(async () => {
                console.info('TestLog: session destroy success');
                await validFunc();
            }).catch((err: Error) => {
                console.info(`TestLog: session destroy error: err: ${err}`);
                expect().assertFail();
            })
        }

        beforeAll(() => {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info(`${TAG}: beforeAll in`);
        })

        beforeEach(async () => {
            try{
                session = await avSession.createAVSession(context!, tag, 'voice_call');
                console.info(`${session!.sessionType}`);
            }catch(err){
                console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
            };
            try{
                await session!.activate();
                console.info(`${TAG}: Session activate`);
            }catch(err){
                console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
            };
            try {
                controller = await session!.getController();
            } catch (err) {
                console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
            }
            await Utils.msSleep(800);
            console.info(`${TAG}: beforeEach out`);
        })

        afterEach(async () => {
            console.info(`${TAG}: afterEach in`);
            if (session != null) {
                try{
                    await session!.destroy()
                    console.info(`${TAG}: Session destroy success`);
                } catch (err) {
                    console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`${TAG}: Session is already destroy`);
            }
            if (controller != null) {
                try{
                    await controller!.destroy()
                    console.info(`${TAG}: Controller destroy success`);
                } catch (err) {
                    console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`${TAG}: Controller is already destroy`);
            }
            console.info(`${TAG}: afterEach out`);
        })

        afterAll(() => {
            console.info(`${TAG}: afterAll in`);
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_1100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_1100
         * @tc.desc   test offCustomDataChange with no input param
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = '[SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_1100]';
            let flag:number = 0;
            let callback1 = (data:Record<string,Object>)=>{
                console.info(`${TAG}Testlog: onCustomDataChange callback registration no.1 triggered.`)
                console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
                flag += 1
            }
            let callback2 = (data:Record<string,Object>)=>{
                console.info(`${TAG}Testlog: onCustomDataChange callback registration no.2 triggered.`)
                console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
                flag += 10
            }
            session!.onCustomDataChange(callback1);
            session!.onCustomDataChange(callback2);
            session!.offCustomDataChange();
            await Utils.msSleep(100);
            controller!.sendCustomData(customData);
            await Utils.msSleep(300);
            expect(flag).assertEqual(0);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_1200
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_1200
         * @tc.desc   test offCustomDataChange with specified callback function
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = '[SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_1200]';
            let flag:number = 0;
            let callback1 = (data:Record<string,Object>)=>{
                console.info(`${TAG}Testlog: onCustomDataChange callback registration no.1 triggered.`)
                console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
                flag += 1
            }
            let callback2 = (data:Record<string,Object>)=>{
                console.info(`${TAG}Testlog: onCustomDataChange callback registration no.2 triggered.`)
                console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
                flag += 10
            }
            session!.onCustomDataChange(callback1);
            session!.onCustomDataChange(callback2);
            session!.offCustomDataChange(callback1);
            await Utils.msSleep(100);
            controller!.sendCustomData(customData);
            await Utils.msSleep(300);
            expect(flag).assertEqual(10);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_STATIC_RETURNS_2100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_STATIC_RETURNS_2100
         * @tc.desc   test onSetLoopMode callback return value traverse
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_STATIC_RETURNS_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = '[SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_STATIC_RETURNS_2100]';
            let callbackMode:avSession.LoopMode | undefined;
            session!.onSetLoopMode((loopMode:avSession.LoopMode)=>{
                console.info(`${TAG}TestLog: onSetLoopMode callback triggers successfully, callback value is ${loopMode}.`);
                callbackMode = loopMode;
            });

            await controller!.sendControlCommand({
                command: 'setLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_SINGLE
            });
            console.info(`${TAG}TestLog: Controller send command successfully, mode is single`);
            await Utils.msSleep(200);
            expect(callbackMode).assertEqual(avSession.LoopMode.LOOP_MODE_SINGLE);

            await controller!.sendControlCommand({
                command: 'setLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_CUSTOM
            });
            console.info(`${TAG}TestLog: Controller send command successfully, mode is customed`);
            await Utils.msSleep(200);
            expect(callbackMode).assertEqual(avSession.LoopMode.LOOP_MODE_CUSTOM);

            await controller!.sendControlCommand({
                command: 'setLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_LIST
            });
            console.info(`${TAG}TestLog: Controller send command successfully, mode is list-play`);
            await Utils.msSleep(200);
            expect(callbackMode).assertEqual(avSession.LoopMode.LOOP_MODE_LIST);

            await controller!.sendControlCommand({
                command: 'setLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_SEQUENCE
            });
            console.info(`${TAG}TestLog: Controller send command successfully, mode is sequence`);
            await Utils.msSleep(200);
            expect(callbackMode).assertEqual(avSession.LoopMode.LOOP_MODE_SEQUENCE);

            await controller!.sendControlCommand({
                command: 'setLoopMode',
                parameter: avSession.LoopMode.LOOP_MODE_SHUFFLE
            });
            console.info(`${TAG}TestLog: Controller send command successfully, mode is shuffle`);
            await Utils.msSleep(200);
            expect(callbackMode).assertEqual(avSession.LoopMode.LOOP_MODE_SHUFFLE);

            await Utils.msSleep(300);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_0100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_0100
         * @tc.desc   test setBackgroundPlayMode - set mode as enable
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = '[SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_0100]';
            await session!.setBackgroundPlayMode(avSession.BackgroundPlayMode.ENABLE_BACKGROUND_PLAY).then(()=>{
                console.info(`${TAG}TestLog: setBackgroundPlayMode success, ENABLE_BACKGROUND_PLAY set successful!`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: setBackgroundPlayMode error occurred, error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await Utils.msSleep(300);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_0200
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_0200
         * @tc.desc   test setBackgroundPlayMode - set mode as disable
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = '[SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_0200]';
            await session!.setBackgroundPlayMode(avSession.BackgroundPlayMode.DISABLE_BACKGROUND_PLAY).then(()=>{
                console.info(`${TAG}TestLog: setBackgroundPlayMode success, DISABLE_BACKGROUND_PLAY set successful!`);
            }).catch((err) => {
                console.info(`${TAG}TestLog: setBackgroundPlayMode error occurred, error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            });
            await Utils.msSleep(300);
            done();
        })


        /**
         * @tc.number SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_ERRORCODE_0100
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_ERRORCODE_0100
         * @tc.desc   test setBackgroundPlayMode errcode 6600102
         * @tc.size   MediumTest
         * @tc.type   Function
         * @tc.level  Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let TAG = '[SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_STATIC_ERRORCODE_0100]';
            await session!.destroy();
            await session!.setBackgroundPlayMode(avSession.BackgroundPlayMode.ENABLE_BACKGROUND_PLAY).then(()=>{
                console.info(`${TAG}TestLog: setBackgroundPlayMode without avsession test fail, set successful!`);
                expect(false).assertTrue();
            }).catch((err) => {
                console.info(`${TAG}TestLog: setBackgroundPlayMode without avsession error occured, error: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            });
            session = null;
            done();
        })


    })
}


