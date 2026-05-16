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
import { describe, it, expect, TestType, Size, Level, beforeAll, afterEach, beforeEach } from "../../../hypium/index"
import notificationManager from '@ohos.notificationManager'
import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base'
import Utils from './Util.test';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement'

function getRandomNumber(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

let testAbilityContext: common.UIAbilityContext
let bundle: string = 'com.example.actsnotificationansreducealertstest.static'

export default function ActsNotificationAnsReduceAlertsTest() {
  let TEST_SUITE_NAME: string = 'SUB_NOTIFICATION_ANS_REDUCE_ALERTS_TEST ===>'

  describe('SUB_NOTIFICATION_ANS_REDUCE_ALERTS_TEST', () => {
    beforeAll( () => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      await Utils.msSleep(2000)
      notificationManager.requestEnableNotification(testAbilityContext, (err: BusinessError | null) => {
        console.info(`${TEST_SUITE_NAME} requestEnableNotification about is ${testAbilityContext}`)
        console.info(`${TEST_SUITE_NAME} come in requestEnableNotification`);
        if (err) {
          console.info(`${TEST_SUITE_NAME} requestEnableNotification err: ${err?.code}`)
        } else {
          console.info(`${TEST_SUITE_NAME} requestEnableNotification success`)
        }
      })
      await Utils.msSleep(1000)
      let driver = Driver.create()
      await Utils.msSleep(1000)
      console.info(`${TEST_SUITE_NAME} driver is ${JSON.stringify(driver)}`)
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`${TEST_SUITE_NAME} button is ${JSON.stringify(button)}`)
      if (button !== null) {
        await button.click()
        console.info(`${TEST_SUITE_NAME} ===>====>button is click`)
        await Utils.msSleep(1000)
      } else {
        console.info(`${TEST_SUITE_NAME} null button`)
      }
    })

    afterEach(() => {
      await notificationManager.cancelAll().then(() => {
        console.info(TEST_SUITE_NAME + `Succeeded in canceling all notification.`);
      }).catch((err: Error):void => {
        console.error(TEST_SUITE_NAME +
          `Failed to cancel all notification. Code is ${err.code}, message is ${err.message}`);
      });
    })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_007
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_007
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_007'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: getRandomNumber(1, 1000) as int,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_NONE,
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
        try {
          await notificationManager.publish(notificationRequest).then(() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
                done()
              })
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err: BusinessError) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_008
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_008
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_008'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: getRandomNumber(1, 1000) as int,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_OPEN,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_008",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
                done()
              })
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err: BusinessError) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_009
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_009
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_009'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: getRandomNumber(1, 1000) as int,
          notificationFlags: {
            soundEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            vibrationEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            bannerEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
            lockScreenEnabled: notificationManager.NotificationFlagStatus.TYPE_CLOSE,
          } as notificationManager.NotificationFlags,
          notificationSlotType: notificationManager.SlotType.SOCIAL_COMMUNICATION,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: "SOCIAL_COMMUNICATION",
              text: "Sub_Notification_Ans_Reduce_alerts_static_009",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(2)
                done()
              })
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err: BusinessError) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })

    /**
     * @tc.name   Sub_Notification_Ans_Reduce_alerts_static_003
     * @tc.number Sub_Notification_Ans_Reduce_alerts_static_003
     * @tc.desc   Reduce Notification alerts
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Sub_Notification_Ans_Reduce_alerts_static_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Reduce_alerts_static_003'

        let notificationRequest: notificationManager.NotificationRequest = {
          id: getRandomNumber(1, 1000) as int,
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
              text: "Sub_Notification_Ans_Reduce_alerts_static_003",
            }
          }
        };
        try {
          await notificationManager.publish(notificationRequest).then(() => {
            console.info(TEST_SUITE_NAME + TAG + " publish success");
            await Utils.msSleep(1000)
            await notificationManager.getActiveNotifications()
              .then((data: Array<notificationManager.NotificationRequest>) => {
                console.info(TEST_SUITE_NAME + TAG +
                  ` Scceeded in getting active notifications, data is ${JSON.stringify(data)}`);
                expect(data?.[0]?.notificationFlags?.soundEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.vibrationEnabled).assertEqual(1)
                expect(data?.[0]?.notificationFlags?.bannerEnabled).assertEqual(2)
                expect(data?.[0]?.notificationFlags?.lockScreenEnabled).assertEqual(1)
                done()
              })
              .catch((err: Error):void => {
                console.error(TEST_SUITE_NAME + TAG +
                  `Failed to get active notifications. Code is ${err.code}, message is ${err.message}`);
                expect(false).assertTrue();
                done()
              });
          }).catch((err: Error):void => {
            console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
            expect(false).assertTrue();
            done()
          });
        } catch (err: BusinessError) {
          console.error(TEST_SUITE_NAME + TAG + `publish fail: ${JSON.stringify(err)}`);
          expect(false).assertTrue();
          done()
        }

      })


  })
}