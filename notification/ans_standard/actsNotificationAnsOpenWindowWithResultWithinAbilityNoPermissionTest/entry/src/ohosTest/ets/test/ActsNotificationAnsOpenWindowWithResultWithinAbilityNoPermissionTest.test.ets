/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, afterEach, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { notificationExtensionSubscription, notificationManager } from '@kit.NotificationKit';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@kit.TestKit';
import { deviceInfo } from '@kit.BasicServicesKit';

let ctx = getContext(this) as common.UIAbilityContext;

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok");
    }, time)
  });
}

let tag = 'ActsNotificationAnsOpenWindowWithResultWithinAbilityNoPermissionTest'

export default function ActsNotificationAnsOpenWindowWithResultWithinAbilityNoPermissionTest() {
  describe('ActsNotificationAnsOpenWindowWithResultWithinAbilityNoPermissionTest', () => {
    afterEach(async () => {
      await sleep(2000)
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0700
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0700
     * @tc.desc   [openNotificationSettingsWithResult] After the openNotificationSettingsWithResult API is called to display a semi-modal dialog and the user clicks OK, the callback is correctly executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0700', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0700'
      let driver: Driver = Driver.create();
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationManager.openNotificationSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.vibrationEnabled).assertEqual(true)
          expect(data.soundEnabled).assertEqual(true)
          expect(data.lockScreenEnabled).assertEqual(true)
          expect(data.badgeNumberEnabled).assertEqual(true)
          expect(data.bannerEnabled).assertEqual(false)
          expect(data.notificationEnabled).assertEqual(false)
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
        await driver.assertComponentExist(ON.text('通知管理'));
        let button2 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
          await sleep(1000);
          await button2.click()
          await sleep(100)
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0100
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0100
     * @tc.desc   [openNotificationSettingsWithResult] After the openNotificationSettingsWithResult method is called to enable or disable the ringing and vibration switch and then the user confirms the operation, the callback is correctly executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0100', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0100'
      let driver: Driver = Driver.create();
      let deviceTypeInfo: string = deviceInfo.deviceType;
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationManager.openNotificationSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.notificationEnabled).assertEqual(true)
          expect(data.bannerEnabled).assertEqual(false)
          expect(data.badgeNumberEnabled).assertEqual(false)
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum} openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
        await sleep(500)
        let button = await driver.findComponent(ON.type('Toggle').isAfter(ON.text('允许通知')));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(testNum + `button is ${JSON.stringify(button)}`);
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
        let scrollBar = await driver.findComponent(ON.type('Scroll').isAfter(ON.text('通知管理')))
        console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        await scrollBar.scrollToBottom()
        await sleep(500);
        let button2 = await driver.findComponent(ON.text('桌面角标'));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
          await sleep(1000);
          await button2.click()
          await sleep(500)
        }
        let scrollBar1 = await driver.findComponent(ON.type('Scroll').isAfter(ON.text('通知管理')))
        console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar1)} `);
        expect(scrollBar1 != null).assertTrue()
        await scrollBar1.scrollToTop()
        await sleep(500)
        let button8 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button8 is ${JSON.stringify(button8)}`);
        if (button8 !== null) {
          console.info(testNum + `button8 is ${JSON.stringify(button8)}`);
          await sleep(1000);
          await button8.click()
          await sleep(100)
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0200
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0200
     * @tc.desc   [openNotificationSettingsWithResult] After the openNotificationSettingsWithResult method is called to enable the alert sound and vibration switch and the user confirms the operation, the callback is correctly executed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0200', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0200'
      let driver: Driver = Driver.create();
      let deviceTypeInfo: string = deviceInfo.deviceType;
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationManager.openNotificationSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            testNum + `openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.bannerEnabled).assertEqual(true)
          expect(data.badgeNumberEnabled).assertEqual(true)
          expect(data.notificationEnabled).assertEqual(true)
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            testNum + `openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
        await sleep(1000);
        let button = await driver.findComponent(ON.text('横幅通知'));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(testNum + `button is ${JSON.stringify(button)}`);
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
        let scrollBar = await driver.findComponent(ON.type('Scroll').isAfter(ON.text('通知管理')))
        console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        await scrollBar.scrollToBottom()
        await sleep(500)
        let button2 = await driver.findComponent(ON.text('桌面角标'));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
          await sleep(1000);
          await button2.click()
          await sleep(500)
        }
        await sleep(500)
        let button8 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button8 is ${JSON.stringify(button8)}`);
        if (button8 !== null) {
          console.info(testNum + `button8 is ${JSON.stringify(button8)}`);
          await sleep(1000);
          await button8.click()
          await sleep(100)
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0300
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0300
     * @tc.desc   [openSubscriptionSettingsWithResult] The openSubscriptionSettingsWithResult API is called when the app does not request the ohos.permission.SUBSCRIBE_NOTIFICATION permission.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0300', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0300'
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationExtensionSubscription.openSubscriptionSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            `${testNum} openSubscriptionSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(201);
            done();
          }
        });

      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(err.code).assertEqual(201);
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_0900
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_0900
     * @tc.desc   [openNotificationSettingsWithResult] Invoke openNotificationSettingsWithResult, modify the lock screen notification, banner notification, desktop icon, ringing, vibration, and notification enable status, and then disable it. Invoke openNotificationSettingsWithResult again to close the interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_0900', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_0900'
      let driver: Driver = Driver.create();
      let deviceTypeInfo: string = deviceInfo.deviceType;
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationManager.openNotificationSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            testNum + `openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.bannerEnabled).assertEqual(false)
          expect(data.badgeNumberEnabled).assertEqual(false)
          expect(data.notificationEnabled).assertEqual(true)
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            testNum + `openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
        await sleep(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll').isAfter(ON.text('通知管理')))
        console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        await scrollBar.scrollToBottom()
        await sleep(500)
        let button = await driver.findComponent(ON.text('横幅通知'));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(testNum + `button is ${JSON.stringify(button)}`);
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
        let button2 = await driver.findComponent(ON.text('桌面角标'));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
          await sleep(1000);
          await button2.click()
          await sleep(500)
        }
        await sleep(500)
        let button8 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button8 is ${JSON.stringify(button8)}`);
        if (button8 !== null) {
          console.info(testNum + `button8 is ${JSON.stringify(button8)}`);
          await sleep(1000);
          await button8.click()
          await sleep(100)
        }
        await sleep(2000)
        notificationManager.openNotificationSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            testNum + `openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.bannerEnabled).assertEqual(false)
          expect(data.badgeNumberEnabled).assertEqual(false)
          expect(data.notificationEnabled).assertEqual(true)
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            testNum + `openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
        await sleep(1000)
        let button9 = await driver.findComponent(ON.type("SymbolGlyph"));
        console.info(testNum + `button9 is ${JSON.stringify(button9)}`);
        if (button9 !== null) {
          console.info(testNum + `button9 is ${JSON.stringify(button9)}`);
          await sleep(1000);
          await button9.click()
          await sleep(100)
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_1100
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_1100
     * @tc.desc   [openNotificationSettingsWithResult] The openNotificationSettingsWithResult method is called, and the lock screen notification, banner notification, app icon badge, ringing, vibration, and notification enabling switches are turned on. Then, a notification is sent to remind the user of the new notification mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_1100', Level.LEVEL0, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_1100'
      let driver: Driver = Driver.create();
      let deviceTypeInfo: string = deviceInfo.deviceType;
      let num = 0
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 1001,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "好友消息",
            text: "李明：晚上一起吃饭吗？",
            additionalText: "15:30"
          }
        }
      };
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        notificationManager.openNotificationSettingsWithResult(context).then((data) => {
          hilog.info(0x0000, 'testTag',
            testNum + `openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
          expect(data.bannerEnabled).assertEqual(true)
          expect(data.badgeNumberEnabled).assertEqual(true)
          expect(data.notificationEnabled).assertEqual(true)
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          hilog.error(0x0000, 'testTag',
            testNum + `openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          done()
        });
        await sleep(1000);
        let scrollBar = await driver.findComponent(ON.type('Scroll').isAfter(ON.text('通知管理')))
        console.info(testNum + `scrollToBottom scrollBar, ${JSON.stringify(scrollBar)} `);
        expect(scrollBar != null).assertTrue()
        await scrollBar.scrollToBottom()
        await sleep(500)
        let button = await driver.findComponent(ON.text('横幅通知'));
        console.info(testNum + `button is ${JSON.stringify(button)}`);
        if (button !== null) {
          console.info(testNum + `button is ${JSON.stringify(button)}`);
          await sleep(1000);
          await button.click()
          await sleep(500)
        }
        let button2 = await driver.findComponent(ON.text('桌面角标'));
        console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
        if (button2 !== null) {
          console.info(testNum + `button2 is ${JSON.stringify(button2)}`);
          await sleep(1000);
          await button2.click()
          await sleep(500)
        }
        await sleep(500)
        let button6 = await driver.findComponent(ON.text('确定'));
        console.info(testNum + `button6 is ${JSON.stringify(button6)}`);
        if (button6 !== null) {
          console.info(testNum + `button6 is ${JSON.stringify(button6)}`);
          await sleep(1000);
          await button6.click()
          await sleep(100)
        }
        await sleep(500)
        await notificationManager.publish(notificationRequest).then(() => {
          num = 0
          console.info(testNum + "publish success");
          num++
          expect(num).assertEqual(1);
          done()
        }).catch((e: Error) => {
          let err: BusinessError = e as BusinessError
          console.error(testNum + `publish failed, code is ${err.code}, message is ${err.message}`);
          if (err?.code === 801) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect().assertFail();
            done();
          }
        });
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_Notification_Ans_openWindow_WithResult_1200
     * @tc.number SUB_Notification_Ans_openWindow_WithResult_1200
     * @tc.desc   [Stability] The openNotificationSettingsWithResult API is called 500 times in a loop, and no crash, freeze, or black screen occurs on the device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Notification_Ans_openWindow_WithResult_1200', Level.LEVEL2, async (done: Function) => {
      let testNum: string = 'SUB_Notification_Ans_openWindow_WithResult_1200'
      let driver: Driver = Driver.create();
      let num= 0
      try {
        let context: common.UIAbilityContext = getContext(ctx) as common.UIAbilityContext;
        for (let index = 0; index < 500; index++) {
          notificationManager.openNotificationSettingsWithResult(context).then((data) => {
            num++
            hilog.info(0x0000, 'testTag',
              `${testNum} ${index} openNotificationSettingsWithResult success, data: ${JSON.stringify(data)}`);
            expect(num).assertEqual(1);
            expect(JSON.stringify(data))
              .assertEqual('{"vibrationEnabled":true,"soundEnabled":true,"lockScreenEnabled":true,"bannerEnabled":true,"badgeNumberEnabled":true,"notificationEnabled":true}')
            done()
          }).catch(async (e: Error) => {
            let err: BusinessError = e as BusinessError
            hilog.error(0x0000, 'testTag',
              `${testNum} ${index} openNotificationSettingsWithResult failed, code is ${err.code}, message is ${err.message}`);
            if (err?.code === 801) {
              expect(err.code).assertEqual(801);
              done();
            } else if (index === 499) {
              expect(err.code).assertEqual(1600018);
              await sleep(500)
              let button6 = await driver.findComponent(ON.text('确定'));
              console.info(testNum + `button6 is ${JSON.stringify(button6)}`);
              if (button6 !== null) {
                console.info(testNum + `button6 is ${JSON.stringify(button6)}`);
                sleep(1000);
                (await button6).click()
                sleep(100)
              }
            } else {
              expect(err.code).assertEqual(1600018);
            }
          });
        }
      } catch (err) {
        console.error(testNum + `openNotificationSettingsWithResult fail: ${JSON.stringify(err)}${err.message}`);
        if (err?.code === 801) {
          expect(err.code).assertEqual(801);
          done();
        } else {
          expect(false).assertTrue();
          done()
        }
      }
    })
  })
}