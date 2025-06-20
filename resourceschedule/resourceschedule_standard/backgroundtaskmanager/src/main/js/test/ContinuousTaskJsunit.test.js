/*
 * Copyright (C) 2022-2025 Huawei Device Co., Ltd.
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

import backgroundTaskManager from '@ohos.backgroundTaskManager';
import featureAbility from '@ohos.ability.featureAbility';
import commonEvent from '@ohos.commonEvent';

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from '@ohos/hypium';

const TAG = "ContinuousTaskJsTest ";
let subscribe_;

export default function ContinuousTaskJsTest() {
describe("ContinuousTaskJsTest", function () {
    beforeAll(function() {
        
        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll called');
    })
    
    afterAll(function() {
        
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
         console.info('afterAll called');
    })
    
    beforeEach(function() {
        
        /*
         * @tc.setup: setup invoked before each testcases
         */
         console.info('beforeEach called');
    })
    
    afterEach(function() {
       
        /*
         * @tc.teardown: teardown invoked after each testcases
         */
         console.info('afterEach called');
    })

    async function startAbilityWithOption(subscribeInfo, option, event, done) {
        commonEvent.createSubscriber(subscribeInfo, (err, subscriber) => {
            if (subscriber !== null && subscriber !== undefined) {
                console.info(TAG + "Subscribe begin");
                subscribe_ = subscriber;
                commonEvent.subscribe(subscribe_, (err, data) => {
                    if (data !== null && data !== undefined) {
                        console.info(TAG + "Get comment event: " + JSON.stringify(data));
                        if (data.event === event) {
                            expect(true).assertTrue();
                        } else {
                            expect(false).assertTrue();
                        }
                    } else {
                        console.error(TAG + "SubscribeCallBack failed");
                        expect(false).assertTrue();
                    }
                    done();
                })
            } else {
                console.error(TAG + "createSubscriber failed");
                expect(false).assertTrue();
                done();
            }
        })

        setTimeout(() => {
            console.info(TAG + "Start ability with option:" + option + " begin");
            featureAbility.startAbility(
                {
                want: {
                    bundleName: "ohos.acts.resourceschedule.taskmgr.js.function",
                    abilityName: "ohos.acts.resourceschedule.taskmgr.js.function.ServiceAbility",
                    parameters: {
                        option: option
                    }
                }
                }
            ).catch(() => {
                console.error(TAG + "Start ability failed");
                expect(false).assertTrue();
                done();
            });
        }, 1000);
    }

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_001
     * @tc.name:ContinuousTaskJsTest001
     * @tc.desc:verify old startBackgroundrunning interface callback mode work properly
     */
    it("ContinuousTaskJsTest001", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest001 begin--------------------');
        startAbilityWithOption({ events: ["startTaskUseApi7Callback"] }, "testcase1", "startTaskUseApi7Callback", done);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_002
     * @tc.name:ContinuousTaskJsTest002
     * @tc.desc:verify cancelBackgroundrunning interface callback mode work properly
     */
    it("ContinuousTaskJsTest002", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest002 begin--------------------');
        startAbilityWithOption({ events: ["stopTaskUseApi7Callback"] }, "testcase2", "stopTaskUseApi7Callback", done);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_003
     * @tc.name:ContinuousTaskJsTest003
     * @tc.desc:verify new startBackgroundrunning interface callback mode work properly
     */
    it("ContinuousTaskJsTest003", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest003 begin--------------------');
        startAbilityWithOption({ events: ["startTaskUseApi8Callback"] }, "testcase3", "startTaskUseApi8Callback", done);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_004
     * @tc.name:ContinuousTaskJsTest004
     * @tc.desc:verify new stopBackgroundrunning interface callback mode work properly
     */
    it("ContinuousTaskJsTest004", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest004 begin--------------------');
        startAbilityWithOption({ events: ["stopTaskUseApi8Callback"] }, "testcase4", "stopTaskUseApi8Callback", done);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_005
     * @tc.name:ContinuousTaskJsTest005
     * @tc.desc:verify old startBackgroundrunning interface promise mode work properly
     */
    it("ContinuousTaskJsTest005", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest005 begin--------------------');
        startAbilityWithOption({ events: ["startTaskUseApi7Promise"] }, "testcase5", "startTaskUseApi7Promise", done);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_006
     * @tc.name:ContinuousTaskJsTest006
     * @tc.desc:verify cancelBackgroundrunning interface promise mode work properly
     */
    it("ContinuousTaskJsTest006", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest006 begin--------------------');
        startAbilityWithOption({ events: ["stopTaskUseApi7Promise"] }, "testcase6", "stopTaskUseApi7Promise", done);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_007
     * @tc.name:ContinuousTaskJsTest007
     * @tc.desc:verify new startBackgroundrunning interface promise mode work properly
     */
    it("ContinuousTaskJsTest007", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest007 begin--------------------');
        startAbilityWithOption({ events: ["startTaskUseApi8Promise"] }, "testcase7", "startTaskUseApi8Promise", done);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_008
     * @tc.name:ContinuousTaskJsTest008
     * @tc.desc:verify new stopBackgroundrunning interface promise mode work properly
     */
    it("ContinuousTaskJsTest008", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest008 begin--------------------');
        startAbilityWithOption({ events: ["stopTaskUseApi8Promise"] }, "testcase8", "stopTaskUseApi8Promise", done);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_009
     * @tc.name:ContinuousTaskJsTest009
     * @tc.desc:verify continuous task request failed with invalid background mode
     */
    it("ContinuousTaskJsTest009", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest009 begin--------------------');
        startAbilityWithOption({ events: ["startTaskInvalidBgmode"] }, "testcase9", "startTaskInvalidBgmode", done);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_0010
     * @tc.name: ContinuousTaskJsTest010
     * @tc.desc: test backgroudManager BackgroudMode constant
     */
    it("ContinuousTaskJsTest010", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest010 begin--------------------');
        let value1 = backgroundTaskManager.BackgroundMode.DATA_TRANSFER;
        expect(value1).assertEqual(1);
        done();
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_0011
     * @tc.name: ContinuousTaskJsTest011
     * @tc.desc: test backgroudManager BackgroudMode constant
     */
    it("ContinuousTaskJsTest011", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest011 begin--------------------');
        let value1 = backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK;
        expect(value1).assertEqual(2);
        done();
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_0012
     * @tc.name: ContinuousTaskJsTest012
     * @tc.desc: test backgroudManager BackgroudMode constant
     */
    it("ContinuousTaskJsTest012", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest012 begin--------------------');
        let value1 = backgroundTaskManager.BackgroundMode.AUDIO_RECORDING;
        expect(value1).assertEqual(3);
        done();
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_0013
     * @tc.name: ContinuousTaskJsTest013
     * @tc.desc: test backgroudManager BackgroudMode constant
     */
    it("ContinuousTaskJsTest013", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest013 begin--------------------');
        let value1 = backgroundTaskManager.BackgroundMode.LOCATION;
        expect(value1).assertEqual(4);
        done();
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_0014
     * @tc.name: ContinuousTaskJsTest014
     * @tc.desc: test backgroudManager BackgroudMode constant
     */
    it("ContinuousTaskJsTest014", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest014 begin--------------------');
        let value1 = backgroundTaskManager.BackgroundMode.BLUETOOTH_INTERACTION;
        expect(value1).assertEqual(5);
        done();
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_0015
     * @tc.name: ContinuousTaskJsTest015
     * @tc.desc: test backgroudManager BackgroudMode constant
     */
    it("ContinuousTaskJsTest015", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest015 begin--------------------');
        let value1 = backgroundTaskManager.BackgroundMode.MULTI_DEVICE_CONNECTION;
        expect(value1).assertEqual(6);
        done();
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_0016
     * @tc.name: ContinuousTaskJsTest016
     * @tc.desc: test backgroudManager BackgroudMode constant
     */
    it("ContinuousTaskJsTest016", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest016 begin--------------------');
        let value1 = backgroundTaskManager.BackgroundMode.TASK_KEEPING;
        expect(value1).assertEqual(9);
        done();
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_017
     * @tc.name:ContinuousTaskJsTest017
     * @tc.desc:verify continuous task updateBackgroundRunning
     */
    it("ContinuousTaskJsTest017", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest017 begin--------------------');
        startAbilityWithOption({ events: ["updateTaskUseApi12Promise"] }, "testcase10", "updateTaskUseApi12Promise", done);
    })

    /*
     * @tc.number:SUB_RESOURCESCHEDULE_LONG_TASK_XTS_0018
     * @tc.name: ContinuousTaskJsTest018
     * @tc.desc: test backgroudManager BackgroudMode constant
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 3
     * @tc.require
     */
    it("ContinuousTaskJsTest018", Level.LEVEL0, async function (done) {
        console.info(TAG + '-----------------ContinuousTaskJsTest018 begin--------------------');
        let value1 = backgroundTaskManager.BackgroundMode.VOIP;
        expect(value1).assertEqual(8);
        done();
    })
})}
