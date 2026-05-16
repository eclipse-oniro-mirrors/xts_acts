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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import avSession from '@ohos.multimedia.avsession';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext;
export default function abilityTest() {
    describe('AVSessionDistributedtest', () => {
        let TAG: string = "[AVSessionDistributedtest]";
        let session: avSession.AVSession | null = null;
        let controller: avSession.AVSessionController;

        beforeAll(async () => {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info(`${TAG}: beforeAll in`)
        })

        beforeEach(async () => {
            console.info(`${TAG}: beforeEach in`);
            console.info(`${TAG}: createAVSession begin`);
            let tag = "createNewSession"
            try{
                session = await avSession.createAVSession(context, tag, 'voice_call')
                console.info(`${TAG}: avSession create success`);
                console.info(`${session!.sessionType}`);
            }catch(err: BusinessError){
                console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
            };
            try{
                await session!.activate()
                console.info(`${TAG}: Session activate`);
            }catch(err: BusinessError){
                console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
            };
            try {
                controller = await session!.getController();
            } catch (err: BusinessError) {
                console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
            }
            await Utils.msSleep(800);
            console.info(`${TAG}: beforeEach out`);
        })

        afterEach(async () => {
            console.info(`${TAG}: afterEach in`)
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
            if (controller != null) {
                try{
                    await controller.destroy()
                    console.info(`${TAG}: Controller destroy success`);
                }catch(err: BusinessError){
                    console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`${TAG}: Controller is already destroy`);
            }
            console.info(`${TAG}: afterEach out`)
        })

        afterAll(() => {
            console.info(`${TAG}: afterAll in`)
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0200
         * @tc.desc   Testing getExtrasWithEvent
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            const COMMON_COMMAND_STRING = "AUDIO_GET_XXX";
            try{
                await controller.getExtrasWithEvent(COMMON_COMMAND_STRING)
                console.info(`${TAG}: getExtrasWithEvent successfully`);
            }catch(err: BusinessError){
                if (err.message == 'expect true, actualValue is false' || err.code == 6600105){
                    console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
                    expect(false).assertTrue();
                }
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0300
         * @tc.desc   Testing getExtrasWithEvent
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            const COMMON_COMMAND_STRING = "AUDIO_GET_VOLUME";
            let extras: avSession.ExtraInfo = await controller.getExtrasWithEvent(COMMON_COMMAND_STRING);
            console.info(`${TAG}: aduio get volume with ${JSON.stringify(extras)}`);
            if (JSON.stringify(extras) == '{}' ||
                (0 <= (extras[COMMON_COMMAND_STRING] as number) &&
                    (extras[COMMON_COMMAND_STRING] as number) <= 15)){
                console.info(`${TAG}: aduio get volume with ${extras[COMMON_COMMAND_STRING]}`);
                expect(true).assertTrue();
            } else {
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0400
         * @tc.desc   Testing getExtrasWithEvent
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            const COMMON_COMMAND_STRING = "AUDIO_GET_AVAILABLE_DEVICES";
            let extras: avSession.ExtraInfo;
            try{
                extras = await controller.getExtrasWithEvent(COMMON_COMMAND_STRING);
                console.info(` AUDIO_GET_AVAILABLE_DEVICES ${extras[COMMON_COMMAND_STRING]}`);
                expect(true).assertTrue();
            }catch(err: BusinessError){
                console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0500
         * @tc.desc   Testing getExtrasWithEvent
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            const COMMON_COMMAND_STRING = "AUDIO_GET_PREFERRED_OUTPUT_DEVICE_FOR_RENDERER_INFO";
            let extras: avSession.ExtraInfo;
            try{
                extras = await controller.getExtrasWithEvent(COMMON_COMMAND_STRING);
                console.info(` AUDIO_GET_PREFERRED_OUTPUT_DEVICE_FOR_RENDERER_INFO ${extras[COMMON_COMMAND_STRING]}`);
            }catch(err: BusinessError){
                console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })
    })
}