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

const PERMISSION_DENIED_CODE = 201;

export default function ReminderAgentManagerErrorCodeTest() {
    describe('ReminderAgentManagerErrorCodeTest', function () {
        beforeAll(function () {

            /*
             * @tc.setup: setup invoked before all testcases
             */
            console.info('beforeAll called')
        })

        afterAll(function () {

            /*
             * @tc.teardown: teardown invoked after all testcases
             */
            console.info('afterAll called')
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
         * @tc.number: reminderErrorCode_0100
         * @tc.name: reminderErrorCode_0100
         * @tc.desc: test publishReminder funaction errorcode is 1700002
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderErrorCode_0100", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderErrorCode_0100---------------------------');
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('reminderErrorCode_0300 cancelAllReminders success');
                expect(true).assertTrue();
                done();
            });
            const currentYear = new Date().getFullYear();
            const nextYear = currentYear + 1
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('reminderErrorCode_0200 cancelAllReminders success');
                expect(true).assertTrue();
                done();
            });
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
                for (let i = 0; i < 35; i++) {
                    reminderAgent.publishReminder(ReminderRequest, (err, reminderId) => {
                        if (err) {                           
                            console.error('reminderErrorCode_0100 callback err.code is :' + err.code);
                            console.error('reminderErrorCode_0100 if i = ' + i);
                            if(err.code == 1700002){
                                console.info('reminderErrorCode_0100 1700002 ');
                                done();
                            }
                        } else {
                            console.info('reminderErrorCode_0100 callback reminderId = ' + reminderId);
                            console.info('reminderErrorCode_0100 else i = ' + i);
                        }
                    })
                }               
            } catch (error) {
                console.log("reminderErrorCode_0100 publishReminder error.code:" + error.code);
            }
        })
        
        /**
         * @tc.number: reminderErrorCode_0200
         * @tc.name: reminderErrorCode_0200
         * @tc.desc: test cancelReminder callback funaction errorcode is 1700003
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderErrorCode_0200", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderErrorCode_0200---------------------------');
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('reminderErrorCode_0200 cancelAllReminders success');
                expect(true).assertTrue();
                done();
            });
            const reminderId = 1231
            try {
                    reminderAgent.cancelReminder(reminderId, (err) => {
                        if (err.code) {
                            console.error("reminderErrorCode_0200 cancelReminder callback err code:" + err.code + " message:" + err.message);
                            expect(err.code == 1700003).assertTrue();
                            done();
                        } else {
                            console.log("reminderErrorCode_0200 cancelReminder callback");
                            expect(false).assertTrue();
                            done();
                        }
                    });       
            } catch (error) {
                console.log("reminderErrorCode_0200 publishReminder error.code:" + error.code);
            }
        })
        
        /**
         * @tc.number: reminderErrorCode_0300
         * @tc.name: reminderErrorCode_0100
         * @tc.desc: test cancelReminder promomise funaction errorcode is 1700003
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderErrorCode_0300", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderErrorCode_0300---------------------------');
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('reminderErrorCode_0300 cancelAllReminders success');
                expect(true).assertTrue();
                done();
            });
            const reminderId = 1231
            try {
                reminderAgent.cancelReminder(reminderId).then(() => {
                    console.log("reminderErrorCode_0300 cancelReminder promise");
                  }).catch((err) => {
                    console.error("reminderErrorCode_0300 promise err code:" + err.code + " message:" + err.message);
                    expect(err.code == 1700003).assertTrue();
                    done();
                  });    
            } catch (error) {
                console.log("reminderErrorCode_0300 publishReminder error.code:" + error.code);
            }
        })
        
        /**
         * @tc.number: reminderErrorCode_0400
         * @tc.name: reminderErrorCode_0400
         * @tc.desc: test addExcludeDate funaction errorcode is 1700003
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderErrorCode_0400", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderErrorCode_0400---------------------------');
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('reminderErrorCode_0400 cancelAllReminders success');
                expect(true).assertTrue();
                done();
            });
            const reminderId = 1231
            try {
                reminderAgent.addExcludeDate(reminderId, date).then(() => {
                    console.log("reminderErrorCode_0400 addExcludeDate promise");
                  }).catch((err) => {
                    console.error("reminderErrorCode_0400 promise err code:" + err.code + " message:" + err.message);
                    expect(err.code == 1700003).assertTrue();
                    done();
                  });   
            } catch (error) {
                console.log("reminderErrorCode_0400 reminderRequestAttribute_0033 publishReminder error.code:" + error.code);
            }
        })
        
        /**
         * @tc.number: reminderErrorCode_0500
         * @tc.name: reminderErrorCode_0500
         * @tc.desc: test deleteExcludeDates funaction errorcode is 1700003
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderErrorCode_0500", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderRequestAttribute_0033---------------------------');
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('reminderErrorCode_0500 cancelAllReminders success');
                expect(true).assertTrue();
                done();
            });
            const reminderId = 1231
            try {
                reminderAgent.deleteExcludeDates(reminderId).then(() => {
                    console.log("reminderErrorCode_0500 addExcludeDate promise");
                  }).catch((err) => {
                    console.error("reminderErrorCode_0500 promise err code:" + err.code + " message:" + err.message);
                    expect(err.code == 1700003).assertTrue();
                    done();
                  });   
            } catch (error) {
                console.log("reminderErrorCode_0500 publishReminder error.code:" + error.code);
            }
        })
        
        /**
         * @tc.number: reminderErrorCode_0600
         * @tc.name: reminderErrorCode_0600
         * @tc.desc: test getExcludeDates funaction errorcode is 1700003
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderErrorCode_0600", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderRequestAttribute_0033---------------------------');
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('reminderErrorCode_0600 cancelAllReminders success');
                expect(true).assertTrue();
                done();
            });
            const reminderId = 1231
            try {
                reminderAgent.getExcludeDates(reminderId).then(() => {
                    console.log("reminderErrorCode_0600 getExcludeDates promise");
                  }).catch((err) => {
                    console.error("reminderErrorCode_0600 promise err code:" + err.code + " message:" + err.message);
                    expect(err.code == 1700003).assertTrue();
                    done();
                  });   
            } catch (error) {
                console.log("reminderErrorCode_0600 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number: reminderErrorCode_0700
         * @tc.name: reminderErrorCode_0700
         * @tc.desc: test publishReminder promise funaction errorcode is 1700002
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderErrorCode_0700", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderErrorCode_0700---------------------------');
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
                for (let i = 0; i < 35; i++) {
                    reminderAgent.publishReminder(ReminderRequest).then((reminderId) => {
                        console.log("reminderErrorCode_0700 promise, reminderId = " + reminderId);
                      }).catch((err) => {
                        console.error("reminderErrorCode_0700 promise err code:" + err.code + " message:" + err.message);
                        if(err.code == 1700002){
                            console.info('reminderErrorCode_0700 1700002 ');
                            done();
                        }
                      });
                }               
            } catch (error) {
                console.log("reminderErrorCode_0700 publishReminder error.code:" + error.code);
            }
        })     

    })
}
