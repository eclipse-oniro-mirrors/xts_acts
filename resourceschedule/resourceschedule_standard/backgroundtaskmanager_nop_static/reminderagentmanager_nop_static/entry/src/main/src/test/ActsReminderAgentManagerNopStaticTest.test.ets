/**
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
import notificationManager from '@ohos.notificationManager';
import reminderAgentManager from '@ohos.reminderAgentManager'
import hilog from '@ohos.hilog'
import { Component,Driver,ON,On,MatchPattern,MouseButton,WindowMode,UIElementInfo,UiDirection,PointerMatrix,DisplayRotation } from '@ohos.UiTest'
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach} from "../../../hypium/index";
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'

const PERMISSION_DENIED_CODE = 201
const PERMISSION_DENIED_MSG = 'Permission denied.'

export default function ActsReminderAgentManagerNopStaticTest() {
    describe('ActsReminderAgentManagerNopStaticTest', () => {
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(() => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })

        afterAll(() => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_001
         * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_001
         * @tc.desc   Using the publishReminder callback method without permission
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_001----before----');
            let timer: reminderAgentManager.ReminderRequestTimer = {
                reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10 as long
            }

            reminderAgentManager.publishReminder(timer, (err: BusinessError<void>|null, reminderId: int|undefined) => {
                if (err?.code) {
                    console.info('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_001 callback err.code is :' + err?.code);
                    expect(err?.code).assertEqual(PERMISSION_DENIED_CODE);
                    done();
                } else {
                    console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_001 callback, reminderId = " + reminderId);
                }
            });
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_001----after----');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_002
         * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_002
         * @tc.desc   Using the publishReminder then method without permission
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_002----before----');
            let timer: reminderAgentManager.ReminderRequestTimer = {
                reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10
            }

            reminderAgentManager.publishReminder(timer).then((reminderId: int|undefined) => {
                console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_002 promise, reminderId = " + reminderId);
            }).catch((err: Error) => {
                console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_002 promise err code:" + err.code + " message:" + err.message);
                expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
            });
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_002----after----');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_003
         * @tc.name    SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_003
         * @tc.desc   Using the publishReminder then method without permission
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_003----before----');
            reminderAgentManager.getAllValidReminders().then((reminders: Array<reminderAgentManager.ReminderInfo>) => {
                console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_003 promise, getAllValidReminders length = " + reminders.length);
            }).catch((err: Error) => {
                console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_003 promise err code:" + err.code + " message:" + err.message);
                expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
            });
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_003----after----');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_004
         * @tc.name    SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_004
         * @tc.desc   Using the publishReminder then method without permission
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_004----before----');
            let reminderId: int = 1;
            let date: Date = new Date();
            reminderAgentManager.addExcludeDate(reminderId, date).then(() => {
                console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_004 addExcludeDate promise");
            }).catch((err: Error) => {
                console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_004 promise err code:" + err.code + " message:" + err.message);
                expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
            });
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_004----after----');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_005
         * @tc.name    SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_005
         * @tc.desc   Using the getExcludeDates then method without permission
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_005----before----');
            let reminderId: int = 1;
            reminderAgentManager.getExcludeDates(reminderId).then((dates: Array<Date>) => {
                console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_005 getExcludeDates promise length: " + dates.length);
            }).catch((err: Error) => {
                console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_005 promise err code:" + err.code + " message:" + err.message);
                expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
            });
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_005----after----');
        })

        /**
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_006
         * @tc.name    SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_006
         * @tc.desc   Using the deleteExcludeDates then method without permission
         * @tc.level  LEVEL0
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         */
        it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_006----before----');
            let reminderId: int = 1;
            reminderAgentManager.deleteExcludeDates(reminderId).then(() => {
                console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_006 deleteExcludeDates promise");
            }).catch((err: Error) => {
                console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_006 promise err code:" + err.code + " message:" + err.message);
                expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
                done();
            });
            console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_006----after----');
        })

        // /**
        //  * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_007
        //  * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_007
        //  * @tc.desc   Using the updateReminder then method without permission
        //  * @tc.level  LEVEL0
        //  * @tc.type   FUNCTION
        //  * @tc.size   MEDIUMTEST
        //  */
        //  it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
        //     console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_007----before----');
        //     let reminderId: int = 1;
        //     let timer: reminderAgentManager.ReminderRequestTimer = {
        //         reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
        //         triggerTimeInSeconds: 10 as long
        //     }
        //     reminderAgentManager.updateReminder(reminderId, timer).then(() => {
        //         console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_007 updateReminder promise");
        //     }).catch((err: Error) => {
        //         console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_007 promise err code:" + err.code + " message:" + err.message);
        //         expect(err.code).assertEqual(PERMISSION_DENIED_CODE);
        //         done();
        //     });
        //     console.info('--------SUB_RESOURCESCHEDULE_REMINDER_MANAGER_NOP_STATIC_XTS_007----after----');
        //  })

    })
}

