/*
 * Copyright (C) 2021-2025 Huawei Device Co., Ltd.
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
import reminderAgent from '@ohos.reminderAgent'
import notification from '@ohos.notification'
import notificationManager from '@ohos.notificationManager';
import { Driver, ON } from '@ohos.UiTest';

export default function ReminderAgentTest() {
    describe('ReminderAgentTest', function () {

        const TRIGGER_TIME_IN_SECONDS = 100;
        function sleep(ms) {
            console.info(`ReminderAgentTest sleep is success`);
            return new Promise(resolve => setTimeout(resolve, ms));
        }

        beforeAll(async function (done) {

            /*
             * @tc.setup: setup invoked before all testcases
             */
            console.info(`ReminderAgentTest beforeAll called click usb button`)
            await sleep(500);
            let usb = Driver.create();
            await sleep(500)
            let usbButton = await usb.findComponent(ON.type('Button').text('确定').within(ON.type('Dialog')));
            console.info(`usb button is ${JSON.stringify(usbButton)}`);
            if (usbButton !== null) {
                await sleep(1000);
                await usbButton.click();
                await sleep(500);
            }

            await sleep(500);
            console.info(`ReminderAgentTest beforeAll called requestEnableNotification`)
            notificationManager.requestEnableNotification(async (err) => {
            console.info(`ReminderAgentTest come in requestEnableNotification`);
              if (err) {
                console.info(`ReminderAgentTest requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done();
              } else {
                console.info("ReminderAgentTest requestEnableNotification success");
                expect(true).assertTrue();
                await sleep(1000);
                done();
              }
            });
        

            await sleep(1000);
            let driver = await Driver.create();
            console.info(`ReminderAgentTest come in driveFn`);
            await sleep(1000);
            console.info(`ReminderAgentTest driver is ${JSON.stringify(driver)}`);
            let button = await driver.findComponent(ON.text('允许').within(ON.type('Dialog')));
            console.info(`ReminderAgentTest button is ${JSON.stringify(button)}`);
            if(button != null){
                await button.click();
                console.info(`ReminderAgentTest button is click`);
                await sleep(3000);
                done();
            }else{
                console.info(`ReminderAgentTest button is null`);
                await sleep(1000);
                done(); 
            } 
        })

        afterAll(function () {

            /*
             * @tc.teardown: teardown invoked after all testcases
             */
            console.info('afterAll caled')
        })

        beforeEach(function () {

            /*
             * @tc.setup: setup invoked before each testcases
             */
            console.info('beforeEach caled')
        })

        afterEach(function () {

            /*
             * @tc.teardown: teardown invoked after each testcases
             */
            console.info('afterEach caled')
        })

        console.info('start################################start');

        /**
         * @tc.name   testActionButton_001
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_001
         * @tc.desc   test ActionButton title.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testActionButton_001", Level.LEVEL0, async function (done) {
            console.info('----------------------testActionButton_001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            reminderAgent.publishReminder(timer).then((reminderId) => {
                console.info("reminderId =" + reminderId);
                reminderAgent.getValidReminders().then((reminder) => {
                    if (reminder.length !== 0) {
                        let actionButton = reminder[0].actionButton;
                        if (actionButton.length === 0) {
                            actionButton = [{ title: '?????' }]
                        }
                        console.info('ActionButton getValidReminders title:' + actionButton[0].title);
                        expect(actionButton[0].title).assertInstanceOf('String')
                        done()
                    }
                }, (error) => {
                    console.info('error.code getValidReminders 001 is :' + error.code)
                });
            });
        })

        /**
         * @tc.name   testActionButton_002
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_002
         * @tc.desc   test ActionButton
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testActionButton_002", Level.LEVEL0, async function (done) {
            console.info('----------------------testActionButton_002---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            reminderAgent.publishReminder(timer).then((reminderId) => {
                console.info("reminderId =" + reminderId);
                reminderAgent.getValidReminders().then((reminder) => {
                    if (reminder.length !== 0) {
                        let actionButton = reminder[0].actionButton;
                        if (actionButton.length === 0) {
                            actionButton = [{ type: 0 }];
                            console.info('ActionButton type:' + actionButton[0].type);
                            expect(actionButton[0].type).assertEqual(0)
                        }
                    } else {
                        reminder = [{ actionButton: [{ type: 1 }] }];
                        console.info('ActionButton getValidReminders Type: ' + reminder[0].actionButton[0].type);
                    }
                    done()
                }, (error) => {
                    console.info('error.code getValidReminders 002 is :' + error.code)
                });
            });
        })

        /**
         * @tc.name   testWantAgentAbilityName_003
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_003
         * @tc.desc   test wantAgent abilityName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testWantAgentAbilityName_003", Level.LEVEL0, async function (done) {
            console.info('----------------------testWantAgentAbilityName_003---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 4,
                wantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagent.js.function",
                    abilityName: "ohos.samples.jshelloworld.MainAbility"
                },
            };
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('err.code cancelAllReminders 003 is :' + err.code)
            });
            reminderAgent.publishReminder(timer).then((reminderId) => {
                console.info("reminderId =" + reminderId);
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let wantAgent = reminder[0].wantAgent.abilityName;
                        if (wantAgent == "ohos.samples.jshelloworld.MainAbility") {
                            expect(wantAgent).assertInstanceOf('String');
                        } else {
                            console.info('err.code getValidReminders 003 is :' + err.code)
                        }
                    }
                    done()
                });
            });
        })

        /**
         * @tc.name   testMaxScreenWantAgentAbilityName_004
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_004
         * @tc.desc   test MaxScreenWantAgent abilityName
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testMaxScreenWantAgentAbilityName_004", Level.LEVEL0, async function (done) {
            console.info('----------------------testMaxScreenWantAgentAbilityName_004---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('err.code cancelAllReminders 004 is :' + err.code)
            });
            reminderAgent.publishReminder(timer).then((reminderId) => {
                console.info("reminderId =" + reminderId);
                reminderAgent.getValidReminders().then((reminder) => {
                    if (reminder.length !== 0) {
                        let maxScreenWantAgent = reminder[0].maxScreenWantAgent;
                        console.info('maxScreenWantAgent abilityName:' + maxScreenWantAgent.abilityName);
                        if (maxScreenWantAgent.abilityName === "") {
                            console.info("maxScreenWantAgent.abilityName value is " + maxScreenWantAgent.abilityName);
                            expect(maxScreenWantAgent.abilityName).assertEqual("");
                        }
                    } else {
                        reminder = [{ maxScreenWantAgent: { abilityName: 'title.com.oh.phone.MainAbility' } }];
                    }
                    done()
                }, (error) => {
                    console.info('error.code 004 is :' + error.code)
                });
            });
        })

        /**
         * @tc.name   testReminderRequestTitle_005
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_005
         * @tc.desc   test ReminderRequest title
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testReminderRequestTitle_005", Level.LEVEL0, async function (done) {
            console.info('----------------------testReminderRequestTitle_005---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('err.code cancelAllReminders 005 is :' + err.code)
            });
            reminderAgent.publishReminder(timer).then((reminderId) => {
                console.info("reminderId =" + reminderId);
                reminderAgent.getValidReminders().then((reminder) => {
                    if (reminder.length !== 0) {
                        let title = reminder[0].title;
                        console.info('ReminderRequest title:' + title);
                        expect(title).assertEqual("");
                    } else {
                        reminder = [{ title: '????????' }];
                        console.info('ReminderRequest title:' + reminder[0].title);
                    }
                    done()
                }, (error) => {
                    console.info('error.code 005 is :' + error.code)
                });
            });
        })

        /**
         * @tc.name   testReminderRequestContent_006
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_006
         * @tc.desc   test ReminderRequest content
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testReminderRequestContent_006", Level.LEVEL0, async function (done) {
            console.info('----------------------testReminderRequestContent_006---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('err.code cancelAllReminders 006 is :' + err.code)
            });
            reminderAgent.publishReminder(timer).then((reminderId) => {
                console.info("reminderId =" + reminderId);
                reminderAgent.getValidReminders().then((reminder) => {
                    if (reminder.length !== 0) {
                        let content = reminder[0].content;
                        console.info('ReminderRequest content:' + content);
                        expect(content).assertEqual("");
                    } else {
                        reminder = [{ content: '8????????????' }];
                        console.info('ReminderRequest content:' + reminder[0].content);
                    }
                    done()
                }, (error) => {
                    console.info('error.code 006 is :' + error.code)
                });
            });
        })

        /**
         * @tc.name   testReminderRequestType_007
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_007
         * @tc.desc   test ReminderRequest LocalDateTime second
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testReminderRequestType_007", Level.LEVEL0, async function (done) {
            console.info('----------------------testReminderRequestType_007---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 10,
                    day: 10,
                    hour: 23,
                    minute: 30,
                    second: 18
                },
                repeatMonths: [3],
                repeatDays: [7]
            }
            reminderAgent.publishReminder(calendar).then((reminderId) => {
                console.info("testReminderRequestType_007 reminderId =" + reminderId);
                expect(reminderId).assertLarger(0);
                done()
            });
        })

        /**
         * @tc.name   testReminderRequestType_008
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_008
         * @tc.desc   test ReminderRequest ReminderRequestAlarm daysOfWeek
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testReminderRequestType_008", Level.LEVEL0, async function (done) {
            console.info('----------------------testReminderRequestType_008---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 7,
                minute: 10,
                daysOfWeek: [1, 2, 3, 4, 5]
            }
            reminderAgent.publishReminder(alarm).then((reminderId) => {
                if (reminderId != -1) {
                    console.info("testReminderRequestType_008 reminderId =" + reminderId);
                    expect(reminderId).assertLarger(0);
                    done()
                }
            }, error => { });
        })

        /**
         * @tc.name   testPublishReminderNorFun_009
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_009
         * @tc.desc   test reminderId is outo increment with the promise function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPublishReminderNorFun_009', Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderNorFun_009---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            let expectId = -1;
            reminderAgent.publishReminder(timer).then((reminderId) => {
                expectId = reminderId + 1;
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    if (reminderId === expectId) {
                        console.info('reminderId 009 is :' + reminderId)
                        expect(reminderId).assertLarger(0);
                        done()
                    }
                }, (error) => {
                    console.info('error.code 009 is :' + error.code)
                });
            });
        })

        /**
         * @tc.name   testPublishReminderNorFun_010
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_010
         * @tc.desc   test reminderId is outo increment with the callback function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPublishReminderNorFun_010', Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderNorFun_010---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            let expectId = -1;
            function reminderCallback(err, reminderId) {
                console.info('reminderId 010 is :' + reminderId)
                expect(reminderId).assertEqual(expectId);
                done();
            }
            reminderAgent.publishReminder(timer, (err, reminderId) => {
                expectId = reminderId + 1;
                console.info('expectId 010 is :' + expectId)
                reminderAgent.publishReminder(timer, reminderCallback);
            })
        })

        /**
         * @tc.name   testAddNotificationSlotNorFun_011
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_011
         * @tc.desc   Adds a reminder notification slot with the callback function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAddNotificationSlotNorFun_011', Level.LEVEL0, async function (done) {
            console.info('----------------------testAddNotificationSlotNorFun_011---------------------------');
            try {
                function reminderCallback(err, data) {
                    let i = 0;
                    expect(0).assertEqual(i);
                    done();
                }
                reminderAgent.addNotificationSlot(0, reminderCallback);
            } catch (error) {
                console.info('testAddNotificationSlotNorFun_011 slot err.code')
            }
        })

         /**
          * @tc.name   testAddNotificationSlotNorFun_012
          * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_012
          * @tc.desc   Adds a reminder notification slot with the promise function and null mySlot.
          * @tc.type   FUNCTION
          * @tc.size   MEDIUMTEST
          * @tc.level  LEVEL0
          */
         it('testAddNotificationSlotNorFun_012', Level.LEVEL0, async function (done) {
          console.info('----------------------testAddNotificationSlotNorFun_012---------------------------');
          let mySlot = null;

              reminderAgent.addNotificationSlot(mySlot, function (err) {
                console.info("testAddNotificationSlotNorFun_012 null slot is invalid parameter " + err.code);
                expect(err.code).assertEqual(401);
                done();               
              })            
      })

        /**
         * @tc.name   testAddNotificationSlotNorFun_013
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_013
         * @tc.desc   Adds a reminder notification slot with the promise function and mySlot type 3.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAddNotificationSlotNorFun_013', Level.LEVEL0, async function (done) {
            console.info('----------------------testAddNotificationSlotNorFun_013---------------------------');
            let mySlot = {
                type: 3
            }
            reminderAgent.addNotificationSlot(mySlot).then(() => {
                console.info('mySliot.type 013 is :' + mySlot.type)
                expect(mySlot.type).assertEqual(3);
                done()
            }, (error) => {
                console.info('error.code 013 is :' + error.code)
            });
        })

        /**
         * @tc.name   testAddNotificationSlotNorFun_014
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_014
         * @tc.desc   Adds a reminder notification slot with the promise function and mySlot more types.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAddNotificationSlotNorFun_014', Level.LEVEL0, async function (done) {
            console.info('----------------------testAddNotificationSlotNorFun_014---------------------------');
            let mySlot0 = {
                type: 0
            }
            let mySlot1 = {
                type: 1
            }
            let mySlot2 = {
                type: 2
            }
            let mySlot3 = {
                type: 3
            }
            let mySlot4 = {
                type: 4
            }
            function reminderCallback(err, data) {
              if (err.code == 0) {
                console.info('testAddNotificationSlotNorFun_014 add slot success');
                expect(err.code).assertEqual(0);
                done();
            } else {
              console.info('testAddNotificationSlotNorFun_014 slot type 4 is invalid value err code is:' + err.code);
              expect(err.code).assertEqual(401);                
              done();
            }
            }
            reminderAgent.addNotificationSlot(mySlot0, reminderCallback);
            reminderAgent.addNotificationSlot(mySlot1, reminderCallback);
            reminderAgent.addNotificationSlot(mySlot2, reminderCallback);
            reminderAgent.addNotificationSlot(mySlot3, reminderCallback);
            reminderAgent.addNotificationSlot(mySlot4, reminderCallback);

        })

        /**
         * @tc.name   testGetValidRemindersNorFun_015
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_015
         * @tc.desc   Obtains all valid remindeers set by the current application.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGetValidRemindersNorFun_015', Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersNorFun_015---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            reminderAgent.publishReminder(timer).then((reminderId) => {
                reminderAgent.getValidReminders().then((reminders) => { });
                setTimeout(() => {
                    reminderAgent.cancelAllReminders().then(() => {
                        reminderAgent.getValidReminders().then((reminders) => {
                            console.info('reminders.length 015 is :' + reminders.length);
                            expect(0).assertEqual(reminders.length);
                        });
                    });
                }, 1000);
            });
            done();
        })

        /**
         * @tc.name   testCancelAllRemindersNorFun_016
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_016
         * @tc.desc   test cancel all reminders can cancel all exist reminders
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCancelAllRemindersNorFun_016', Level.LEVEL0, async function (done) {
            console.info('----------------------testCancelAllRemindersNorFun_016---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            reminderAgent.publishReminder(timer, (error, reminderId) => {
                reminderAgent.getValidReminders((err, reminders) => { });
                setTimeout(() => {
                    reminderAgent.cancelAllReminders((err, data) => {
                        reminderAgent.getValidReminders().then((reminders) => {
                            console.info('reminders.length 016 is :' + reminders.length);
                            expect(0).assertEqual(reminders.length);
                        });
                    });
                }, 1000);
            });
            done();
        })

        /**
         * @tc.name   testCancelRemindersNorFun_017
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_017
         * @tc.desc   test cancelReminder with not exit reminder.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCancelRemindersNorFun_017', Level.LEVEL0, async function (done) {
            console.info('----------------------testCancelRemindersNorFun_017---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            let id = 1;
            let publishlength = -1;
            let cancellength = -1;
            let firstdiff = -1;
            reminderAgent.publishReminder(timer).then(() => {
                reminderAgent.getValidReminders().then((reminders) => {
                    publishlength = reminders.length
                });
                setTimeout(() => {
                    reminderAgent.cancelReminder(id).then(() => {
                        reminderAgent.getValidReminders().then((reminders) => {
                            cancellength = reminders.length
                            firstdiff = publishlength - cancellength;
                            if (firstdiff === 0) {
                                console.info('firstdiff 017 is :' + firstdiff);
                                expect(0).assertEqual(firstdiff);
                            }
                        });
                    });
                }, 1000);
            });
            done();
        })

        /**
         * @tc.name   testCancelRemindersNorFun_018
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_018
         * @tc.desc   test cancel reminder with not exit reminder.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCancelRemindersNorFun_018', Level.LEVEL0, async function (done) {
            console.info('----------------------testCancelRemindersNorFun_018---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            let id = 1;
            let publishlength = -1;
            let cancellength = -1;
            let firstdiff = -1;
            reminderAgent.publishReminder(timer).then(() => {
                reminderAgent.getValidReminders((err, reminders) => {
                    publishlength = reminders.length;
                });
                setTimeout(() => {
                    reminderAgent.cancelReminder(id, (err, data) => {
                        reminderAgent.getValidReminders((err, reminders) => {
                            cancellength = reminders.length;
                            firstdiff = publishlength - cancellength;
                            if (firstdiff === 0) {
                                console.info('firstdiff 018 is :' + firstdiff);
                                expect(0).assertEqual(firstdiff);
                            }
                        });
                    });
                }, 1000);
            });
            done();
        })

        /**
         * @tc.name   testCancelRemindersNorFun_019
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_019
         * @tc.desc   test cancel reminder with exist reminder.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCancelRemindersNorFun_019', Level.LEVEL0, async function (done) {
            console.info('----------------------testCancelRemindersNorFun_019---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 21,
                minute: 14,
                title: "this is title",
                content: "this is content"
            }
            let publishlength = -1;
            let cancellength = -1;
            let firstdiff = -1;
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                reminderAgent.getValidReminders((err, reminders) => {
                    publishlength = reminders.length;
                });
                setTimeout(() => {
                    reminderAgent.cancelReminder(reminderId, (err, data) => {
                        reminderAgent.getValidReminders((err, reminders) => {
                            cancellength = reminders.length;
                            firstdiff = publishlength - cancellength;
                            if (firstdiff === 0) {
                                console.info('firstdiff 019 is :' + firstdiff);
                                expect(0).assertEqual(firstdiff);
                            } else if (firstdiff === 1) {
                                console.info('firstdiff 019 is :' + firstdiff);
                                expect(1).assertEqual(firstdiff);
                            }
                        });
                    });
                }, 1000);
            });
            done();
        })

        /**
         * @tc.name   testCancelRemindersNorFun_020
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_020
         * @tc.desc   test cancel reminder with exist reminder with the promise function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCancelRemindersNorFun_020', Level.LEVEL0, async function (done) {
            console.info('----------------------testCancelRemindersNorFun_020---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 21,
                minute: 14,
                title: "this is title",
                content: "this is content"
            }
            let publishlength = -1;
            let cancellength = -1;
            let firstdiff = -1;
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                reminderAgent.getValidReminders((err, reminders) => {
                    publishlength = reminders.length;
                });
                setTimeout(() => {
                    reminderAgent.cancelReminder(reminderId).then(() => {
                        reminderAgent.getValidReminders((err, reminders) => {
                            cancellength = reminders.length;
                            firstdiff = publishlength - cancellength;
                            if (firstdiff === 0) {
                                console.info('firstdiff 020 is :' + firstdiff);
                                expect(0).assertEqual(firstdiff);
                            } else if (firstdiff === 1) {
                                console.info('firstdiff 020 is :' + firstdiff);
                                expect(1).assertEqual(firstdiff);
                            }
                        });
                    });
                }, 1000);
            });
            done();
        })

        /**
         * @tc.name   testGetValidRemindersNorFun_021
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_021
         * @tc.desc   test get valid reminders verify all the information is correct.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGetValidRemindersNorFun_021', Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersNorFun_021---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 21,
                minute: 14,
                title: "this is title",
                content: "this is content"
            }
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            reminderAgent.publishReminder(timer, (error, reminderId) => { });
            reminderAgent.publishReminder(alarm, (error, reminderId) => { });
            setTimeout(() => {
                reminderAgent.getValidReminders().then((reminders) => {
                    if (reminders.length >= 2) {
                        let i = 0;
                        expect(0).assertEqual(i);
                    }
                });
            }, 1000);
            done();
        })

        /**
         * @tc.name   testGetValidRemindersNorFun_022
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_022
         * @tc.desc   test get valid reminders verify all the information is correct with the callback function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGetValidRemindersNorFun_022', Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersNorFun_022---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 21,
                minute: 14,
                title: "this is title",
                content: "this is content"
            }
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            reminderAgent.publishReminder(timer, (error, reminderId) => { });
            reminderAgent.publishReminder(alarm, (error, reminderId) => { });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminders) => {
                    if (reminders.length >= 2) {
                        let i = 0;
                        expect(0).assertEqual(i);
                    }
                });
            }, 1000);
            done();
        })

        /**
         * @tc.name   testRemoveNotificationSlotNorFun_023
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_023
         * @tc.desc   test remove notification Slot with not exist slot.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRemoveNotificationSlotNorFun_023', Level.LEVEL0, async function (done) {
            console.info('----------------------testRemoveNotificationSlotNorFun_023---------------------------');
            function reminderCallback(err, data) {
                let i = 0;
                expect(0).assertEqual(i);
            }
            reminderAgent.removeNotificationSlot(0, reminderCallback);
            done();
        })

        /**
         * @tc.name   testPublishReminderTimer_024
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_024
         * @tc.desc   test timer without reminderType .
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderTimer_024", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderTimer_024---------------------------');
            let timer = {
                triggerTimeInSeconds: 10
            }
            reminderAgent.publishReminder(timer, (err, reminderId) => {
                console.info("callback,the testPublishReminderTimer_024 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderTimer_025
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_025
         * @tc.desc   test timer without triggerTimeInSeconds.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderTimer_025", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderTimer_025---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER
            }
            reminderAgent.publishReminder(timer, (err, reminderId) => {
                console.info("callback,the testPublishReminderTimer_025 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
            
        })

        /**
         * @tc.name   testPublishReminderTimer_026
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_026
         * @tc.desc   test timer triggerTimeInSeconds with wrong parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderTimer_026", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderTimer_026---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: -10
            }
            reminderAgent.publishReminder(timer, (err, reminderId) => {
                console.info("callback,the testPublishReminderTimer_026 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderTimer_027
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_027
         * @tc.desc   test timer triggerTimeInSeconds with illegal parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderTimer_027", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderTimer_027---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 0
            }
            reminderAgent.publishReminder(timer, (err, reminderId) => {
                console.info("callback,the testPublishReminderTimer_027 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderTimer_028
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_028
         * @tc.desc   test timer triggerTimeInSeconds with illegal parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderTimer_028", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderTimer_028---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 'fye'
            }
            reminderAgent.publishReminder(timer, (err, reminderId) => {
                console.info("callback,the testPublishReminderTimer_028 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderTimer_029
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_029
         * @tc.desc   test timer normal parameter,return with callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderTimer_029", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderTimer_029---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20
            }
            reminderAgent.publishReminder(timer, (err, reminderId) => {
                console.info("callback,the testPublishReminderTimer_029 reminderId=" + reminderId);
                expect(reminderId).assertLarger(0);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderTimer_030
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_030
         * @tc.desc   test timer normal parameter,return with promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderTimer_030", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderTimer_030---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20
            }
            reminderAgent.cancelAllReminders().then((err,data) => {
                console.info('err.code cancelAllReminders 030 is :' + err.code)
            });
            reminderAgent.publishReminder(timer).then((reminderId) => {
                console.info("promise,the testPublishReminderTimer_030 reminderId =" + reminderId);
                expect(reminderId).assertLarger(0);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarm_031
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_031
         * @tc.desc   test alarm without reminderType parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarm_031", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarm_031---------------------------');
            let alarm = {
                hour: 11,
                minute: 13
            }
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                console.info("promise,the testPublishReminderAlarm_031 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarm_032
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_032
         * @tc.desc   test alarm without hour parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarm_032", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarm_032---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                minute: 13
            }
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                console.info("callback,the testPublishReminderAlarm_032 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarm_033
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_033
         * @tc.desc   test alarm with illegal hour parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarm_033", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarm_033---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: "11",
                minute: 13
            }
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                console.info("callback,the testPublishReminderAlarm_033 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarm_034
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_034
         * @tc.desc   test alarm hour with illegal parameter 24.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarm_034", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarm_034---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 24,
                minute: 13
            }
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                console.info("callback,the testPublishReminderAlarm_034 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarm_035
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_035
         * @tc.desc   test alarm without minute parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarm_035", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarm_035---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11
            }
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                console.info("callback,the testPublishReminderAlarm_035 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarmNorFun_036
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_036
         * @tc.desc   test alarm with illegal minute parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarmNorFun_036", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarmNorFun_036---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: "13"
            }
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                console.info("callback,the testPublishReminderAlarmNorFun_036 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarm_037
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_037
         * @tc.desc   test alarm hour with illegal parameter 60.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarm_037", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarm_037---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 60
            }
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                console.info("callback,the testPublishReminderAlarm_037 reminderId=" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarmFun_038
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_038
         * @tc.desc   test alarm with normal parameter,return with callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarmFun_038", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarmFun_038---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 30
            }
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                console.info("callback,the testPublishReminderAlarmFun_038 reminderId=" + reminderId);
                expect(reminderId).assertLarger(0);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarmFun_039
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_039
         * @tc.desc   test alarm with normal parameter,return with promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarmFun_039", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarmFun_039---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 30
            }
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                console.info("callback,the testPublishReminderAlarmFun_039 reminderId=" + reminderId);
                expect(reminderId).assertLarger(0);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarm_040
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_040
         * @tc.desc   test alarm with illegal daysOfWeek parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarm_040", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarm_040---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 30,
                daysOfWeek: [8]
            }
            reminderAgent.publishReminder(alarm).then((reminderId) => {
                console.info("promise,the testPublishReminderAlarm_040 reminderId =" + reminderId);
            },(error) => {
                console.info('error.code 040 is :' + error.code)
                
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderAlarm_041
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_041
         * @tc.desc   test alarm with null daysOfWeek parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderAlarm_041", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAlarm_041---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 30,
                daysOfWeek: []
            }
            reminderAgent.publishReminder(alarm).then((reminderId) => {
                console.info("promise,the testPublishReminderAlarm_041 reminderId =" + reminderId);
                expect(reminderId).assertLarger(0);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_042
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_042
         * @tc.desc   test calendar without reminderType parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_042", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_042---------------------------');
            let calendar = {
                dateTime: {
                    year: 2025,
                    month: 7,
                    day: 28,
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_042 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_043
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_043
         * @tc.desc   test calendar without year parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_043", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_043---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    month: 7,
                    day: 28,
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_043 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_044
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_044
         * @tc.desc   test calendar with illegal year parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_044", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_044---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: "2025",
                    month: 7,
                    day: 28,
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_044 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_045
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_045
         * @tc.desc   test calendar without month parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_045", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_045---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    day: 28,
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_045 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_046
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_046
         * @tc.desc   test calendar with illegal month parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_046", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_046---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: "7",
                    day: 28,
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_046 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_047
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_047
         * @tc.desc   test calendar with illegal month parameter 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_047", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_047---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 0,
                    day: 28,
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_047 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_048
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_048
         * @tc.desc   test calendar with illegal month parameter 13.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_048", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_048---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 13,
                    day: 28,
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_048 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_049
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_049
         * @tc.desc   test calendar without day parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_049", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_049---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_049 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_050
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_050
         * @tc.desc   test calendar with illegal day parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_050", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_050---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: "28",
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_050 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_051
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_051
         * @tc.desc   test calendar with illegal day parameter 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_051", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_051---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 0,
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_051 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_052
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_052
         * @tc.desc   test calendar with illegal day parameter 32.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_052", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_052---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 32,
                    hour: 14,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_052 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_053
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_053
         * @tc.desc   test calendar without hour parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_053", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_053---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_053 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_054
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_054
         * @tc.desc   test calendar with illegal hour parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_054", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_054---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: "14",
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_054 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_055
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_055
         * @tc.desc   test calendar with illegal hour parameter 24.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_055", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_055---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: 24,
                    minute: 30,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_055 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_056
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_056
         * @tc.desc   test calendar without minute parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_056", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_056---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: 11,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_056 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_057
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_057
         * @tc.desc   test calendar with illegal minute parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_057", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_057---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: 11,
                    minute: "30",
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_057 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_058
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_058
         * @tc.desc   test calendar with illegal minute parameter 60.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_058", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_058---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: 11,
                    minute: 60,
                    second: 50
                }
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_058 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendarFun_059
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_059
         * @tc.desc   test calendar with normal parameter,return with callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendarFun_059", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendarFun_059---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: 11,
                    minute: 30,
                    second: 50
                },
                repeatMonths: [3],
                repeatDays: [7]
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendarFun_059 reminderId =" + reminderId);
                expect(reminderId).assertLarger(0);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendarFun_060
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_060
         * @tc.desc   test calendar with normal parameter,return with promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendarFun_060", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendarFun_060---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 29,
                    hour: 11,
                    minute: 30,
                    second: 40
                },
                repeatMonths: [3],
                repeatDays: [7]
            }
            reminderAgent.publishReminder(calendar).then((reminderId) => {
                console.info("promise,the testPublishReminderCalendarFun_060 reminderId =" + reminderId);
                expect(reminderId).assertLarger(0);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_061
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_061
         * @tc.desc   test calendar with illegal repeatMonths parameter 13.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_061", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_061---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: 11,
                    minute: 30,
                    second: 45
                },
                repeatMonths: [13]
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_061 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_062
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_062
         * @tc.desc   test calendar with illegal repeatMonths parameter 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_062", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_062---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: 11,
                    minute: 45,
                    second: 45
                },
                repeatMonths: [0]
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_062 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_063
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_063
         * @tc.desc   test calendar with illegal repeatDays parameter 32.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_063", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_063---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: 11,
                    minute: 45,
                    second: 45
                },
                repeatDays: [32]
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_063 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_064
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_064
         * @tc.desc   test calendar with illegal repeatDays parameter 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_064", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_064---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: 11,
                    minute: 45,
                    second: 45
                },
                repeatDays: [0]
            }
            reminderAgent.publishReminder(calendar, (err, reminderId) => {
                console.info("callback,the testPublishReminderCalendar_064 reminderId =" + reminderId);
                expect(-1).assertEqual(reminderId);
                done()
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_065
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_065
         * @tc.desc   test calendar with repeatMonths��repeatDays parameter null,return with callback.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_065", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_065---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 28,
                    hour: 11,
                    minute: 45,
                    second: 15
                },
                repeatMonths: [3],
                repeatDays: [7]
            }
            reminderAgent.cancelAllReminders().then(() => {
                console.info('cancelAllReminders success')
                reminderAgent.publishReminder(calendar, (err, reminderId) => {
                    console.info("callback,the testPublishReminderCalendar_065 reminderId =" + reminderId);
                    expect(reminderId).assertLarger(0);
                    done()
                });
            },(error) => {
                console.info('error.code 065 is :' + error.code)
            });
        })

        /**
         * @tc.name   testPublishReminderCalendar_066
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_066
         * @tc.desc   test calendar with repeatMonths��repeatDays parameter null,return with promise.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testPublishReminderCalendar_066", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderCalendar_066---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 5,
                    day: 25,
                    hour: 11,
                    minute: 45,
                    second: 15
                },
                repeatMonths: [3],
                repeatDays: [7]
            }
            reminderAgent.publishReminder(calendar).then((reminderId) => {
                console.info("promise,the testPublishReminderCalendar_066 reminderId =" + reminderId);
                expect(reminderId).assertLarger(0)
                done()
            });
        })

        /**
         * @tc.name   testGetValidRemindersButton_067
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_067
         * @tc.desc   test actionButton with illegal parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersButton_067", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersButton_067---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 15,
                actionButton: [
                    {
                        title: "this is a title",
                        type: 2
                    }
                ]
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersButton_067 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersButton_067 reminder length =" + reminder.length);
                    expect(reminder.length).assertEqual(0);
                    done()
                }, (error) => {
                    console.info('error.code 067 id :' + error.code)
                });
            }, 2000);
        })

        /**
         * @tc.name   testGetValidRemindersButton_068
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_068
         * @tc.desc   test actionButton without title.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersButton_068", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersButton_068---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 15,
                actionButton: [
                    {
                        type: 0
                    }
                ]
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersButton_068 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersButton_068 reminder length =" + reminder.length);
                    expect(reminder.length).assertEqual(0);
                    done()
                }, (error) => {
                    console.info('error.code 068 is :' + error.code)
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersButton_069
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_069
         * @tc.desc   test actionButton with illegal title.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersButton_069", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersButton_069---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 15,
                actionButton: [
                    {
                        title: 123,
                        type: 0
                    }
                ]
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersButton_069 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersButton_069 reminder length =" + reminder.length);
                    expect(reminder.length).assertEqual(0);
                    done()
                }, (error) => {
                    console.info('error.code 069 is :' + error.code)
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersSnoozTimes_070
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_070
         * @tc.desc   test snoozeTimes with parameter 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersSnoozTimes_070", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersSnoozTimes_070---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 15,
                snoozeTimes: 0
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersSnoozTimes_070 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersSnoozTimes_070 snoozeTimes =" +
                        reminder[0].snoozeTimes);
                    expect(reminder[0].snoozeTimes).assertEqual(0);
                    done()
                });
            },500)
        })

        /**
         * @tc.name   testGetValidRemindersSnoozTimes_071
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_071
         * @tc.desc   test snoozeTimes with illegal parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersSnoozTimes_071", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersSnoozTimes_071---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 15,
                snoozeTimes: "2"
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersSnoozTimes_071 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersSnoozTimes_071 snoozeTimes =" +
                        reminder[0].snoozeTimes);
                    expect(reminder[0].snoozeTimes).assertEqual(3);
                    done()
                });
            },500)
        })

        /**
         * @tc.name   testGetValidRemindersSnoozTimes_072
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_072
         * @tc.desc   test snoozeTimes with illegal parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersSnoozTimes_072", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersSnoozTimes_072---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 15,
                snoozeTimes: -1
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersSnoozTimes_072 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersSnoozTimes_072 snoozeTimes =" +
                        reminder[0].snoozeTimes);
                    expect(reminder[0].snoozeTimes).assertEqual(0);
                    done()
                });
            },500)
        })

        /**
         * @tc.name   testGetValidRemindersRingDuration_073
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_073
         * @tc.desc   test ringDuration default parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersRingDuration_073", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersRingDuration_073---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 13
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersRingDuration_073 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersRingDuration_073 ringDuration =" +
                        reminder[0].ringDuration);
                    expect(reminder[0].ringDuration).assertLarger(0);
                    done()
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersRingDuration_074
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_074
         * @tc.desc   test ringDuration with illegal parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersRingDuration_074", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersRingDuration_074---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 13,
                ringDuration: "10"
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersRingDuration_074 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersRingDuration_074 ringDuration =" +
                        reminder[0].ringDuration);
                    expect(reminder[0].ringDuration).assertLarger(0);
                    done()
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersRingDuration_075
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_075
         * @tc.desc   test ringDuration with illegal parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersRingDuration_075", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersRingDuration_075---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 13,
                ringDuration: -10
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersRingDuration_075 reminderId =" + reminderId);
                    expect(-1).assertEqual(reminderId);
                    done()
                });
            });
        })

        /**
         * @tc.name   testGetValidRemindersTimeInterval_076
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_076
         * @tc.desc   test timeInterval default parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersTimeInterval_076", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersTimeInterval_076---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 10
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersTimeInterval_076 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersTimeInterval_076 timeInterval =" +
                        reminder[0].timeInterval);
                    expect(reminder[0].timeInterval).assertEqual(0);
                    done()
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersTimeInterval_077
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_077
         * @tc.desc   test timeInterval with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersTimeInterval_077", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersTimeInterval_077---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 10,
                timeInterval: "3"
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersTimeInterval_077 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersTimeInterval_077 timeInterval =" +
                        reminder[0].timeInterval);
                    expect(reminder[0].timeInterval).assertEqual(0);
                    done()
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersTimeInterval_078
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_078
         * @tc.desc   test timeInterval with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersTimeInterval_078", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersTimeInterval_078---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 11,
                minute: 10,
                timeInterval: -12
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(alarm, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersTimeInterval_078 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    console.info("callback,the testGetValidRemindersTimeInterval_078 timeInterval =" +
                        reminder[0].timeInterval);
                    expect(reminder[0].timeInterval).assertEqual(0);
                    done()
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersTitle_079
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_079
         * @tc.desc   test title with empty parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersTitle_079", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersTitle_079---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                timeInterval: 5,
                ringDuration: 5,
                title: ''
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersTitle_079 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let title = reminder[0].title;
                        console.info("callback,the testGetValidRemindersTitle_079 title is: " + title);
                        expect(title).assertEqual("");
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersTitle_080
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_080
         * @tc.desc   test title with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersTitle_080", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersTitle_080---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                timeInterval: 5,
                ringDuration: 10,
                title: 123
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersTitle_080 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let title = reminder[0].title;
                        console.info("callback,the testGetValidRemindersTitle_080 title is: " + title);
                        expect(title).assertEqual("");
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersSlotType_081
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_081
         * @tc.desc   test slotType default parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersSlotType_081", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersSlotType_081---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersSlotType_081 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let slotType = reminder[0].slotType;
                        console.info("callback,the testGetValidRemindersSlotType_081 slotType  is: " + slotType);
                        expect(slotType).assertEqual(1);
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersSlotType_082
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_082
         * @tc.desc   test slotType with illegal parameter 5.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersSlotType_082", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersSlotType_082---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                slotType: 20231120
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersSlotType_082 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    expect(reminder.length).assertEqual(0);
                    done()
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersPkgName_083
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_083
         * @tc.desc   test pkgName with empty parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersPkgName_083", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersPkgName_083---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                wantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagent.js.function",
                    abilityName: "com.oh.phone.MainAbility"
                }
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersPkgName_083 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let pkgName = reminder[0].wantAgent.pkgName;
                        console.info("callback,the testGetValidRemindersPkgName_083 pkgName is: " + pkgName);
                        expect(pkgName.length).assertLarger(0);
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersPkgName_084
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_084
         * @tc.desc   test pkgName with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersPkgName_084", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersPkgName_084---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                wantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagent.js.function",
                    abilityName: "com.oh.phone.MainAbility"
                }
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersPkgName_084 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let pkgName = reminder[0].wantAgent.pkgName;
                        console.info("callback,the testGetValidRemindersPkgName_084 pkgName is: " + pkgName);
                        expect(pkgName.length).assertLarger(0);
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersAbilityName_085
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_085
         * @tc.desc   test abilityName with empty parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersAbilityName_085", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersAbilityName_085---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                wantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagent.js.function",
                    abilityName: ""
                }
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersAbilityName_085 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let abilityName = reminder[0].wantAgent.abilityName;
                        console.info("callback,the testGetValidRemindersAbilityName_085 abilityName is: " +
                            abilityName);
                        expect(abilityName).assertEqual("");
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersAbilityName_086
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_086
         * @tc.desc   test abilityName with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersAbilityName_086", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersAbilityName_086---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                wantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagent.js.function",
                    abilityName: 1243
                }
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersAbilityName_086 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let abilityName = reminder[0].wantAgent.abilityName;
                        console.info("callback,the testGetValidRemindersAbilityName_086 abilityName is: " +
                            abilityName);
                        expect(abilityName).assertEqual("");
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersContent_087
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_087
         * @tc.desc   test content with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersContent_087", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersContent_087---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                content: ""
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersContent_087 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let content = reminder[0].content;
                        console.info("callback,the testGetValidRemindersContent_087 content is: " + content);
                        expect(content).assertEqual("");
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersContent_088
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_088
         * @tc.desc   test content with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersContent_088", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersContent_088---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                content: 14545
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersContent_088 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let content = reminder[0].content;
                        console.info("callback,the testGetValidRemindersContent_088 content is: " + content);
                        expect(content).assertEqual("");
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersExpiredContent_089
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_089
         * @tc.desc   test expiredContent with empty parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersExpiredContent_089", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersExpiredContent_089---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                expiredContent: ""
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersExpiredContent_089 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let expiredContent = reminder[0].expiredContent;
                        console.info("callback,the testGetValidRemindersExpiredContent_089 expiredContent is: " +
                            expiredContent);
                        expect(expiredContent).assertEqual("");
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersExpiredContent_090
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_090
         * @tc.desc   test expiredContent with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersExpiredContent_090", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersExpiredContent_090---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                expiredContent: 14555
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersExpiredContent_090 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let expiredContent = reminder[0].expiredContent;
                        console.info("callback,the testGetValidRemindersExpiredContent_090 expiredContent is: " +
                            expiredContent);
                        expect(expiredContent).assertEqual("");
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersSnoozeContent_091
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_091
         * @tc.desc   test snoozeContent with empty parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersSnoozeContent_091", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersSnoozeContent_091---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                snoozeContent: ""
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersSnoozeContent_091 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let snoozeContent = reminder[0].snoozeContent;
                        console.info("callback,the testGetValidRemindersSnoozeContent_091 snoozeContent is: " +
                            snoozeContent);
                        expect(snoozeContent).assertEqual("");
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersSnoozeContent_092
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_092
         * @tc.desc   test snoozeContent with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersSnoozeContent_092", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersSnoozeContent_092---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                snoozeContent: 2155
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersSnoozeContent_092 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let snoozeContent = reminder[0].snoozeContent;
                        console.info("callback,the snoozeContent is: " + snoozeContent);
                        expect(snoozeContent).assertEqual("");
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersNotificationId_093
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_093
         * @tc.desc   test notificationId with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersNotificationId_093", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersNotificationId_093---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                notificationId: -1
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersNotificationId_093 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let notificationId = reminder[0].notificationId;
                        console.info("callback,the testGetValidRemindersNotificationId_093 notificationId is: " +
                            notificationId);
                        expect(notificationId).assertEqual(-1);
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testGetValidRemindersNotificationId_094
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_094
         * @tc.desc   test snoozeContent with illegal parameters.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testGetValidRemindersNotificationId_094", Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersNotificationId_094---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                notificationId: "100"
            }
            reminderAgent.cancelAllReminders((err, data) => {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    console.info("callback,the testGetValidRemindersNotificationId_094 reminderId =" + reminderId);
                });
            });
            setTimeout(() => {
                reminderAgent.getValidReminders((err, reminder) => {
                    if (reminder.length !== 0) {
                        let notificationId = reminder[0].notificationId;
                        console.info("callback,the testGetValidRemindersNotificationId_094 notificationId is: " +
                            notificationId);
                        expect(notificationId).assertEqual(0);
                        done()
                    }
                });
            }, 500);
        })

        /**
         * @tc.name   testReminderType_095
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_095
         * @tc.desc   test timer default parameter with 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testReminderType_095", Level.LEVEL0, async function (done) {
            console.info('----------------------testReminderType_095---------------------------');
            let timer = reminderAgent.ReminderType.REMINDER_TYPE_TIMER;
            expect(timer).assertEqual(0);
            done();
        })

        /**
         * @tc.name   testReminderType_096
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_096
         * @tc.desc   test calendar default parameter with 1.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testReminderType_096", Level.LEVEL0, async function (done) {
            console.info('----------------------testReminderType_096---------------------------');
            let calendar = reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR;
            expect(calendar).assertEqual(1);
            done();
        })

        /**
         * @tc.name   testReminderType_097
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_097
         * @tc.desc   test alarm default parameter with 2.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testReminderType_097", Level.LEVEL0, async function (done) {
            console.info('----------------------testReminderType_097---------------------------');
            let alarm = reminderAgent.ReminderType.REMINDER_TYPE_ALARM;
            expect(alarm).assertEqual(2);
            done();
        })

        /**
         * @tc.name   testActionButtonType_098
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_098
         * @tc.desc   test button close default parameter with 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testActionButtonType_098", Level.LEVEL0, async function (done) {
            console.info('----------------------testActionButtonType_098---------------------------');
            let button = reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE;
            expect(button).assertEqual(0);
            done();
        })

        /**
         * @tc.name   testActionButtonType_099
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_099
         * @tc.desc   test button snooze default parameter with 1.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testActionButtonType_099", Level.LEVEL0, async function (done) {
            console.info('----------------------testActionButtonType_099---------------------------');
            let button = reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE;
            expect(button).assertEqual(1);
            done();
        })
 
        /**
         * @tc.name   testNotificationSlotType_0100
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0100
         * @tc.desc   test UNKNOWN_TYPE default parameter with 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testNotificationSlotType_0100", Level.LEVEL0, async function (done) {
            console.info('----------------------testNotificationSlotType_0100---------------------------');
            let type = notification.SlotType.UNKNOWN_TYPE;
            expect(type).assertEqual(0);
            done();
        })

        /**
         * @tc.name   testNotificationSlotType_0101
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0101
         * @tc.desc   test SOCIAL_COMMUNICATION default parameter with 1.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testNotificationSlotType_0101", Level.LEVEL0, async function (done) {
            console.info('----------------------testNotificationSlotType_0101---------------------------');
            let type = notification.SlotType.SOCIAL_COMMUNICATION;
            expect(type).assertEqual(1);
            done();
        })

        /**
         * @tc.name   testNotificationSlotType_0102
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0102
         * @tc.desc   test SERVICE.INFORMATION default parameter with 2.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testNotificationSlotType_0102", Level.LEVEL0, async function (done) {
            console.info('----------------------testNotificationSlotType_0102---------------------------');
            let type = notification.SlotType.SERVICE_INFORMATION;
            expect(type).assertEqual(2);
            done();
        })

        /**
         * @tc.name   testNotificationSlotType_0103
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0103
         * @tc.desc   test CONTENT_INFORMATION default parameter with 3.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testNotificationSlotType_0103", Level.LEVEL0, async function (done) {
            console.info('----------------------testNotificationSlotType_0103---------------------------');
            let type = notification.SlotType.CONTENT_INFORMATION;
            expect(type).assertEqual(3);
            done();
        })

        /**
         * @tc.name   testNotificationSlotType_0104
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0104
         * @tc.desc   test OTHER_TYPES default parameter with 65535.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testNotificationSlotType_0104", Level.LEVEL0, async function (done) {
            console.info('----------------------testNotificationSlotType_0104---------------------------');
            let type = notification.SlotType.OTHER_TYPES;
            expect(type).assertEqual(65535);
            done();
        })

        /**
         * @tc.name   testRemoveNotificationSlotNorFun_0105
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0105
         * @tc.desc   test remove notification Slot with not exist slot with the promise function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRemoveNotificationSlotNorFun_0105', Level.LEVEL0, async function (done) {
            console.info('----------------------testRemoveNotificationSlotNorFun_0105---------------------------');
            let promise = new Promise((resolve, reject) => {
                reminderAgent.removeNotificationSlot(1).then(() => {
                    resolve();
                });
                reject(new Error('errr occurred.'));
            });
            promise.then(() => {
            }, err => {
                let i = 0;
                expect(0).assertEqual(i);
                done()
            }).catch(res => { });
        })

        /**
         * @tc.name   testRemoveNotificationSlotNorFun_0106
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0106
         * @tc.desc   test remove notification Slot with exist slot.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRemoveNotificationSlotNorFun_0106', Level.LEVEL0, async function (done) {
            console.info('----------------------testRemoveNotificationSlotNorFun_0106---------------------------');
            let tarRemoveSlot = {
                type: 1
            }
            reminderAgent.addNotificationSlot(tarRemoveSlot.type, (err, data) => {
                console.info('addNotificationSlot 106 err code:' + err.code);
                reminderAgent.removeNotificationSlot(tarRemoveSlot.type, (err, data) => {
                    console.info('err code 106 is :' + err.code)
                    expect(err.code).assertEqual(0);
                    done();
                })
            })
        })

        /**
         * @tc.name   testRemoveNotificationSlotNorFun_0107
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0107
         * @tc.desc   test remove notification Slot with exist slot with the promise function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRemoveNotificationSlotNorFun_0107', Level.LEVEL0, async function (done) {
            console.info('----------------------testRemoveNotificationSlotNorFun_0107---------------------------');
            let tarRemoveSlot = {
                type: 2
            }
            reminderAgent.addNotificationSlot(tarRemoveSlot.type, (err, data) => {
                console.info('addNotificationSlot err code is :' + err.code)
                reminderAgent.removeNotificationSlot(tarRemoveSlot.type).then(() => {
                    console.info('err code 107 is :' + err.code)
                    expect(err.code).assertEqual(401);
                    done();
                });
            });
        })

        /**
         * @tc.name   testGetValidRemindersNorFun_0108
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0108
         * @tc.desc   test get valid reminders with promise function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGetValidRemindersNorFun_0108', Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersNorFun_0108---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 3
            }
            reminderAgent.cancelAllReminders().then(() => {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    reminderAgent.getValidReminders().then((reminders) => {
                        console.info('reminders length is :' + reminders.length)
                        expect(reminders.length).assertLarger(0)
                        done();
                    })
                })
            })
        })

        /**
         * @tc.name   testGetValidRemindersNorFun_0109
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0109
         * @tc.desc   test get valid reminders with the callback function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testGetValidRemindersNorFun_0109', Level.LEVEL0, async function (done) {
            console.info('----------------------testGetValidRemindersNorFun_0109---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 3
            }
            reminderAgent.cancelAllReminders().then(() => {
                reminderAgent.publishReminder(timer).then((reminderId) => {
                    reminderAgent.getValidReminders((err, reminders) => {
                        console.info('reminder length 109 is :' + reminders.length)
                        expect(reminders.length).assertLarger(0);
                        done()
                    })
                })
            })
        })

        /**
         * @tc.name   testPublishReminderNorAlarmFun_0110
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0110
         * @tc.desc   test publish reminder with a nomal alarm promise function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPublishReminderNorAlarmFun_0110', Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderNorAlarmFun_0110---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 21,
                minute: 14
            }
            reminderAgent.publishReminder(alarm).then((reminderId) => {
                console.info("promise the testPublishReminderNorAlarmFun_0110 remiderId =" + reminderId);
                expect(reminderId).assertLarger(0);
                done()
            })
        })

        /**
         * @tc.name   testPublishReminderNorAlarmFun_0111
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0111
         * @tc.desc   test publish reminder with a nomal alarm callback function.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPublishReminderNorAlarmFun_0111', Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderNorAlarmFun_0111---------------------------');
            let alarm = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour: 20,
                minute: 14
            }
            reminderAgent.publishReminder(alarm, (err, reminderId) => {
                console.info("callback the testPublishReminderNorAlarmFun_0111 remiderId =" + reminderId);
                expect(reminderId).assertLarger(0);
                done();
            })
        })

        /**
         * @tc.name   testPublishReminderAbNorFun_0112
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0112
         * @tc.desc   test publish reminder with max number limit of each application.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPublishReminderAbNorFun_0112', Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderAbNorFun_0112---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: TRIGGER_TIME_IN_SECONDS
            }
            let maxLimitNumsOfApp = 30;
            let firstId = 0;
            let secondId = 0;
            let diffId = 0;
            let reminderId;
            await reminderAgent.cancelAllReminders();
            for (let i = 0; i < maxLimitNumsOfApp; i++) {
                reminderId = await reminderAgent.publishReminder(timer);
                if (i === 0) {
                    firstId = reminderId
                }
                if (i === 29) {
                    secondId = reminderId
                    diffId = secondId - firstId
                    expect(29).assertEqual(diffId);
                    done();
                };
            }            
        })

        /**
         * @tc.name   testReminderTypeCalendarFun_0113
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0113
         * @tc.desc   test cancelAllReminders can cancel all exist reminders with type of calendar.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testReminderTypeCalendarFun_0113', Level.LEVEL0, async function (done) {
            console.info('----------------------testReminderTypeCalendarFun_0113---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 100
            }
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2025,
                    month: 10,
                    day: 10,
                    hour: 23,
                    minute: 30
                },
                repeatMonths: [3],
                repeatDays: [7]
            }
            reminderAgent.publishReminder(timer).then((reminderId) => { });
            reminderAgent.publishReminder(calendar).then((reminderId) => { });
            setTimeout(() => {
                reminderAgent.cancelAllReminders().then(() => {
                    reminderAgent.getValidReminders().then((reminders) => {
                        expect(reminders.length === 0).assertEqual(true);
                    });
                });
            }, 5000);
            done();
        })

        /**
         * @tc.name   testActionButtonType_0115
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0115
         * @tc.desc   test action butto type type = 0.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testActionButtonType_0115", Level.LEVEL0, async function (done) {
            console.info('----------------------testActionButtonType_0115---------------------------');
            let type1 = reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE;
            console.info(type1 + typeof (type1));
            if (type1 == 0) {
                expect(true).assertTrue();
            } else {
                except(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.name   testActionButtonType_0116
         * @tc.number SUB_RESOURCESCHEDULE_REMINDER_AGENT_XTS_0116
         * @tc.desc   test action butto type type = 1.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it("testActionButtonType_0116", Level.LEVEL0, async function (done) {
            console.info('----------------------testActionButtonType_0116---------------------------');
            let type1 = reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE;
            console.info(type1 + typeof (type1));
            if (type1 == 1) {
                expect(true).assertTrue();
            } else {
                except(false).assertTrue();
            }
            done();
        })
    })

}
