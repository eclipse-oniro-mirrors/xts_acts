/*
 * Copyright (C) 2021-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
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

export default function ReminderAgentManagerCoverageTest() {
    describe('ReminderAgentManagerCoverageTest', function () {
        
        beforeAll(function () {

            /*
             * @tc.setup: setup invoked before all testcases
             */
            console.info('ReminderAgentManagerCoverageTest beforeAll called')
        })

        afterAll(function () {

            /*
             * @tc.teardown: teardown invoked after all testcases
             */
            console.info('ReminderAgentManagerCoverageTest afterAll called')
        })

        beforeEach(function () {

            /*
             * @tc.setup: setup invoked before each testcases
             */
            console.info('ReminderAgentManagerCoverageTest beforeEach called')
        })

        afterEach(function () {

            /*
             * @tc.teardown: teardown invoked after each testcases
             */
            console.info('ReminderAgentManagerCoverageTest afterEach called')
        })

        console.info('ReminderAgentManagerCoverageTest start################################start');

        /**
         * @tc.name   publishReminder_callback_ringChannel_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_RINGCHANNEL_001
         * @tc.desc   test publishReminder callback with ringChannel RING_CHANNEL_MEDIA.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_ringChannel_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_ringChannel_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                ringChannel: reminderAgent.RingChannel.RING_CHANNEL_MEDIA,
                ringDuration: 5
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_ringChannel_001 callback err.code is :' + err.code);
                    } else {
                        console.info('publishReminder_callback_ringChannel_001 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_ringChannel_001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_callback_slotType_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_SLOTTYPE_001
         * @tc.desc   test publishReminder callback with slotType UNKNOWN_TYPE.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_slotType_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_slotType_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                slotType: notificationManager.SlotType.UNKNOWN_TYPE
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_slotType_001 callback err.code is :' + err.code);
                    } else {
                        console.info('publishReminder_callback_slotType_001 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_slotType_001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_callback_slotType_002
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_SLOTTYPE_002
         * @tc.desc   test publishReminder callback with slotType SOCIAL_COMMUNICATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_slotType_002", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_slotType_002---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                slotType: notificationManager.SlotType.SOCIAL_COMMUNICATION
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_slotType_002 callback err.code is :' + err.code);
                    } else {
                        console.info('publishReminder_callback_slotType_002 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_slotType_002 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_callback_slotType_003
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_SLOTTYPE_003
         * @tc.desc   test publishReminder callback with slotType CONTENT_INFORMATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_slotType_003", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_slotType_003---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                slotType: notificationManager.SlotType.CONTENT_INFORMATION
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_slotType_003 callback err.code is :' + err.code);
                    } else {
                        console.info('publishReminder_callback_slotType_003 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_slotType_003 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_callback_slotType_004
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_SLOTTYPE_004
         * @tc.desc   test publishReminder callback with slotType OTHER_TYPES.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_slotType_004", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_slotType_004---------------------------');
            let timer = {
                reminderType:          reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                slotType: notificationManager.SlotType.OTHER_TYPES
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_slotType_004 callback err.code is :' + err.code);
                    } else {
                        console.info('publishReminder_callback_slotType_004 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_slotType_004 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_callback_tapDismissed_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_TAPDISMISSED_001
         * @tc.desc   test publishReminder callback with tapDismissed false.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_tapDismissed_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_tapDismissed_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                tapDismissed: false
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_tapDismissed_001 callback err.code is :' + err.code);
                    } else {
                        console.info('publishReminder_callback_tapDismissed_001 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_tapDismissed_001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_callback_snoozeSlotType_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGERATER_PUBLISHREMINDER_CALLBACK_SNOOZESLOTTYPE_001
         * @tc.desc   test publishReminder callback with snoozeSlotType UNKNOWN_TYPE.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_snoozeSlotType_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_snoozeSlotType_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                snoozeTimes: 1,
                timeInterval: 5,
                snoozeSlotType: notificationManager.SlotType.UNKNOWN_TYPE
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_snoozeSlotType_001 callback err.code is :' + err.code);
                    } else {
                        console.info('publishReminder_callback_snoozeSlotType_001 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_snoozeSlotType_001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_callback_snoozeSlotType_002
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_SNOOZESLOTTYPE_002
         * @tc.desc   test publishReminder callback with snoozeSlotType SOCIAL_COMMUNICATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_snoozeSlotType_002", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_snoozeSlotType_002---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                snoozeTimes: 1,
                timeInterval: 5,
                snoozeSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_snoozeSlotType_002 callback err.code is :' + err.code);
                    } else {
                        console.info('publishReminder_callback_snoozeSlotType_002 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_snoozeSlotType_002 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_callback_snoozeSlotType_003
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_SNOOZESLOTTYPE_003
         * @tc.desc   test publishReminder callback with snoozeSlotType CONTENT_INFORMATION.
         * @tc.type   FUNCTION
         *wc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_snoozeSlotType_003", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_snoozeSlotType_003---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                snoozeTimes: 1,
                timeInterval: 5,
                snoozeSlotType: notificationManager.SlotType.CONTENT_INFORMATION
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_snoozeSlotType_003 callback err.code is :' + err.code);
                    } else {
                        console.info('publishReminder_callback_snoozeSlotType_003 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_snoozeSlotType_003 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_callback_snoozeSlotType_004
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_SNOOZESLOTTYPE_004
         * @tc.desc   test publishReminder callback with snoozeSlotType OTHER_TYPES.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_snoozeSlotType_004", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_snoozeSlotType_004---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                snoozeTimes: 1,
                timeInterval: 5,
                snoozeSlotType: notificationManager.SlotType.OTHER_TYPES
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_snoozeSlotType_004 callback err.code is :' + err.code);
                    } else {
                        console.info('publishReminder_callback_snoozeSlotType_004 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_snoozeSlotType_004 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_ringChannel_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_RINGCHANNEL_001
         * @tc.desc   test publishReminder promise with ringChannel RING_CHANNEL_ALARM.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_ringChannel_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_ringChannel_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                ringChannel: reminderAgent.RingChannel.RING_CHANNEL_ALARM,
                ringDuration: 5
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_ringChannel_001 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_ringChannel_001 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_ringChannel_001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_ringChannel_002
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_RINGCHANNEL_002
         * @tc.desc   test publishReminder promise with ringChannel RING_CHANNEL_MEDIA.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_ringChannel_002", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_ringChannel_002---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                ringChannel: reminderAgent.RingChannel.RING_CHANNEL_MEDIA,
                ringDuration: 5
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_ringChannel_002 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_ringChannel_002 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_ringChannel_002 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_ringChannel_003
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_RINGCHANNEL_003
         * @tc.desc   test publishReminder promise with ringChannel RING_CHANNEL_NOTIFICATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_ringChannel_003", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_ringChannel_003---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                ringChannel: reminderAgent.RingChannel.RING_CHANNEL_NOTIFICATION,
                ringDuration: 5
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_ringChannel_003 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_ringChannel_003 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_ringChannel_003 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_slotType_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_SLOTTYPE_001
         * @tc.desc   test publishReminder promise with slotType UNKNOWN_TYPE.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_slotType_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_slotType_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                slotType: notificationManager.SlotType.UNKNOWN_TYPE
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_slotType_001 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_slotType_001 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_slotType_001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_slotType_002
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_SLOTTYPE_002
         * @tc.desc   test publishReminder promise with slotType SERVICE_INFORMATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_slotType_002", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_slotType_002---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                slotType: notificationManager.SlotType.SERVICE_INFORMATION
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_slotType_002 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_slotType_002 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_slotType_002 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_slotType_003
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_SLOTTYPE_003
         * @tc.desc   test publishReminder promise with slotType CONTENT_INFORMATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_slotType_003", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_slotType_003---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                slotType: notificationManager.SlotType.CONTENT_INFORMATION
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_slotType_003 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_slotType_003 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_slotType_003 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_slotType_004
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_SLOTTYPE_004
         * @tc.desc   test publishReminder promise with slotType OTHER_TYPES.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_slotType_004", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_slotType_004---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                slotType: notificationManager.SlotType.OTHER_TYPES
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_slotType_004 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_slotType_004 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_slotType_004 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_tapDismissed_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_TAPDISMISSED_001
         * @tc.desc   test publishReminder promise with tapDismissed true.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_tapDismissed_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_tapDismissed_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                tapDismissed: true
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_tapDismissed_001 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_tapDismissed_001 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_tapDismissed_001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_tapDismissed_002
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_TAPDISMISSED_002
         * @tc.desc   test publishReminder promise with tapDismissed false.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_tapDismissed_002", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_tapDismissed_002---------------------------');
            let timer = {
                reminderType:          reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                tapDismissed: false
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_tapDismissed_002 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_tapDismissed_002 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_tapDismissed_002 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_snoozeSlotType_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_SNOOZESLOTTYPE_001
         * @tc.desc   test publishReminder promise with snoozeSlotType UNKNOWN_TYPE.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_snoozeSlotType_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_snoozeSlotType_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                snoozeTimes: 1,
                timeInterval: 5,
                snoozeSlotType: notificationManager.SlotType.UNKNOWN_TYPE
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_snoozeSlotType_001 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_snoozeSlotType_001 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_snoozeSlotType_001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_snoozeSlotType_002
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_SNOOZESLOTTYPE_002
         * @tc.desc   test publishReminder promise with snoozeSlotType SOCIAL_COMMUNICATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_snoozeSlotType_002", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_snoozeSlotType_002---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                snoozeTimes: 1,
                timeInterval: 5,
                snoozeSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_snoozeSlotType_002 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_snoozeSlotType_002 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_snoozeSlotType_002 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_snoozeSlotType_003
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_SNOOZESLOTTYPE_003
         * @tc.desc   test publishReminder promise with snoozeSlotType SERVICE_INFORMATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_snoozeSlotType_003", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_snoozeSlotType_003---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                snoozeTimes: 1,
                timeInterval: 5,
                snoozeSlotType: notificationManager.SlotType.SERVICE_INFORMATION
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_snoozeSlotType_003 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_snoozeSlotType_003 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_snoozeSlotType_003 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_snoozeSlotType_004
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_SNOOZESLOTTYPE_004
         * @tc.desc   test publishReminder promise with snoozeSlotType CONTENT_INFORMATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_snoozeSlotType_004", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_snoozeSlotType_004---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                snoozeTimes: 1,
                timeInterval: 5,
                snoozeSlotType: notificationManager.SlotType.CONTENT_INFORMATION
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_snoozeSlotType_004 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_snoozeSlotType_004 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_snoozeSlotType_004 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_snoozeSlotType_005
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_SNOOZESLOTTYPE_005
         * @tc.desc   test publishReminder promise with snoozeSlotType OTHER_TYPES.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_snoozeSlotType_005", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_snoozeSlotType_005---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                snoozeTimes: 1,
                timeInterval: 5,
                snoozeSlotType: notificationManager.SlotType.OTHER_TYPES
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_snoozeSlotType_005 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_snoozeSlotType_005 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_snoozeSlotType_005 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_customRingUri_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_CUSTOMRINGURI_001
         * @tc.desc   test publishReminder promise with customRingUri empty string.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_customRingUri_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_customRingUri_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                customRingUri: ""
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_customRingUri_001 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_customRingUri_001 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_customRingUri_001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_promise_wantAgentUri_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_WANTAGENTURI_001
         * @tc.desc   test publishReminder promise with wantAgent.uri empty string.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_wantAgentUri_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_wantAgentUri_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                wantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagentMgr.js.function",
                    abilityName: "ohos.acts.resourceschedule.reminderagentMgr.js.function.MainAbility",
                    uri: ""
                }
            }
            try {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    console.info('publishReminder_promise_wantAgentUri_001 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_wantAgentUri_001 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.log("publishReminder_promise_wantAgentUri_001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.name   removeNotificationSlot_callback_slotType_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_REMOVENOTIFICATIONSLOT_CALLBACK_SLOTTYPE_001
         * @tc.desc   test removeNotificationSlot callback with slotType UNKNOWN_TYPE.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("removeNotificationSlot_callback_slotType_001", Level.LEVEL0, async function (done) {
            console.info('----------------------removeNotificationSlot_callback_slotType_001---------------------------');
            try {
                reminderAgent.removeNotificationSlot(notificationManager.SlotType.UNKNOWN_TYPE, (err) => {
                    if (err) {
                        console.info('removeNotificationSlot_callback_slotType_001 callback err.code is :' + err.code);
                    } else {
                        console.info('removeNotificationSlot_callback_slotType_001 callback success');
                        expect(true).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.info("removeNotificationSlot_callback_slotType_001 error.code:" + error.code);
            }
        })

        /**
         * @tc.name   removeNotificationSlot_callback_slotType_002
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_REMOVENOTIFICATIONSLOT_CALLBACK_SLOTTYPE_002
         * @tc.desc   test removeNotificationSlot callback with slotType SOCIAL_COMMUNICATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("removeNotificationSlot_callback_slotType_002", Level.LEVEL0, async function (done) {
            console.info('----------------------removeNotificationSlot_callback_slotType_002---------------------------');
            try {
                reminderAgent.removeNotificationSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION, (err) => {
                    if (err) {
                        console.info('removeNotificationSlot_callback_slotType_002 callback err.code is :' + err.code);
                    } else {
                        console.info('removeNotificationSlot_callback_slotType_002 callback success');
                        expect(true).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.info("removeNotificationSlot_callback_slotType_002 error.code:" + error.code);
            }
        })

        /**
         * @tc.name   removeNotificationSlot_callback_slotType_003
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_REMOVENOTIFICATIONSLOT_CALLBACK_SLOTTYPE_003
         * @tc.desc   test removeNotificationSlot callback with slotType SERVICE_INFORMATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("removeNotificationSlot_callback_slotType_003", Level.LEVEL0, async function (done) {
            console.info('----------------------removeNotificationSlot_callback_slotType_003---------------------------');
            try {
                reminderAgent.removeNotificationSlot(notificationManager.SlotType.SERVICE_INFORMATION, (err) => {
                    if (err) {
                        console.info('removeNotificationSlot_callback_slotType_003 callback err.code is :' + err.code);
                    } else {
                        console.info('removeNotificationSlot_callback_slotType_003 callback success');
                        expect(true).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.info("removeNotificationSlot_callback_slotType_003 error.code:" + error.code);
            }
        })

        /**
         * @tc.name   removeNotificationSlot_callback_slotType_004
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_REMOVENOTIFICATIONSLOT_CALLBACK_SLOTTYPE_004
         * @tc.desc   test removeNotificationSlot callback with slotType CONTENT_INFORMATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("removeNotificationSlot_callback_slotType_004", Level.LEVEL0, async function (done) {
            console.info('----------------------removeNotificationSlot_callback_slotType_004---------------------------');
            try {
                reminderAgent.removeNotificationSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err) => {
                    if (err) {
                        console.info('removeNotificationSlot_callback_slotType_004 callback err.code is :' + err.code);
                    } else {
                        console.info('removeNotificationSlot_callback_slotType_004 callback success');
                        expect(true).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.info("removeNotificationSlot_callback_slotType_004 error.code:" + error.code);
            }
        })

        /**
         * @tc.name   removeNotificationSlot_callback_slotType_005
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_REMOVENOTIFICATIONSLOT_CALLBACK_SLOTTYPE_005
         * @tc.desc   test removeNotificationSlot callback with slotType OTHER_TYPES.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("removeNotificationSlot_callback_slotType_005", Level.LEVEL0, async function (done) {
            console.info('----------------------removeNotificationSlot_callback_slotType_005---------------------------');
            try {
                reminderAgent.removeNotificationSlot(notificationManager.SlotType.OTHER_TYPES, (err) => {
                    if (err) {
                        console.info('removeNotificationSlot_callback_slotType_005 callback err.code is :' + err.code);
                    } else {
                        console.info('removeNotificationSlot_callback_slotType_005 callback success');
                        expect(true).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.info("removeNotificationSlot_callback_slotType_005 error.code:" + error.code);
            }
        })

        /**
         * @tc.name   removeNotificationSlot_promise_slotType_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_REMOVENOTIFICATIONSLOT_PROMISE_SLOTTYPE_001
         * @tc.desc   test removeNotificationSlot promise with slotType UNKNOWN_TYPE.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("removeNotificationSlot_promise_slotType_001", Level.LEVEL0, async function (done) {
            console.info('----------------------removeNotificationSlot_promise_slotType_001---------------------------');
            try {
                reminderAgent.removeNotificationSlot(notificationManager.SlotType.UNKNOWN_TYPE).then(() => {
                    console.info("removeNotificationSlot_promise_slotType_001 promise success");
                    expect(true).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("removeNotificationSlot_promise_slotType_001 promise err.code:" + err.code);
                });
            } catch (error) {
                console.info("removeNotificationSlot_promise_slotType_001 error.code:" + error.code);
            }
        })

        /**
         * @tc.name   removeNotificationSlot_promise_slotType_002
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_REMOVENOTIFICATIONSLOT_PROMISE_SLOTTYPE_002
         * @tc.desc   test removeNotificationSlot promise with slotType SOCIAL_COMMUNICATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("removeNotificationSlot_promise_slotType_002", Level.LEVEL0, async function (done) {
            console.info('----------------------removeNotificationSlot_promise_slotType_002---------------------------');
            try {
                reminderAgent.removeNotificationSlot(notificationManager.SlotType.SOCIAL_COMMUNICATION).then(() => {
                    console.info("removeNotificationSlot_promise_slotType_002 promise success");
                    expect(true).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("removeNotificationSlot_promise_slotType_002 promise err.code:" + err.code);
                });
            } catch (error) {
                console.info("removeNotificationSlot_promise_slotType_002 error.code:" + error.code);
            }
        })

        /**
         * @tc.name   removeNotificationSlot_promise_slotType_003
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_REMOVENOTIFICATIONSLOT_PROMISE_SLOTTYPE_003
         * @tc.desc   test removeNotificationSlot promise with slotType SERVICE_INFORMATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("removeNotificationSlot_promise_slotType_003", Level.LEVEL0, async function (done) {
            console.info('----------------------removeNotificationSlot_promise_slotType_003---------------------------');
            try {
                reminderAgent.removeNotificationSlot(notificationManager.SlotType.SERVICE_INFORMATION).then(() => {
                    console.info("removeNotificationSlot_promise_slotType_003 promise success");
                    expect(true).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("removeNotificationSlot_promise_slotType_003 promise err.code:" + err.code);
                });
            } catch (error) {
                console.info("removeNotificationSlot_promise_slotType_003 error.code:" + error.code);
            }
        })

        /**
         * @tc.name   removeNotificationSlot_promise_slotType_004
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_REMOVENOTIFICATIONSLOT_PROMISE_SLOTTYPE_004
         * @tc.desc   test removeNotificationSlot promise with slotType CONTENT_INFORMATION.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("removeNotificationSlot_promise_slotType_004", Level.LEVEL0, async function (done) {
            console.info('----------------------removeNotificationSlot_promise_slotType_004---------------------------');
            try {
                reminderAgent.removeNotificationSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
                    console.info("removeNotificationSlot_promise_slotType_004 promise success");
                    expect(true).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("removeNotificationSlot_promise_slotType_004 promise err.code:" + err.code);
                });
            } catch (error) {
                console.info("removeNotificationSlot_promise_slotType_004 error.code:" + error.code);
            }
        })

        /**
         * @tc.name   removeNotificationSlot_promise_slotType_005
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_REMOVENOTIFICATIONSLOT_PROMISE_SLOTTYPE_005
         * @tc.desc   test removeNotificationSlot promise with slotType OTHER_TYPES.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("removeNotificationSlot_promise_slotType_005", Level.LEVEL0, async function (done) {
            console.info('----------------------removeNotificationSlot_promise_slotType_005---------------------------');
            try {
                reminderAgent.removeNotificationSlot(notificationManager.SlotType.OTHER_TYPES).then(() => {
                    console.info("removeNotificationSlot_promise_slotType_005 promise success");
                    expect(true).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("removeNotificationSlot_promise_slotType_005 promise err.code:" + err.code);
                });
            } catch (error) {
                console.info("removeNotificationSlot_promise_slotType_005 error.code:" + error.code);
            }
        })

        /**
         * @tc.name   publishReminder_callback_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_NULL_001
         * @tc.desc   test publishReminder callback with reminderReq null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_null_001---------------------------');
            try {
                reminderAgent.publishReminder(null, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_null_001 callback err.code is :' + err.code);
                        expect(err.code == 401).assertTrue();
                        done();
                    } else {
                        console.info('publishReminder_callback_null_001 callback reminderId = ' + reminderId);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_null_001 publishReminder error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   publishReminder_callback_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_CALLBACK_UNDEFINED_001
         * @tc.desc   test publishReminder callback with reminderReq undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_callback_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_callback_undefined_001---------------------------');
            try {
                reminderAgent.publishReminder(undefined, (err, reminderId) => {
                    if (err) {
                        console.info('publishReminder_callback_undefined_001 callback err.code is :' + err.code);
                        expect(err.code == 401).assertTrue();
                        done();
                    } else {
                        console.info('publishReminder_callback_undefined_001 callback reminderId = ' + reminderId);
                        done();
                    }
                })
            } catch (error) {
                console.log("publishReminder_callback_undefined_001 publishReminder error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   publishReminder_promise_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_NULL_001
         * @tc.desc   test publishReminder promise with reminderReq null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_null_001---------------------------');
            try {
                reminderAgent.publishReminder(null).then((reminderId) => {
                    console.info('publishReminder_promise_null_001 promise reminderId = ' + reminderId);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_null_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.log("publishReminder_promise_null_001 publishReminder error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   publishReminder_promise_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_PUBLISHREMINDER_PROMISE_UNDEFINED_001
         * @tc.desc   test publishReminder promise with reminderReq undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("publishReminder_promise_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------publishReminder_promise_undefined_001---------------------------');
            try {
                reminderAgent.publishReminder(undefined).then((reminderId) => {
                    console.info('publishReminder_promise_undefined_001 promise reminderId = ' + reminderId);
                    done();
                }).catch((err) => {
                    console.info('publishReminder_promise_undefined_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.log("publishReminder_promise_undefined_001 publishReminder error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   cancelReminder_callback_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_CANCELREMINDER_CALLBACK_NULL_001
         * @tc.desc   test cancelReminder callback with reminderId null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("cancelReminder_callback_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------cancelReminder_callback_null_001---------------------------');
            try {
                reminderAgent.cancelReminder(null, (err) => {
                    if (err) {
                        console.info('cancelReminder_callback_null_001 callback err.code is :' + err.code);
                        expect(err.code == 401).assertTrue();
                        done();
                    } else {
                        console.info('cancelReminder_callback_null_001 callback success');
                        done();
                    }
                });
            } catch (error) {
                console.info("cancelReminder_callback_null_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   cancelReminder_callback_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_CANCELREMINDER_CALLBACK_UNDEFINED_001
         * @tc.desc   test cancelReminder callback with reminderId undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("cancelReminder_callback_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------cancelReminder_callback_undefined_001---------------------------');
            try {
                reminderAgent.cancelReminder(undefined, (err) => {
                    if (err) {
                        console.info('cancelReminder_callback_undefined_001 callback err.code is :' + err.code);
                        expect(err.code == 401).assertTrue;
                        done();
                    } else {
                        console.info('cancelReminder_callback_undefined_001 callback success');
                        done();
                    }
                });
            } catch (error) {
                console.info("cancelReminder_callback_undefined_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   cancelReminder_promise_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_CANCELREMINDER_PROMISE_NULL_001
         * @tc.desc   test cancelReminder promise with reminderId null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("cancelReminder_promise_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------cancelReminder_promise_null_001---------------------------');
            try {
                reminderAgent.cancelReminder(null).then(() => {
                    console.info('cancelReminder_promise_null_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('cancelReminder_promise_null_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("cancelReminder_promise_null_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   cancelReminder_promise_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_CANCELREMINDER_PROMISE_UNDEFINED_001
         * @tc.desc   test cancelReminder promise with reminderId undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("cancelReminder_promise_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------cancelReminder_promise_undefined_001---------------------------');
            try {
                reminderAgent.cancelReminder(undefined).then(() => {
                    console.info('cancelReminder_promise_undefined_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('cancelReminder_promise_undefined_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("cancelReminder_promise_undefined_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   addNotificationSlot_callback_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_ADDNOTIFICATIONSLOT_CALLBACK_NULL_001
         * @tc.desc   test addNotificationSlot callback with slot null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("addNotificationSlot_callback_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------addNotificationSlot_callback_null_001---------------------------');
            try {
                reminderAgent.addNotificationSlot(null, (err) => {
                    if (err) {
                        console.info('addNotificationSlot_callback_null_001 callback err.code is :' + err.code);
                        expect(err.code == 401).assertTrue();
                        done();
                    } else {
                        console.info('addNotificationSlot_callback_null_001 callback success');
                        done();
                    }
                });
            } catch (error) {
                console.info("addNotificationSlot_callback_null_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   addNotificationSlot_callback_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_ADDNOTIFICATIONSLOT_CALLBACK_UNDEFINED_001
         * @tc.desc   test addNotificationSlot callback with slot undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("addNotificationSlot_callback_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------addNotificationSlot_callback_undefined_001---------------------------');
            try {
                reminderAgent.addNotificationSlot(undefined, (err) => {
                    if (err) {
                        console.info('addNotificationSlot_callback_undefined_001 callback err.code is :' + err.code);
                        expect(err.code == 401).assertTrue();
                        done();
                    } else {
                        console.info('addNotificationSlot_callback_undefined_001 callback success');
                        done();
                    }
                });
            } catch (error) {
                console.info("addNotificationSlot_callback_undefined_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   addNotificationSlot_promise_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_ADDNOTIFICATIONSLOT_PROMISE_NULL_001
         * @tc.desc   test addNotificationSlot promise with slot null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("addNotificationSlot_promise_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------addNotificationSlot_promise_null_001---------------------------');
            try {
                reminderAgent.addNotificationSlot(null).then(() => {
                    console.info('addNotificationSlot_promise_null_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('addNotificationSlot_promise_null_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("addNotificationSlot_promise_null_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   addNotificationSlot_promise_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_ADDNOTIFICATIONSLOT_PROMISE_UNDEFINED_001
         * @tc.desc   test addNotificationSlot promise with slot undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("addNotificationSlot_promise_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------addNotificationSlot_promise_undefined_001---------------------------');
            try {
                reminderAgent.addNotificationSlot(undefined).then(() => {
                    console.info('addNotificationSlot_promise_undefined_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('addNotificationSlot_promise_undefined_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("addNotificationSlot_promise_undefined_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   addExcludeDate_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_ADDEXCLUDEDATE_NULL_001
         * @tc.desc   test addExcludeDate with reminderId null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("addExcludeDate_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------addExcludeDate_null_001---------------------------');
            let date = new Date();
            try {
                reminderAgent.addExcludeDate(null, date).then(() => {
                    console.info('addExcludeDate_null_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('addExcludeDate_null_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("addExcludeDate_null_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   addExcludeDate_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_ADDEXCLUDEDATE_UNDEFINED_001
         * @tc.desc   test addExcludeDate with reminderId undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("addExcludeDate_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------addExcludeDate_undefined_001---------------------------');
            let date = new Date();
            try {
                reminderAgent.addExcludeDate(undefined, date).then(() => {
                    console.info('addExcludeDate_undefined_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('addExcludeDate_undefined_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("addExcludeDate_undefined_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   addExcludeDate_date_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_ADDEXCLUDEDATE_DATE_NULL_001
         * @tc.desc   test addExcludeDate with date null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("addExcludeDate_date_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------addExcludeDate_date_null_001---------------------------');
            try {
                reminderAgent.addExcludeDate(1, null).then(() => {
                    console.info('addExcludeDate_date_null_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('addExcludeDate_date_null_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("addExcludeDate_date_null_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   addExcludeDate_date_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_ADDEXCLUDEDATE_DATE_UNDEFINED_001
         * @tc.desc     test addExcludeDate with date undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("addExcludeDate_date_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------addExcludeDate_date_undefined_001---------------------------');
            try {
                reminderAgent.addExcludeDate(1, undefined).then(() => {
                    console.info('addExcludeDate_date_undefined_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('addExcludeDate_date_undefined_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("addExcludeDate_date_undefined_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   deleteExcludeDates_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_DELETEEXCLUDEDATES_NULL_001
         * @tc.desc   test deleteExcludeDates with reminderId null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("deleteExcludeDates_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------deleteExcludeDates_null_001---------------------------');
            try {
                reminderAgent.deleteExcludeDates(null).then(() => {
                    console.info('deleteExcludeDates_null_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('deleteExcludeDates_null_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("deleteExcludeDates_null_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   deleteExcludeDates_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_DELETEEXCLUDEDATES_UNDEFINED_001
         * @tc.desc   test deleteExcludeDates with reminderId undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("deleteExcludeDates_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------deleteExcludeDates_undefined_001---------------------------');
            try {
                reminderAgent.deleteExcludeDates(undefined).then(() => {
                    console.info('deleteExcludeDates_undefined_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('deleteExcludeDates_undefined_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("deleteExcludeDates_undefined_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   getExcludeDates_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_GETEXCLUDEDATES_NULL_001
         * @tc.desc   test getExcludeDates with reminderId null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getExcludeDates_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------getExcludeDates_null_001---------------------------');
            try {
                reminderAgent.getExcludeDates(null).then((dates) => {
                    console.info('getExcludeDates_null_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('getExcludeDates_null_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("getExcludeDates_null_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   getExcludeDates_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_GETEXCLUDEDATES_UNDEFINED_001
         * @tc.desc   test getExcludeDates with reminderId undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("getExcludeDates_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------getExcludeDates_undefined_001---------------------------');
            try {
                reminderAgent.getExcludeDates(undefined).then((dates) => {
                    console.info('getExcludeDates_undefined_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('getExcludeDates_undefined_001 promise err.code is :' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("getExcludeDates_undefined_001 error.code:" + error.code);
                expect(error.code == 401).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   cancelReminderOnDisplay_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_CANCELREMINDERONDISPLAY_NULL_001
         * @tc.desc   test cancelReminderOnDisplay with reminderId null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("cancelReminderOnDisplay_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------cancelReminderOnDisplay_null_001---------------------------');
            try {
                reminderAgent.cancelReminderOnDisplay(null).then(() => {
                    console.info('cancelReminderOnDisplay_null_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('cancelReminderOnDisplay_null_001 promise err.code is :' + err.code);
                    expect(err.code == 1700007).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("cancelReminderOnDisplay_null_001 error.code:" + error.code);
                expect(error.code == 1700007).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   cancelReminderOnDisplay_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_CANCELREMINDERONDISPLAY_UNDEFINED_001
         * @tc.desc   test cancelReminderOnDisplay with reminderId undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("cancelReminderOnDisplay_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------cancelReminderOnDisplay_undefined_001---------------------------');
            try {
                reminderAgent.cancelReminderOnDisplay(undefined).then(() => {
                    console.info('cancelReminderOnDisplay_undefined_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('cancelReminderOnDisplay_undefined_001 promise err.code is :' + err.code);
                    expect(err.code == 1700007).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("cancelReminderOnDisplay_undefined_001 error.code:" + error.code);
                expect(error.code == 1700007).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   updateReminder_reminderId_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_UPDATEREMINDER_REMINDERID_NULL_001
         * @tc.desc   test updateReminder with reminderId null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("updateReminder_reminderId_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------updateReminder_reminderId_null_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10
            }
            try {
                reminderAgent.updateReminder(null, timer).then(() => {
                    console.info('updateReminder_reminderId_null_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('updateReminder_reminderId_null_001 promise err.code is :' + err.code);
                    expect(err.code == 1700007).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("updateReminder_reminderId_null_001 error.code:" + error.code);
                expect(error.code == 1700007).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   updateReminder_reminderId_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_UPDATEREMINDER_REMINDERID_UNDEFINED_001
         * @tc.desc   test updateReminder with reminderId undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("updateReminder_reminderId_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------updateReminder_reminderId_undefined_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10
            }
            try {
                reminderAgent.updateReminder(undefined, timer).then(() => {
                    console.info('updateReminder_reminderId_undefined_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('updateReminder_reminderId_undefined_001 promise err.code is :' + err.code);
                    expect(err.code == 1700007).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("updateReminder_reminderId_undefined_001 error.code:" + error.code);
                expect(error.code == 1700007).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   updateReminder_reminderReq_null_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_UPDATEREMINDER_REMINDERREQ_NULL_001
         * @tc.desc   test updateReminder with reminderReq null.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("updateReminder_reminderReq_null_001", Level.LEVEL0, async function (done) {
            console.info('----------------------updateReminder_reminderReq_null_001---------------------------');
            try {
                reminderAgent.updateReminder(1, null).then(() => {
                    console.info('updateReminder_reminderReq_null_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('updateReminder_reminderReq_null_001 promise err.code is :' + err.code);
                    expect(err.code == 1700007).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("updateReminder_reminderReq_null_001 error.code:" + error.code);
                expect(error.code == 1700007).assertTrue();
                done();
            }
        })

        /**
         * @tc.name   updateReminder_reminderReq_undefined_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDERAGENTMANAGER_UPDATEREMINDER_REMINDERREQ_UNDEFINED_001
         * @tc.desc   test updateReminder with reminderReq undefined.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("updateReminder_reminderReq_undefined_001", Level.LEVEL0, async function (done) {
            console.info('----------------------updateReminder_reminderReq_undefined_001---------------------------');
            try {
                reminderAgent.updateReminder(1, undefined).then(() => {
                    console.info('updateReminder_reminderReq_undefined_001 promise success');
                    done();
                }).catch((err) => {
                    console.info('updateReminder_reminderReq_undefined_001 promise err.code is :' + err.code);
                    expect(err.code == 1700007).assertTrue();
                    done();
                });
            } catch (error) {
                console.info("updateReminder_reminderReq_undefined_001 error.code:" + error.code);
                expect(error.code == 1700007).assertTrue();
                done();
            }
        })

    })
}