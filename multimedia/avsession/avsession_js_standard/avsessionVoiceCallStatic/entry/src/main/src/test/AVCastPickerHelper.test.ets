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
import { AVCastPickerState, AVCastPickerStyle } from '@ohos.multimedia.avCastPickerParam';
import common from '@ohos.app.ability.common';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext;
export default function abilityTest() {
    describe('AVCastPickerHelperTest', () => {
        let TAG: string = "[AVCastPickerHelperTest]";

        beforeAll(() => {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info(`${TAG}: beforeAll in`);
        })

        beforeEach(async () => {
            console.info(`${TAG}: beforeEach in`);
            await Utils.msSleep(800);
            console.info(`${TAG}: beforeEach out`);
        })

        afterEach(async () => {
            console.info(`${TAG}: afterEach in`);
            console.info(`${TAG}: afterEach out`);
        })

        afterAll(() => {
            console.info(`${TAG}: afterAll in`);
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0100
         * @tc.desc   Testing on('hangUp')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let avCastPickerOptions: avSession.AVCastPickerOptions = {
                sessionType: 'video' as avSession.AVSessionType,
            }
            let avCastPicker: avSession.AVCastPickerHelper = new avSession.AVCastPickerHelper(context);
            try{
                await avCastPicker.select(avCastPickerOptions);
                console.info(`${TAG}: avCastPicker select successfully`);
            }catch(err: BusinessError){
                console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_STATIC_0100
         * @tc.desc   Testing on('hangUp')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let avCastPickerOptions : avSession.AVCastPickerOptions = {
                sessionType: 'video',
            }
            let avCastPicker = new avSession.AVCastPickerHelper(context);
            avCastPicker.onPickerStateChange((state: AVCastPickerState) => {
                console.info(`${TAG}: pickerStateChange received picker state change: ${state}`);
                if (state == AVCastPickerState.STATE_APPEARING || state == AVCastPickerState.STATE_DISAPPEARING) {
                    console.info('${TAG}: on pickerStateChange successfully');
                } else {
                    expect(false).assertTrue();
                }
                done();
            });
            try{
                await avCastPicker.select(avCastPickerOptions)
                console.info('${TAG}: avCastPicker select successfully');
            }catch(err: BusinessError){
                console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_STATIC_0200
         * @tc.desc   Testing on('hangUp')
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PICKERSTATECHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let flag: boolean = false;
            try {
                let avCastPickerOptions : avSession.AVCastPickerOptions = {
                    sessionType: 'video',
                }
                let avCastPicker = new avSession.AVCastPickerHelper(context);
                avCastPicker.onPickerStateChange((state: AVCastPickerState) => {
                    console.info(`${TAG}: pickerStateChange received picker state change: ${state}`);
                    if (state == AVCastPickerState.STATE_APPEARING || state == AVCastPickerState.STATE_DISAPPEARING) {
                        flag = true;
                    } else {
                        expect(false).assertTrue();
                    }
                });
                avCastPicker.offPickerStateChange();
                await avCastPicker.select(avCastPickerOptions);
                if (flag) {
                    console.info(`${TAG}: pickerStateChange off pickerStateChange fail`);
                    expect(false).assertTrue();
                }
                done();
            } catch (error: BusinessError) {
                console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0300
         * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0300
         * @tc.desc   sessionType: 'audio'
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let avCastPickerOptions : avSession.AVCastPickerOptions = {
                sessionType: 'audio',
            }
            let avCastPicker = new avSession.AVCastPickerHelper(context);
            try{
                await avCastPicker.select(avCastPickerOptions)
                console.info('${TAG}: avCastPicker select successfully');
            }catch(err: BusinessError){
                console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0400
         * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0400
         * @tc.desc   sessionType: 'voice_call'
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let avCastPickerOptions : avSession.AVCastPickerOptions = {
                sessionType: 'voice_call',
            }
            let avCastPicker = new avSession.AVCastPickerHelper(context);
            try{
                await avCastPicker.select(avCastPickerOptions)
                console.info('${TAG}: avCastPicker select successfully');
            }catch(err: BusinessError){
                console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0500
         * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0500
         * @tc.desc   sessionType: 'vioce_call'
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let avCastPickerOptions : avSession.AVCastPickerOptions = {
                sessionType: 'video_call',
            }
            let avCastPicker = new avSession.AVCastPickerHelper(context);
            try{
                await avCastPicker.select(avCastPickerOptions)
                console.info('${TAG}: avCastPicker select successfully');
            }catch(err: BusinessError){
                console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0600
         * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0600
         * @tc.desc   sessionType: 'vioce_call'
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let avCastPickerOptions : avSession.AVCastPickerOptions = {}
            let avCastPicker = new avSession.AVCastPickerHelper(context);
            try{
                await avCastPicker.select(avCastPickerOptions)
                console.info('${TAG}: avCastPicker select successfully');
            }catch(err: BusinessError){
                console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0700
         * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0700
         * @tc.desc   select()
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_AVSESSION_AVCASTPICKERHELPER_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let avCastPicker = new avSession.AVCastPickerHelper(context);
            try{
                await avCastPicker.select()
                console.info('${TAG}: avCastPicker select successfully');
            }catch(err){
                console.info(`${TAG}: avCastPicker select failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        })
    })
}