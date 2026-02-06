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

import notificationManager from '@ohos.notificationManager';
import reminderAgentManager from '@ohos.reminderAgentManager'
import hilog from '@ohos.hilog'
import { Component,Driver,ON,On,MatchPattern,MouseButton,WindowMode,UIElementInfo,UiDirection,PointerMatrix,DisplayRotation } from '@ohos.UiTest'
import { describe, it, expect, TestType, Size, Level, beforeAll, afterAll } from "../../../hypium/index";
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'

let testAbilityContext: common.UIAbilityContext | undefined;
let DOMAIN: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let bundle :string = 'com.acts.actsreminderagentmgr.static'

export default function ActsReminderAgentManagerStaticTest() {
  describe('ActsReminderAgentManagerStaticTest', () => {

    beforeAll(async () => {

      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll start');

      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(3000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>("UIAbilityContext") as common.UIAbilityContext
      hilog.info(DOMAIN, TAG, '%{public}s', 'beforeAll end');
    })

    afterAll(() => {

      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll start');

      reminderAgentManager.cancelAllReminders().then(() => {
        console.log("afterAll cancelAllReminders promise")
      }).catch((err: Error) => {
        console.error("afterAll promise err code:" + err?.code + " message:" + err?.message);
      });
      hilog.info(DOMAIN, TAG, '%{public}s', 'afterAll end');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001
     * @tc.desc   Test that publishReminder/cancelReminder callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        await Utils.msSleep(500);
        let usb = Driver.create();
        await Utils.msSleep(500)
        let usbButton = await usb.findComponent(ON.type('Button').text('确定').within(ON.type('Dialog')));
        console.info(`SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001 usb button is ${JSON.stringify(usbButton)}`);
        if (usbButton !== null) {
          await Utils.msSleep(1000);
          await usbButton.click();
          await Utils.msSleep(500);
        }

        let TEST_CASE_NAME = 'SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001'
        console.info(`${TEST_CASE_NAME} START requestEnableNotification`)
        notificationManager.requestEnableNotification(testAbilityContext!, (err: BusinessError | null) => {
          console.info(`${TEST_CASE_NAME} requestEnableNotification about is ${testAbilityContext}`)
          console.info(`${TEST_CASE_NAME} come in requestEnableNotification`);
          if (err) {
            console.info(`${TEST_CASE_NAME} requestEnableNotification err: ${err.code}`)
            expect(false).assertTrue()
            done();
          }else {
            console.info(`${TEST_CASE_NAME} requestEnableNotification success`)
            await Utils.msSleep(1000)
          }
        })
        await Utils.msSleep(1000)
        let driver = Driver.create()
        await Utils.msSleep(1000)
        console.info(`${TEST_CASE_NAME} driver is ${JSON.stringify(driver)}`)
        let button = await driver.findComponent(ON.text('允许'));
        console.info(`${TEST_CASE_NAME} button is ${JSON.stringify(button)}`)
        if (button !== null) {
          await button.click()
          console.info(`SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001 ===>====>button is click`)
          await Utils.msSleep(1000)
        } else {
          console.info(`${TEST_CASE_NAME} null button`)
        }

        let timer: reminderAgentManager.ReminderRequestTimer = {
          reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
          tapDismissed: true,
          autoDeletedTime: 200000 as long,
          ringDuration: 2 as long,
          snoozeTimes: 1,
          timeInterval: 3 as long,
          title: "this is title",
          content: "this is content",
          expiredContent: "this reminder has expired",
          snoozeContent: "remind later",
          notificationId: 500,
          groupId: 'this is groupId',
          wantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          maxScreenWantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          triggerTimeInSeconds: 200000 as long,
          snoozeSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          customRingUri: "#"
        }
        let callbackFlag = 0;

        try {
          reminderAgentManager.publishReminder(timer, (err: BusinessError<void>|null, reminderId: int|undefined) => {
            if (err) {
                console.info('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001 callback err.code is :' + err.code);
            } else {
              console.info('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001 callback reminderId = ' + reminderId);
              expect(reminderId).assertLarger(0);
              if(reminderId != undefined){
                reminderAgentManager.cancelReminder(reminderId, (err: BusinessError | null) => {
                  callbackFlag = 1;
                  if (err?.code) {
                    console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001 callback err code:" + err?.code + " message:" + err?.message);
                    expect(false).assertTrue();
                    done();
                  } else {
                    console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001 cancelReminder callback");
                    expect(callbackFlag).assertLarger(0);
                    done();
                  }
                });
              }
            }
          })
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_001 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_002
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_002
     * @tc.desc   Test that publishReminder/cancelReminder promise function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        let timer: reminderAgentManager.ReminderRequestTimer = {
          reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
          tapDismissed: true,
          autoDeletedTime: 200000 as long,
          ringDuration: 2 as long,
          snoozeTimes: 1,
          timeInterval: 3 as long,
          title: "this is title",
          content: "this is content",
          expiredContent: "this reminder has expired",
          snoozeContent: "remind later",
          notificationId: 500,
          groupId: 'this is groupId',
          wantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          maxScreenWantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          triggerTimeInSeconds: 200000 as long
        }
        let callbackFlag = 0;

        try {
          reminderAgentManager.publishReminder(timer).then((reminderId: int) => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_002 promise, reminderId = " + reminderId);
            expect(reminderId).assertLarger(0);
            reminderAgentManager.cancelReminder(reminderId).then(() => {
              callbackFlag = 1;
              console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_002 cancelReminder promise");
              expect(callbackFlag).assertLarger(0);
              done();
            }).catch((err: Error) => {
              console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_002 promise err code:" + err.code + " message:" + err.message);
              expect(false).assertTrue();
              done();
            });
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_002 promise err code:" + err.code + " message:" + err.message);
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_002 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_003
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_003
     * @tc.desc   Test publishReminder promise function and getValidReminders callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        let timer: reminderAgentManager.ReminderRequestTimer = {
          reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
          tapDismissed: true,
          autoDeletedTime: 200000 as long,
          ringDuration: 2 as long,
          snoozeTimes: 1,
          timeInterval: 3 as long,
          title: "this is title",
          content: "this is content",
          expiredContent: "this reminder has expired",
          snoozeContent: "remind later",
          notificationId: 500,
          groupId: 'this is groupId',
          wantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          maxScreenWantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          triggerTimeInSeconds: 200000 as long
        }

        try {
          reminderAgentManager.publishReminder(timer).then((reminderId: int) => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_003 promise, reminderId = " + reminderId);
            expect(reminderId).assertLarger(0);

            reminderAgentManager.getValidReminders((err, reminders) => {
              if (err?.code) {
                console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_003 callback err code:" + err?.code + " message:" + err?.message);
              } else {
                console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_003 callback, getValidReminders length = " + reminders?.length);
                expect(reminders?.length).assertLarger(0);
                done();
              }
            });
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_003 promise err code:" + err.code + " message:" + err.message);
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_003 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_004
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_004
     * @tc.desc   Test publishReminder promise function and getValidReminders promise function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        let timer: reminderAgentManager.ReminderRequestTimer = {
          reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
          tapDismissed: true,
          autoDeletedTime: 200000 as long,
          ringDuration: 2 as long,
          snoozeTimes: 1,
          timeInterval: 3 as long,
          title: "this is title",
          content: "this is content",
          expiredContent: "this reminder has expired",
          snoozeContent: "remind later",
          notificationId: 500,
          groupId: 'this is groupId',
          wantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          maxScreenWantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          triggerTimeInSeconds: 200000 as long
        }

        try {
          reminderAgentManager.publishReminder(timer).then((reminderId: int) => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_004 promise, reminderId = " + reminderId);
            expect(reminderId).assertLarger(0);

            reminderAgentManager.getValidReminders().then((reminders: Array<reminderAgentManager.ReminderRequest>) => {
              console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_004 promise, getValidReminders length = " + reminders?.length);
              expect(reminders?.length).assertLarger(0);
              done();
            }).catch((err: Error) => {
              console.error("promise err code:" + err.code + " message:" + err.message);
            });
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_004 promise err code:" + err.code + " message:" + err.message);
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_004 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_005
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_005
     * @tc.desc   Test publishReminder promise function and cancelAllReminders callback function
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        let timer: reminderAgentManager.ReminderRequestTimer = {
          reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
          tapDismissed: true,
          autoDeletedTime: 200000 as long,
          ringDuration: 2 as long,
          snoozeTimes: 1,
          timeInterval: 3 as long,
          title: "this is title",
          content: "this is content",
          expiredContent: "this reminder has expired",
          snoozeContent: "remind later",
          notificationId: 500,
          groupId: 'this is groupId',
          wantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          maxScreenWantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          triggerTimeInSeconds: 200000 as long
        }
        let callbackFlag = 0;

        try {
          reminderAgentManager.publishReminder(timer).then((reminderId: int) => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_005 promise, reminderId = " + reminderId);
            expect(reminderId).assertLarger(0);

            reminderAgentManager.cancelAllReminders((err: BusinessError<void>|null) =>{
              callbackFlag = 1;
              if (err?.code) {
                console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_005 callback err code:" + err?.code + " message:" + err?.message);
              } else {
                console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_005 cancelAllReminders callback");
                expect(callbackFlag).assertLarger(0);
                done();
              }
            });
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_005 promise err code:" + err.code + " message:" + err.message);
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_005 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_006
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_006
     * @tc.desc   Test publishReminder promise function and cancelAllReminders promise function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        let timer: reminderAgentManager.ReminderRequestTimer = {
          reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER,
          tapDismissed: true,
          autoDeletedTime: 200000 as long,
          ringDuration: 2 as long,
          snoozeTimes: 1,
          timeInterval: 3 as long,
          title: "this is title",
          content: "this is content",
          expiredContent: "this reminder has expired",
          snoozeContent: "remind later",
          notificationId: 500,
          groupId: 'this is groupId',
          wantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          maxScreenWantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          triggerTimeInSeconds: 200000 as long
        }
        let callbackFlag = 0;

        try {
          reminderAgentManager.publishReminder(timer).then((reminderId: int) => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_006 promise, reminderId = " + reminderId);
            expect(reminderId).assertLarger(0);

            reminderAgentManager.cancelAllReminders().then(() => {
              callbackFlag = 1;
              console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_006 cancelAllReminders promise")
              expect(callbackFlag).assertLarger(0);
              done();
            }).catch((err: Error) => {
              console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_006 promise err code:" + err?.code + " message:" + err?.message);
              expect(false).assertTrue();
              done();
            });
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_006 promise err code:" + err.code + " message:" + err.message);
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_006 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_007
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_007
     * @tc.desc   Test addNotificationSlot callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let callbackFlag = 0;

        try {
          let mySlot: notificationManager.NotificationSlot = {
            notificationType: notificationManager.SlotType.SOCIAL_COMMUNICATION
          }

          reminderAgentManager.addNotificationSlot(mySlot, (err: BusinessError<void>|null) => {
            callbackFlag = 1;
            if (err?.code) {
              console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_007 callback err code:" + err?.code + " message:" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_007 addNotificationSlot callback");
              expect(callbackFlag).assertEqual(1);
              done();
            }
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_007 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_008
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_008
     * @tc.desc   Test addNotificationSlot promise function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let callbackFlag = 0;

        try {
          let mySlot: notificationManager.NotificationSlot = {
            notificationType: notificationManager.SlotType.SOCIAL_COMMUNICATION
          }

          reminderAgentManager.addNotificationSlot(mySlot).then(() => {
            callbackFlag = 1;
            console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_008 addNotificationSlot promise");
            expect(callbackFlag).assertEqual(1);
            done();
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_008 promise err code:" + err.code + " message:" + err.message);
            expect(false).assertTrue();
            done();
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_008 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_009
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_009
     * @tc.desc   Test removeNotificationSlot callback function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let callbackFlag = 0;

        try {
          reminderAgentManager.removeNotificationSlot(notificationManager.SlotType.CONTENT_INFORMATION, (err: BusinessError<void>|null) => {
            callbackFlag = 1;
            if (err?.code) {
              console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_009 callback err code:" + err?.code + " message:" + err?.message);
              expect(false).assertTrue();
              done();
            } else {
              console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_009 addNotificationSlot callback");
              expect(callbackFlag).assertEqual(1);
              done();
            }
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_009 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_010
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_010
     * @tc.desc   Test removeNotificationSlot promise function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let callbackFlag = 0;

        try {
          reminderAgentManager.removeNotificationSlot(notificationManager.SlotType.CONTENT_INFORMATION).then(() => {
            callbackFlag = 1;
            console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_010 removeNotificationSlot promise");
            expect(callbackFlag).assertEqual(1);
            done();
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_010 promise err code:" + err.code + " message:" + err.message);
            expect(false).assertTrue();
            done();
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_010 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011
     * @tc.desc   Test getAllValidReminders promise function normal call
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        let timer: reminderAgentManager.ReminderRequestAlarm = {
          reminderType:reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
          hour:6,
          minute:30,
          daysOfWeek:[1]
        }

        try {
          reminderAgentManager.publishReminder(timer).then((reminderId: int) => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011 promise, reminderId = " + reminderId);

            reminderAgentManager.getAllValidReminders().then((reminderInfo: Array<reminderAgentManager.ReminderInfo>) => {
              hilog.info(DOMAIN, TAG, 'SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011 getAllValidReminders:' + JSON.stringify(reminderInfo));
              for (let i = 0; i < reminderInfo.length; i++) {
                console.log(`SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011 索引 ${i}:`, reminderInfo[i]);
              }
              console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011 getAllValidReminders reminderId = " + reminderInfo[0].reminderId);
              console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011 getAllValidReminders reminderType = " + reminderInfo[0].reminderReq.reminderType);
              let reminderType: int = reminderInfo[0].reminderReq.reminderType;
              expect(reminderInfo.length).assertLarger(0);
              expect(reminderInfo[0].reminderId).assertLarger(0);
              expect(reminderType).assertLarger(0);
              done();
            }).catch((err: Error) =>{
              console.info('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011 promise err.code is : ' + err.code);
              expect(false).assertTrue();
              done();
            })
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011 promise err code:" + err.code + " message:" + err.message);
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_011 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_012
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_012
     * @tc.desc   Test publishReminder/cancelAllReminders promise function and parameter is ReminderRequestTimer
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        let alarm: reminderAgentManager.ReminderRequestAlarm = {
          reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM,
          hour: 13,
          minute: 14,
          daysOfWeek: [1, 2, 3, 4, 5]
        }
        let callbackFlag = 0;

        try {
          reminderAgentManager.publishReminder(alarm).then((reminderId: int) => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_012 promise, reminderId = " + reminderId);
            expect(reminderId).assertLarger(0);

            reminderAgentManager.cancelAllReminders().then(() => {
              callbackFlag = 1;
              console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_012 cancelAllReminders promise")
              expect(callbackFlag).assertLarger(0);
              done();
            }).catch((err: Error) => {
              console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_012 promise err code:" + err?.code + " message:" + err?.message);
              expect(false).assertTrue();
              done();
            });
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_012 promise err code:" + err.code + " message:" + err.message);
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_012 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_013
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_013
     * @tc.desc   Test publishReminder/cancelAllReminders promise function and parameter is ReminderRequestCalendar
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {

        // let parameters : Record<string, reminderAgentManager.RecordData> = {
        //   'x': 1
        // }

        let calendar: reminderAgentManager.ReminderRequestCalendar = {
          reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR,
          actionButton: [
            {
              title: "close",
              titleResource: 'English',
              type: reminderAgentManager.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE
            },
            {
              title: "snooze",
              titleResource: 'English',
              type: reminderAgentManager.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE
            }
          ],
          wantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility",
            // parameters: parameters,
            uri:"#"
          },
          maxScreenWantAgent: {
            pkgName: "com.acts.actsreminderagentmgr.static",
            abilityName: "EntryAbility"
          },
          dateTime: {
            year: 2030,
            month: 7,
            day: 28,
            hour: 13,
            minute: 30,
            second: 32
          },
          endDateTime: {
            year: 2030,
            month: 7,
            day: 31,
            hour: 10,
            minute: 30,
            second: 10
          },
          ringDuration: 2 as long,
          ringChannel: reminderAgentManager.RingChannel.RING_CHANNEL_ALARM,
          snoozeTimes: 1,
          timeInterval: 3 as long,
          title: "this is addExcludeDate title",
          titleResourceId: 1 as int,
          content: "this is content",
          contentResourceId: 1 as int,
          expiredContent: "this reminder has expired",
          expiredContentResourceId: 2 as int,
          snoozeContent: "remind later",
          snoozeContentResourceId: 2 as int,
          notificationId: 500,
          groupId: 'this is groupId',
          slotType: notificationManager.SlotType.CONTENT_INFORMATION,
          tapDismissed: true,
          autoDeletedTime: 200000 as long,
          snoozeSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
          customRingUri: "#",
          repeatMonths: [3],
          repeatDays: [6, 7],
          daysOfWeek: [1, 2, 3, 4, 5]
        }

        try {
          reminderAgentManager.publishReminder(calendar).then((reminderId: int) => {
            console.log("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_013 promise, reminderId = " + reminderId);
            expect(reminderId).assertLarger(0);

            await reminderAgentManager.cancelAllReminders();
            done();
          }).catch((err: Error) => {
            console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_013 promise err code:" + err.code + " message:" + err.message);
          });
        } catch (error) {
          console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_013 publishReminder error.code:" + error.code);
        }
      })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_014
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_014
     * @tc.desc   Test that the reminderAgentManager enum ActionButtonType of ACTION_BUTTON_TYPE_CLOSE
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_014 begin---');
      let type = reminderAgentManager.ActionButtonType.ACTION_BUTTON_TYPE_CLOSE;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_014 reminderAgentManager ActionButtonType: ' + type);
      expect(type).assertEqual(0);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_014 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_015
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_015
     * @tc.desc   Test that the reminderAgentManager enum ActionButtonType of ACTION_BUTTON_TYPE_CLOSE
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_015 begin---');
      let type = reminderAgentManager.ActionButtonType.ACTION_BUTTON_TYPE_SNOOZE;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_015 reminderAgentManager ActionButtonType: ' + type);
      expect(type).assertEqual(1);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_014 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_016
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_016
     * @tc.desc   Test that the reminderAgentManager enum ActionButtonType of REMINDER_TYPE_TIMER
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_016 begin---');
      let type = reminderAgentManager.ReminderType.REMINDER_TYPE_TIMER;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_016 reminderAgentManager ReminderType: ' + type);
      expect(type).assertEqual(0);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_016 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_017
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_017
     * @tc.desc   Test that the reminderAgentManager enum ReminderType of REMINDER_TYPE_CALENDAR
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_017 begin---');
      let type = reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_017 reminderAgentManager ReminderType: ' + type);
      expect(type).assertEqual(1);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_017 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_018
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_018
     * @tc.desc   Test that the reminderAgentManager enum ReminderType of REMINDER_TYPE_ALARM
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_018 begin---');
      let type = reminderAgentManager.ReminderType.REMINDER_TYPE_ALARM;
      hilog.info(DOMAIN, TAG, '%{public}s', 'SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_018 reminderAgentManager ReminderType: ' + type);
      expect(type).assertEqual(2);
      done();

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_018 end---');
    })

    /**
     * @tc.number SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019
     * @tc.name   SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019
     * @tc.desc   Test that the addExcludeDate/getExcludeDates/deleteExcludeDates promise
     * @tc.level  LEVEL0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     */
    it("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:() => void): Promise<void> => {
      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 begin---');

      let calendar: reminderAgentManager.ReminderRequestCalendar = {
        reminderType: reminderAgentManager.ReminderType.REMINDER_TYPE_CALENDAR,
        dateTime: {
          year: 2030,
          month: 7,
          day: 28,
          hour: 13,
          minute: 30,
          second: 32
        },
        endDateTime: {
          year: 2030,
          month: 7,
          day: 31,
          hour: 10,
          minute: 30,
          second: 10
        },
        ringDuration: 2 as long,
        snoozeTimes: 1,
        timeInterval: 3 as long,
        title: "this is addExcludeDate title",
        titleResourceId: 1 as int,
        content: "this is content",
        contentResourceId: 1 as int,
        expiredContent: "this reminder has expired",
        expiredContentResourceId: 2 as int,
        snoozeContent: "remind later",
        snoozeContentResourceId: 2 as int,
        notificationId: 500,
        groupId: 'this is groupId',
        slotType: notificationManager.SlotType.CONTENT_INFORMATION,
        tapDismissed: true,
        autoDeletedTime: 200000 as long,
        snoozeSlotType: notificationManager.SlotType.SERVICE_INFORMATION,
        customRingUri: "#",
        repeatMonths: [3],
        repeatDays: [6, 7],
        daysOfWeek: [1, 2, 3, 4, 5]
      }

      try {
        reminderAgentManager.publishReminder(calendar, (err: BusinessError<void>|null, reminderId: int|undefined) => {
          if (err) {
            console.info('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 callback err.code111 is :' + err.code + err.message);
            expect(false).assertTrue();
            done();
          } else {
            console.info('SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 callback reminderId = ' + reminderId);
            expect(reminderId).assertLarger(0);
            reminderAgentManager.getExcludeDates(reminderId as int).then((dates1: Array<Date>) => {
              console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 getExcludeDates promise length: " + dates1.length);
              expect(dates1.length).assertEqual(0);


              let date: Date = new Date();
              reminderAgentManager.addExcludeDate(reminderId as int, date).then(() => {
                console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 addExcludeDate promise");

                reminderAgentManager.getExcludeDates(reminderId as int).then((dates2: Array<Date>) => {
                  console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 getExcludeDates2 promise length: " + dates2.length);
                  expect(dates2?.length).assertLarger(0);

                  reminderAgentManager.deleteExcludeDates(reminderId as int).then(() => {
                    console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 deleteExcludeDates promise");

                    reminderAgentManager.getExcludeDates(reminderId as int).then((dates3: Array<Date>) => {
                      console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 getExcludeDates3 promise length: " + dates3.length);

                      expect(dates3?.length).assertEqual(0);

                      if(reminderId != undefined){
                        await reminderAgentManager.cancelReminder(reminderId as int);
                      }
                      done();
                    }).catch((err: Error) => {
                      console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 getExcludeDates3 promise err code:" + err.code + " message:" + err.message);
                      expect(false).assertTrue();
                      done();
                    })

                  }).catch((err: Error) => {
                    console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 deleteExcludeDates promise err code:" + err.code + " message:" + err.message);
                    expect(false).assertTrue();
                    done();
                  });
                }).catch((err: Error) => {
                  console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 getExcludeDates2 promise err code:" + err.code + " message:" + err.message);
                  expect(false).assertTrue();
                  done();
                })
              }).catch((err: Error) => {
                console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 promise err code:" + err.code + " message:" + err.message);
                expect(false).assertTrue();
                done();
              });
            }).catch((err: Error) => {
              console.error("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 getExcludeDates1 promise err code:" + err.code + " message:" + err.message);
              expect(false).assertTrue();
              done();
            })
          }
        })
      } catch (error) {
        console.info("SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 publishReminder error.code:" + error.code + error.message);
      }

      hilog.info(DOMAIN, TAG, '%{public}s', '---SUB_RESOURCESCHEDULE_REMINDER_MANAGER_STATIC_XTS_019 end---');
    })

  })
}
