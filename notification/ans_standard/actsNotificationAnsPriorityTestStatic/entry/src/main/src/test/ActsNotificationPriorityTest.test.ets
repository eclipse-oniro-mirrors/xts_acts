import notificationManager from '@ohos.notificationManager'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '../../../hypium/index'
import {BusinessError} from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import { Component, Driver, ON } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let testAbilityContext:common.UIAbilityContext;
let TEST_SUITE_NAME: string = 'Notification';
let bundle_name:string ="com.example.actsnotificationprioritytest.static"

export default function actsNotificationPriorityTest() {
  describe('actsNotificationPriorityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async() => {
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b" + bundle_name)
      await Utils.msSleep(2000)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext

      notificationManager.requestEnableNotification(testAbilityContext).then(() => {
        console.info(`${TEST_SUITE_NAME} requestEnableNotification succeeded`);
      }).catch((err: Error) :void=> {
        console.info(`${TEST_SUITE_NAME} requestEnableNotification err: `+ JSON.stringify(err));
        expect(err).assertNull()
      });
      let driver = Driver.create();
      let button = await driver.findComponent(ON.text('允许'));
      console.info(`${TEST_SUITE_NAME} button is ${JSON.stringify(button)}`)
      if (button !== null) {
        await button.click()
        console.info(`====>button is click`)
        await Utils.msSleep(1000)
      } else {
        console.info(`${TEST_SUITE_NAME} null button`)
      }
    })
    
    /**
     * @tc.name   Sub_Notification_Ans_Priority_Notification_Static_0100
     * @tc.number Sub_Notification_Ans_Priority_Notification_Static_0100
     * @tc.desc   test priorityNotificationType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Priority_Notification_Static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      let TAG = "Sub_Notification_Ans_Priority_Notification_Static_0100"
      let notificationRequest: notificationManager.NotificationRequest = {
        id: 7,
        priorityNotificationType: notificationManager.PriorityNotificationType.OTHER,
        content: {
          notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
          normal: {
            title: "test",
            text: "test",
          }
        },
        notificationSlotType: notificationManager.SlotType.SERVICE_INFORMATION
      };

      await notificationManager.publish(notificationRequest).then(() => {
        console.info(`${TAG} publish success`);
      }).catch((err: Error):void => {
        console.error(`${TAG} publish failed, code is ${err?.code}, message is ${err?.message}`);
        expect(false).assertTrue()
        done()
      });
      await notificationManager.getActiveNotifications()
        .then((data: Array<notificationManager.NotificationRequest>) => {
          console.info(`${TAG} getActiveNotifications Promise success :${JSON.stringify(data)}`)
          expect(data[0]?.priorityNotificationType).assertEqual("OTHER")
          done()
        })
        .catch((err: Error): void => {
          console.info(`${TAG} getActiveNotifications Promise err: ${err?.code}`)
          expect(false).assertTrue()
          done()
        })
    })
  })
}