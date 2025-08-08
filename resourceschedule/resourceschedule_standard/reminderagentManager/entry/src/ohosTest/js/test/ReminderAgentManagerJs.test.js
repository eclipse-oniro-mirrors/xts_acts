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
import reminderAgent from '@ohos.reminderAgentManager'
import notificationManager from '@ohos.notificationManager';

export default function ReminderAgentManagerTest() {
    describe('ReminderAgentManagerTest', function () {
        beforeAll(function () {

            /*
             * @tc.setup: setup invoked before all testcases
             */
            console.info('beforeAll caled')
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
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0001
         * @tc.desc      test ReminderRequest Attribute tapDismissed and autoDeletedTime
         */
        it("reminderRequestAttribute_0001", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0001---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                tapDismissed: true,
                autoDeletedTime: 20000000000
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0001 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0001 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("reminderRequestAttribute_0001 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0002
         * @tc.desc      test ReminderRequest Attribute groupId
         */
        it("reminderRequestAttribute_0002", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0002---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 20,
                groupId: ''
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0002 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0002 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("reminderRequestAttribute_0002 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0003
         * @tc.desc      test ReminderRequest ActionButton titleResource
         */
        it("reminderRequestAttribute_0003", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0003---------------------------');
            const currentYear = new Date().getFullYear();
            const nextYear = currentYear + 1
            let timer = {
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
                ]
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0003 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0003 callback reminderId = ' + reminderId);
                        try {
                            reminderAgent.getValidReminders((err, reminder) => {
                                if (reminder.length = 0) {
                                    reminder = [{ titleResource: '' }]
                                }
                                console.info('reminderRequestAttribute_0003 callback reminder = ' + reminder.titleResource);
                                expect(reminderId).assertLarger(0);
                                done();
                            })
                        } catch (error) {
                            console.log("reminderRequestAttribute_0003 getValidReminders error.code:" + error.code);
                        }
                    }
                })
            } catch (error) {
                console.log("reminderRequestAttribute_0003 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0005
         * @tc.desc      test ReminderRequest snoozeSlotType
         */
        it("reminderRequestAttribute_0005", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0005---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                slotType: 2,
                snoozeSlotType: 2
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0005 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0005 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("reminderRequestAttribute_0005 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0006
         * @tc.desc      test ReminderRequest customRingUri
         */
        it("reminderRequestAttribute_0006", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0006---------------------------');
            let timer = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_TIMER,
                triggerTimeInSeconds: 10,
                customRingUri: "#"
            }
            try {
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0006 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0006 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.log("reminderRequestAttribute_0006 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0004
         * @tc.desc      test timer normal parameter,return with promise.
         */
        it("reminderRequestAttribute_0004", Level.LEVEL0, async function (done) {
            console.info('----------------------testPublishReminderTimer_030---------------------------');
            try {
                reminderAgent.cancelAllReminders().then((err, data) => {
                    console.info('reminderRequestAttribute_0004 cancelAllReminders success');
                    expect(true).assertTrue();
                    done();
                });
            } catch (error) {
                console.log("reminderRequestAttribute_0004 cancelAllReminders error.code:" + error.code);
            }
        })

        /**
          * @tc.number    
          * @tc.name      reminderRequestAttribute_0007
          * @tc.desc      test publishReminder callbacl REMINDER_TYPE_CALENDAR
          */
        it("reminderRequestAttribute_0007", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0007---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2024,
                    month: 1,
                    day: 31,
                    hour: 10,
                    minute: 30,
                    second: 10
                },
                repeatMonths: [3],
                repeatDays: [6, 7],
                actionButton: [
                    {
                        title: "close",
                        titleResource: 'English',
                        type: 0,
                    },
                    {
                        title: "snooze",
                        titleResource: 'English',
                        type: 1
                    }
                ],
                wantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagentMgr.js.function",
                    abilityName: "ohos.acts.resourceschedule.reminderagentMgr.js.function.MainAbility"
                },
                maxScreenWantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagentMgr.js.function",
                    abilityName: "ohos.acts.resourceschedule.reminderagentMgr.js.function.MainAbility"
                },
                ringDuration: 2,
                snoozeTimes: 1,
                timeInterval: 3,
                title: "this is title",
                content: "this is content",
                expiredContent: "this reminder has expired",
                snoozeContent: "remind later",
                notificationId: 500,
                groupId: 'this is groupId',
            }
            try {
                reminderAgent.publishReminder(calendar, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0007 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0007 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.info("reminderRequestAttribute_0007 publishReminder error.code:" + error.code);
            }
        })


        /**
          * @tc.number    
          * @tc.name      reminderRequestAttribute_0008
          * @tc.desc      test publishReminder promise REMINDER_TYPE_CALENDAR
          */
        it("reminderRequestAttribute_0008", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0008---------------------------');
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2024,
                    month: 1,
                    day: 28,
                    hour: 13,
                    minute: 14,
                    second: 32
                },
                repeatMonths: [5],
                repeatDays: [1, 2, 3, 4, 5],
                actionButton: [
                    {
                        title: "close",
                        titleResource: 'English',
                        type: 0,
                    },
                    {
                        title: "snooze",
                        titleResource: 'English',
                        type: 1
                    }
                ],
                wantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagentMgr.js.function",
                    abilityName: "ohos.acts.resourceschedule.reminderagentMgr.js.function.MainAbility"
                },
                maxScreenWantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagentMgr.js.function",
                    abilityName: "ohos.acts.resourceschedule.reminderagentMgr.js.function.MainAbility"
                },
                ringDuration: 10,
                snoozeTimes: 3,
                timeInterval: 30,
                title: "#",
                content: "#",
                expiredContent: "#",
                snoozeContent: "#",
                notificationId: 1000,
                groupId: '#',
            }
            try {
                reminderAgent.publishReminder(calendar).then((reminderId) => {
                    console.info('reminderRequestAttribute_0008 promise reminderId = ' + reminderId);
                    expect(reminderId).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('reminderRequestAttribute_0008 promise err.code is :' + err.code);
                });
            } catch (error) {
                console.info("reminderRequestAttribute_0008 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0009
         * @tc.desc      test getValidReminders callback
         */
        it("reminderRequestAttribute_0009", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0009---------------------------');
            try {
                reminderAgent.getValidReminders((err, reminders) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0009 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0009 callback reminders.length = ' + reminders.length);
                        expect(reminders.length).assertLarger(0);
                        done();
                    }
                })
            } catch (error) {
                console.info("reminderRequestAttribute_0009 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0010
         * @tc.desc      test getValidReminders promise
         */
        it("reminderRequestAttribute_0010", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0010---------------------------');
            try {
                reminderAgent.getValidReminders().then((reminders) => {
                    console.info('reminderRequestAttribute_0010 promise reminders.length = ' + reminders.length);
                    expect(reminders.length).assertLarger(0);
                    done();
                }).catch((err) => {
                    console.info('reminderRequestAttribute_0010 promise err.code is :' + err.code);
                })
            } catch (error) {
                console.info("reminderRequestAttribute_0010 getValidReminders error.code:" + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0011
         * @tc.desc      test cancelAllReminders callback.
         */
        it("reminderRequestAttribute_0011", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0011---------------------------');
            try {
                reminderAgent.cancelAllReminders((err, data) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0011 cancelAllReminders callback er.code:' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0011 cancelAllReminders callback date =' + data);
                        expect(true).assertTrue();
                        done();
                    }
                });
            } catch (error) {
                console.info("reminderRequestAttribute_0011 cancelAllReminders error.code:" + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name    reminderRequestAttribute_0012
         * @tc.desc    test addNotificationSlot promise mySlot type 3
         */
        it('reminderRequestAttribute_0012', Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0012---------------------------');
            let mySlot = {
                type: 5
            }
            try {
                reminderAgent.addNotificationSlot(mySlot).then(() => {
                    console.info('reminderRequestAttribute_0012  promise mySliot.type is :' + mySlot.type)
                    expect(mySlot.type).assertEqual(5);
                    done();
                }, (err) => {
                    console.info('reminderRequestAttribute_0012 promise err.code is :' + err.code)
                });
            } catch (error) {
                console.info('reminderRequestAttribute_0012 addNotificationSlot error.code is :' + error.code)
            }
        })

        /**
         * @tc.number  
         * @tc.name    reminderRequestAttribute_0013
         * @tc.desc    test removeNotificationSlot promise
         */
        it('reminderRequestAttribute_0013', Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0013---------------------------');
            try {
                reminderAgent.removeNotificationSlot(5).then(() => {
                    console.info("reminderRequestAttribute_0013 promise success");
                    expect(true).assertTrue();
                    done();
                }).catch((err) => {
                    console.info("reminderRequestAttribute_0013 promise err.code:" + err.code);
                });
            } catch (error) {
                console.info("removeNotificationSlot promise error.code:" + error.code)
            }
        })

        /**
         * @tc.number   
         * @tc.name    reminderRequestAttribute_0014
         * @tc.desc    test addNotificationSlot callback mySlot type 2
         */
        it('reminderRequestAttribute_0014', Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0014---------------------------');
            let mySlot = {
                type: 10086
            }
            try {
                reminderAgent.addNotificationSlot(mySlot, (err) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0014 callback err.code is :' + err.code)
                    } else {
                        console.info('reminderRequestAttribute_0014 callback success ')
                    }
                });
            } catch (error) {
                console.info('reminderRequestAttribute_0014 addNotificationSlot error.code is :' + error.code)
                expect(error.code).assertEqual('401');
                done();
            }
        })

        /**
         * @tc.number  
         * @tc.name    reminderRequestAttribute_0015
         * @tc.desc    test removeNotificationSlot callback
         */
        it('reminderRequestAttribute_0015', Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0015---------------------------');
            try {
                reminderAgent.removeNotificationSlot(10086, (err) => {
                    if (err) {
                        console.info("reminderRequestAttribute_0015 callback err.code:" + err.code);
                    } else {
                        console.info("reminderRequestAttribute_0015 callback success");
                    }
                });
            } catch (error) {
                console.info("reminderRequestAttribute_0015 removeNotificationSlot error.code:" + error.code)
                expect(error.code).assertEqual(401);
                done();
            }
        })


        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0016
         * @tc.desc      test UNKNOWN_TYPE default parameter with 0.
         */
        it("reminderRequestAttribute_0016", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0016---------------------------');
            let type = notificationManager.SlotType.UNKNOWN_TYPE;
            expect(type).assertEqual(0);
            done();
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0017
         * @tc.desc      test SOCIAL_COMMUNICATION default parameter with 1.
         */
        it("reminderRequestAttribute_0017", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0017---------------------------');
            let type = notificationManager.SlotType.SOCIAL_COMMUNICATION;
            expect(type).assertEqual(1);
            done();
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0018
         * @tc.desc      test SERVICE.INFORMATION default parameter with 2.
         */
        it("reminderRequestAttribute_0018", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0018---------------------------');
            let type = notificationManager.SlotType.SERVICE_INFORMATION;
            expect(type).assertEqual(2);
            done();
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0019
         * @tc.desc      test CONTENT_INFORMATION default parameter with 3.
         */
        it("reminderRequestAttribute_0019", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0019---------------------------');
            let type = notificationManager.SlotType.CONTENT_INFORMATION;
            expect(type).assertEqual(3);
            done();
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0020
         * @tc.desc      test CONTENT_INFORMATION default parameter with 3.
         */
        it("reminderRequestAttribute_0020", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0020---------------------------');
            let type = notificationManager.SlotType.CUSTOMER_SERVICE;
            expect(type).assertEqual(5);
            done();
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0021
         * @tc.desc      test OTHER_TYPES default parameter with 65535.
         */
        it("reminderRequestAttribute_0021", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0021`---------------------------');
            let type = notificationManager.SlotType.OTHER_TYPES;
            expect(type).assertEqual(65535);
            done();
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0022
         * @tc.desc      test button close default parameter with 0.
         */
        it("reminderRequestAttribute_0022", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0022---------------------------');
            let button = reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE;
            expect(button).assertEqual(0);
            done();
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0023
         * @tc.desc      test button snooze default parameter with 1.
         */
        it("reminderRequestAttribute_0023", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0023---------------------------');
            let button = reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE;
            expect(button).assertEqual(1);
            done();
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0024
         * @tc.desc      test publishReminder REMINDER_TYPE_ALARM 
         */
        it("reminderRequestAttribute_0024", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0024---------------------------');
            try {
                let alarm = {
                    reminderType: reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                    hour: 13,
                    minute: 14,
                    daysOfWeek: [1, 2, 3, 4, 5]
                }
                reminderAgent.publishReminder(alarm).then((reminderId) => {
                    if (reminderId != -1) {
                        console.info("reminderRequestAttribute_0024 reminderId =" + reminderId);
                        expect(reminderId).assertLarger(0);
                        done()
                    }
                }).catch((err => {
                    console.info('reminderRequestAttribute_0024 promise err.code is :' + err.code);
                }))
            } catch (error) {
                console.info("reminderRequestAttribute_0024 publishReminder err.code:" + error.code);
            }

        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0025
         * @tc.desc      test reminderRequest WantAgent parameters.
         */
        it("reminderRequestAttribute_0025", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0025---------------------------');
            let timer = {
                reminderType:reminderAgent.ReminderType.REMINDER_TYPE_ALARM,
                hour:6,
                minute:30,
                daysOfWeek:[1],
                actionButton:[{
                    title:'close',
                    titleResource:'this is 0025 close button',
                    type:reminderAgent.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE
                }],
                wantAgent:{
                    pkgName:"ohos.acts.resourceschedule.reminderagentMgr.js.function",
                    abilityName:"ohos.acts.resourceschedule.reminderagentMgr.js.function.MainAbility",
                    parameters:{"aa":"aaa"},
                    uri:"#"
                }
            }
            try{
                reminderAgent.publishReminder(timer, (err, reminderId) => {
                    if(err){
                        console.info('reminderRequestAttribute_0025 callback err.code is : ' + err.code)
                    }else{
                        console.info('reminderRequestAttribute_0025 callback reminderId is : ' + reminderId)
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                })
            }catch(error){
                console.info('reminderRequestAttribute_0025 publishReminder err.code is : ' + err.code)
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0026
         * @tc.desc      test getValidReminders promise. 
         */
        it("reminderRequestAttribute_0026", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0026---------------------------');
            try{
                reminderAgent.getAllValidReminders().then((reminderInfo) => {
                    console.info('reminderRequestAttribute_0026 reminderInfo = ' + JSON.stringify(reminderInfo));
                    let reminderInfoArr = [];
                    reminderInfoArr = reminderInfo;
                    let reminderId = 0;
                    let reminderReq = {};
                    console.info('reminderRequestAttribute_0026 reminderInfoArr = ' + JSON.stringify(reminderInfoArr));
                    for(let i = 0; i < reminderInfoArr.length; i++){
                        console.info('reminderRequestAttribute_0026 for is ok');
                        if(reminderInfoArr[i].reminderReq.minute == 30){
                            console.info('reminderRequestAttribute_0026 if is ok');
                            reminderId = reminderInfoArr[i].reminderId;
                            Object.assign(reminderReq, reminderInfoArr[i].reminderReq);
                        }
                    }
                    console.info('reminderRequestAttribute_0026 = ' + JSON.stringify(reminderReq));
                    expect(reminderInfoArr.length).assertLarger(0);
                    expect(reminderId).assertLarger(0);
                    expect(reminderReq.hour).assertEqual(6);
                    done();
                }).catch((err) =>{
                    console.info('reminderRequestAttribute_0026 promise err.code is : ' + err.code);
                })
            }catch(error){
                console.info('reminderRequestAttribute_0026 getValidReminders error.code is : ' + error.code);
            }
        })
        
        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0027
         * @tc.desc      test timer normal parameter, return with promise. 
         */
        it("reminderRequestAttribute_0027", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0027---------------------------');
            try{
                reminderAgent.cancelAllReminders().then((err, data) => {
                    console.info('reminderRequestAttribute_0027 cancelAllReminders success');
                    expect(true).assertTrue();
                    done();
                })
            }catch(error){
                console.info('reminderRequestAttribute_0027 cancelAllReminders error.code is : ' + error.code);
            }
        })
        
        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0028
         * @tc.desc      test addExcludeDate promise. 
         */
        it("reminderRequestAttribute_0028", Level.LEVEL0, async function (done) {
            let calendar = {
                reminderType: reminderAgent.ReminderType.REMINDER_TYPE_CALENDAR,
                dateTime: {
                    year: 2024,
                    month: 7,
                    day: 28,
                    hour: 13,
                    minute: 30,
                    second: 32
                },
                endDateTime: {
                    year: 2024,
                    month: 7,
                    day: 31,
                    hour: 10,
                    minute: 30,
                    second: 10
                },
                repeatMonths: [3],
                repeatDays: [6, 7],
                actionButton: [
                    {
                        title: "close",
                        titleResource: 'English',
                        type: 0,
                    },
                    {
                        title: "snooze",
                        titleResource: 'English',
                        type: 1
                    }
                ],
                wantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagentMgr.js.function",
                    abilityName: "ohos.acts.resourceschedule.reminderagentMgr.js.function.MainAbility"
                },
                maxScreenWantAgent: {
                    pkgName: "ohos.acts.resourceschedule.reminderagentMgr.js.function",
                    abilityName: "ohos.acts.resourceschedule.reminderagentMgr.js.function.MainAbility"
                },
                ringDuration: 2,
                snoozeTimes: 1,
                timeInterval: 3,
                title: "this is addExcludeDate title",
                content: "this is content",
                expiredContent: "this reminder has expired",
                snoozeContent: "remind later",
                notificationId: 500,
                groupId: 'this is groupId',
            }
            try {
                reminderAgent.publishReminder(calendar, (err, reminderId) => {
                    if (err) {
                        console.info('reminderRequestAttribute_0028 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0028 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                    }
                    let reqReminderId = reminderId;
                    let date = new Date();
                    reminderAgent.addExcludeDate(reqReminderId, date).then(() => {
                        expect(true).assertTrue();
                        done();
                    }).catch((err) => {
                        console.error("promise err code:" + err.code + " message:" + err.message);
                        expect(false).assertTrue();
                        done();
                    });
                })
            } catch (error) {
                console.info("reminderRequestAttribute_0028 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0029
         * @tc.desc      test getExcludeDates promise. 
         */
        it("reminderRequestAttribute_0029", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0029---------------------------');
            try {
                reminderAgent.getAllValidReminders().then((reminderInfo) => {
                    console.info('reminderRequestAttribute_0029 reminderInfo = ' + JSON.stringify(reminderInfo));
                    let reminderInfoArr = [];
                    reminderInfoArr = reminderInfo;
                    let reminderId = 0;
                    console.info('reminderRequestAttribute_0029 reminderInfoArr = ' + JSON.stringify(reminderInfoArr));
                    for (let i = 0; i < reminderInfoArr.length; i++) {
                        console.info('reminderRequestAttribute_0029 for is ok');
                        if (reminderInfoArr[i].reminderReq.dateTime.month == 7) {
                            reminderId = reminderInfoArr[i].reminderId;
                        }
                    }
                    console.info('reminderRequestAttribute_0029 reminderId' + reminderId)
                    reminderAgent.getExcludeDates(reminderId).then((dates) => {
                        console.info('reminderRequestAttribute_0029 dates: ' + JSON.stringify(dates));
                        expect(dates.length).assertLarger(0)
                        done();
                    }).catch((err) => {
                        console.error("promise err code:" + err.code + " message:" + err.message);
                        expect(false).assertTrue();
                        done();
                    });
                }).catch((err) => {
                    console.info('reminderRequestAttribute_0029 promise err.code is : ' + err.code);
                })
            } catch (error) {
                console.info('reminderRequestAttribute_0029 getValidReminders error.code is : ' + error.code);
            }
        })

        /**
         * @tc.number    
         * @tc.name      reminderRequestAttribute_0030
         * @tc.desc      test deleteExcludeDates promise. 
         */
        it("reminderRequestAttribute_0030", Level.LEVEL0, async function (done) {
            console.info('----------------------reminderRequestAttribute_0030---------------------------');
            try {
                reminderAgent.getAllValidReminders().then((reminderInfo) => {
                    console.info('reminderRequestAttribute_0030 reminderInfo = ' + JSON.stringify(reminderInfo));
                    let reminderInfoArr = [];
                    reminderInfoArr = reminderInfo;
                    let reminderId = 0;
                    console.info('reminderRequestAttribute_0030 reminderInfoArr = ' + JSON.stringify(reminderInfoArr));
                    for (let i = 0; i < reminderInfoArr.length; i++) {
                        console.info('reminderRequestAttribute_0030 for is ok');
                        if (reminderInfoArr[i].reminderReq.dateTime.month == 7) {
                            console.info('reminderRequestAttribute_0030 if is ok');
                            reminderId = reminderInfoArr[i].reminderId;
                        }
                    }
                    
                    reminderAgent.deleteExcludeDates(reminderId).then(() => {
                        expect(true).assertTrue();
                        done();
                    }).catch((err) => {
                        console.error("promise err code:" + err.code + " message:" + err.message);
                        expect(false).assertTrue();
                        done();
                    });
                }).catch((err) => {
                    console.info('reminderRequestAttribute_0030 promise err.code is : ' + err.code);
                })
            } catch (error) {
                console.info('reminderRequestAttribute_0030 getValidReminders error.code is : ' + error.code);
            }
        })

        /**
         * @tc.number: reminderRequestAttribute_0031
         * @tc.name: reminderRequestAttribute_0031
         * @tc.desc: test cancelReminder promise function 
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderRequestAttribute_0031", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderRequestAttribute_0031---------------------------');
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('reminderRequestAttribute_0031 cancelAllReminders success');
                expect(true).assertTrue();
                done();
            });
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
                        console.log('reminderRequestAttribute_0031 callback err.code is :' + err.code);
                    }
                    expect(reminderId).assertLarger(0);
                    done();
                    console.log('reminderRequestAttribute_0031 callback reminderId = ' + reminderId);
                    reminderAgent.cancelReminder(reminderId).then(() => {
                        console.log("reminderRequestAttribute_0031 cancelReminder promise");
                        expect(false).assertTrue();
                        done();
                      }).catch((err) => {
                        console.log("reminderRequestAttribute_0031 promise err code:" + err.code + " message:" + err.message);
                      });
                })             
            } catch (error) {
                console.log("reminderRequestAttribute_0031 publishReminder error.code:" + error.code);
            }
        })

        /**
         * @tc.number: reminderRequestAttribute_0032
         * @tc.name: reminderRequestAttribute_0032
         * @tc.desc: test cancelReminder callback function 
         * @tc.level: Level 3
         * @tc.type: Function
         * @tc.size: MediumTest
         */
        it("reminderRequestAttribute_0032", Level.LEVEL3, async function (done) {
            console.info('----------------------reminderRequestAttribute_0032---------------------------');
            reminderAgent.cancelAllReminders().then((err, data) => {
                console.info('reminderRequestAttribute_0032 cancelAllReminders success');
                expect(true).assertTrue();
                done();
            });
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
                        console.error('reminderRequestAttribute_0032 callback err.code is :' + err.code);
                    } else {
                        console.info('reminderRequestAttribute_0032 callback reminderId = ' + reminderId);
                        expect(reminderId).assertLarger(0);
                        done();
                        reminderAgent.cancelReminder(reminderId, (err) => {
                            if (err.code) {
                              console.error("reminderRequestAttribute_0032 cancelReminder callback err code:" + err.code + " message:" + err.message);
                            } else {
                              console.log("reminderRequestAttribute_0032 cancelReminder callback");
                              expect(false).assertTrue();
                              done();
                            }
                        });
                        done();
                    }
                })             
            } catch (error) {
                console.log("reminderRequestAttribute_0032 publishReminder error.code:" + error.code);
            }
        })
    })
}
