/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

// @ts-nocheck
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import reminderAgent from '@ohos.reminderAgentManager'
import notificationManager from '@ohos.notificationManager';

export default function ReminderAgentManagerOnlyMainTest() {
    describe('ReminderAgentManagerOnlyMainTest', function () {
        beforeAll(function () {

            /*
             * @tc.setup: setup invoked before all testcases
             */
            console.info('beforeAll called')

            reminderAgent.cancelAllReminders().then(() => {
              console.info('beforeAll cancelAllReminders success');
            }).catch((err) => {
              console.error("beforeAll cancelAllReminders promise err code:" + err.code + " message:" + err.message);
            });
        })

        afterAll(function () {

            /*
             * @tc.teardown: teardown invoked after all testcases
             */
            console.info('afterAll called')

            reminderAgent.cancelAllReminders().then(() => {
              console.info('afterAll cancelAllReminders success');
            }).catch((err) => {
              console.error("afterAll cancelAllReminders promise err code:" + err.code + " message:" + err.message);
            });
        })

        beforeEach(function () {

            /*
             * @tc.setup: setup invoked before each testcases
             */
            console.info('beforeEach called')
        })

        afterEach(function () {

            /*
             * @tc.teardown: teardown invoked after each testcases
             */
            console.info('afterEach called')
        })

        console.info('start################################start');

        /**
         * @tc.number: reminderRequestAttribute_0031
         * @tc.name: reminderRequestAttribute_0031
         * @tc.desc: test ReminderRequest Attribute titleResourceId
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderRequestAttribute_0031", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderRequestAttribute_0031---------------------------');
            const currentYear = new Date().getFullYear();
            const nextYear = currentYear + 1
            let ReminderRequest = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: nextYear,
                    month: 1,
                    day: 11,
                    hour: 11,
                    minute: 11,
                    second: 11
                },
                actionButton: [
                    {
                        title: 'close',
                        type: 0,
                    }
                ],
                titleResourceId: 123
            }
            try {
                reminderAgent.publishReminder(ReminderRequest, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0031 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0031 callback reminderId = ' + reminderId);
                        let id = reminderId;
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("reminderRequestAttribute_0031 publishReminder error.code:" + error.code);
            }
        })


        /**
         * @tc.number: reminderRequestAttribute_0032
         * @tc.name: reminderRequestAttribute_0032
         * @tc.desc: test ReminderRequest Attribute contentResourceId
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderRequestAttribute_0032", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderRequestAttribute_0032---------------------------');
            const currentYear = new Date().getFullYear();
            const nextYear = currentYear + 1
            let ReminderRequest = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: nextYear,
                    month: 1,
                    day: 11,
                    hour: 11,
                    minute: 11,
                    second: 11
                },
                actionButton: [
                    {
                        title: 'close',
                        type: 0,
                    }
                ],
                contentResourceId: 123
            }
            try {
                reminderAgent.publishReminder(ReminderRequest, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0032 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0032 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("reminderRequestAttribute_0032 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number: reminderRequestAttribute_0033
         * @tc.name: reminderRequestAttribute_0033
         * @tc.desc: test ReminderRequest Attribute expiredContentResourceId
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderRequestAttribute_0033", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderRequestAttribute_0033---------------------------');
            const currentYear = new Date().getFullYear();
            const nextYear = currentYear + 1
            let ReminderRequest = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: nextYear,
                    month: 1,
                    day: 11,
                    hour: 11,
                    minute: 11,
                    second: 11
                },
                actionButton: [
                    {
                        title: 'close',
                        type: 0,
                    }
                ],
                expiredContentResourceId: 123
            }
            try {
                reminderAgent.publishReminder(ReminderRequest, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0033 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0033 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("reminderRequestAttribute_0033 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number: reminderRequestAttribute_0034
         * @tc.name: reminderRequestAttribute_0034
         * @tc.desc: test ReminderRequest Attribute snoozeContentResourceId
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderRequestAttribute_0034", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderRequestAttribute_0034---------------------------');
            const currentYear = new Date().getFullYear();
            const nextYear = currentYear + 1
            let ReminderRequest = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: nextYear,
                    month: 1,
                    day: 11,
                    hour: 11,
                    minute: 11,
                    second: 11
                },
                actionButton: [
                    {
                        title: 'close',
                        type: 0,
                    }
                ],
                snoozeContentResourceId: 123
            }
            try {
                reminderAgent.publishReminder(ReminderRequest, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0034 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0034 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("reminderRequestAttribute_0034 publishReminder error.code:" + error.code);
            }
        })
    })
}
