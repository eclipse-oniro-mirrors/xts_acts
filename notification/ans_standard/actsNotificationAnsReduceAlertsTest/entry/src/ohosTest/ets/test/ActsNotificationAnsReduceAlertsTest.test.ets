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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import notificationManager from '@ohos.notificationManager';
import base, { BusinessError } from '@ohos.base';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

function getRandomNumber(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}


export default function ActsNotificationAnsReduceAlertsTest() {
  let TEST_SUITE_NAME = 'SUB_NOTIFICATION_ANS_REDUCE_ALERTS_TEST ===>'

  describe('SUB_NOTIFICATION_ANS_REDUCE_ALERTS_TEST', () => {
    beforeAll(async (done: Function) => {
      notificationManager.requestEnableNotification((err) => {
        if (err) {
          console.error(TEST_SUITE_NAME+`requestEnableNotification failed, code is ${err.code}, message is ${err.message}`);
          expect(false).assertTrue();
          console.info(`${TEST_SUITE_NAME}` + `test case end`);
          done();
        } else {
          console.info(TEST_SUITE_NAME + "requestEnableNotification success");
        }
      });

      await sleep(1500);
      let driver = Driver.create();
      console.log(TEST_SUITE_NAME + `driver is ${JSON.stringify(driver)}`);
      await driver.assertComponentExist(ON.text('允许'));
      let button = await driver.findComponent(ON.text('允许'));
      console.log(TEST_SUITE_NAME + `button is ${JSON.stringify(button)}`);
      if (button !== null) {
        await button.click();
        await sleep(1500);
        done()
      } else {
        console.log(TEST_SUITE_NAME + `button is null`)
        expect(false).assertTrue();
        done()
      }
    })

    afterEach(async  (done: Function) => {
      await notificationManager.cancelAll().then(() => {
        console.info(TEST_SUITE_NAME + `Succeeded in canceling all notification.`);
        done()
      }).catch((err: BusinessError) => {
        console.error(TEST_SUITE_NAME + `Failed to cancel all notification. Code is ${err.code}, message is ${err.message}`);
        expect(false).assertTrue();
        done()
      });
    })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_007
     * @tc.number Sub_Notification_Ans_Reduce_alerts_007
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_007', Level.LEVEL0, async  (done : Function) => {
      let TAG:string = 'Sub_Notification_Ans_Reduce_alerts_007'

      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1,1000),
        notificationFlags: {
          soundEnabled: 0,
          vibrationEnabled: 0,
          bannerEnabled: 0,
          lockScreenEnabled: 0,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "Sub_Notification_Ans_Reduce_alerts_007",
          }
        }
      };
      try{
        await notificationManager.publish(notificationRequest).then(async() => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications().then((data: Array<notificationManager.NotificationRequest>) => {
            console.info(TEST_SUITE_NAME + TAG + ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
            expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
            expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
            expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
            expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
            done()
          }).catch((err: BusinessError) => {
            console.error(TEST_SUITE_NAME + TAG + `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
            expect(false).assertTrue();
            done()
          });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        });
      }catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_008
     * @tc.number Sub_Notification_Ans_Reduce_alerts_008
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_008', Level.LEVEL0, async  (done : Function) => {
      let TAG:string = 'Sub_Notification_Ans_Reduce_alerts_008'

      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1,1000),
        notificationFlags: {
          soundEnabled: 1,
          vibrationEnabled: 1,
          bannerEnabled: 1,
          lockScreenEnabled: 1,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "Sub_Notification_Ans_Reduce_alerts_008",
          }
        }
      };
      try{
        await notificationManager.publish(notificationRequest).then(async() => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications().then((data: Array<notificationManager.NotificationRequest>) => {
            console.info(TEST_SUITE_NAME + TAG + ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
            expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
            expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
            expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
            expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
            done()
          }).catch((err: BusinessError) => {
            console.error(TEST_SUITE_NAME + TAG + `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
            expect(false).assertTrue();
            done()
          });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        });
      }catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_009
     * @tc.number Sub_Notification_Ans_Reduce_alerts_009
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_009', Level.LEVEL0, async  (done : Function) => {
      let TAG:string = 'Sub_Notification_Ans_Reduce_alerts_009'

      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1,1000),
        notificationFlags: {
          soundEnabled: 2,
          vibrationEnabled: 2,
          bannerEnabled: 2,
          lockScreenEnabled: 2,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "Sub_Notification_Ans_Reduce_alerts_009",
          }
        }
      };
      try{
        await notificationManager.publish(notificationRequest).then(async() => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          await sleep(1000)
          await notificationManager.getActiveNotifications().then((data: Array<notificationManager.NotificationRequest>) => {
            console.info(TEST_SUITE_NAME + TAG + ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
            expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
            expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
            expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
            expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
            done()
          }).catch((err: BusinessError) => {
            console.error(TEST_SUITE_NAME + TAG + `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
            expect(false).assertTrue();
            done()
          });
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        });
      }catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_003
     * @tc.number Sub_Notification_Ans_Reduce_alerts_003
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_003', Level.LEVEL3, async  (done : Function) => {
      let TAG:string = 'Sub_Notification_Ans_Reduce_alerts_003'

      let notificationRequest: notificationManager.NotificationRequest = {
        id: getRandomNumber(1,1000),
        notificationFlags: {
          soundEnabled: undefined,
          vibrationEnabled: undefined,
          bannerEnabled: undefined,
          lockScreenEnabled: undefined,
        } as notificationManager.NotificationFlags,
        notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "SOCIAL_COMMUNICATION",
            text: "Sub_Notification_Ans_Reduce_alerts_003",
          }
        }
      };
      try{
        await notificationManager.publish(notificationRequest).then(() => {
          console.info(TEST_SUITE_NAME + TAG + " publish success");
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(err.code).assertEqual(401);
          done()
        });
      }catch (err) {
        console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
        expect(err.code).assertEqual(401);
        done()
      }

    })




  })
}