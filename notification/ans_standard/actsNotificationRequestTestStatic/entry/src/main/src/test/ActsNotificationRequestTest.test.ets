/*
* Copyright (c) 2023 Huawei Device Co., Ltd.
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
import notificationManager from '@ohos.notificationManager'
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Component, Driver, ON, On, MatchPattern, MouseButton, WindowMode, UIElementInfo, UiDirection, PointerMatrix, DisplayRotation } from '@ohos.UiTest'
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index"
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';

let testAbilityContext: common.UIAbilityContext
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let TAG: string = 'testTEST_CASE_NAME'; //日志标识字符串,作为TEST_CASE_NAME标识当前runner类下的测试行为
let bundle :string = 'com.example.actsnotificationrequesttest.static'
export default function ActsNotificationRequestTest() {
  describe('SUB_NOTIFICATION_ANS_REQUEST_TEST', () => {
    const TAG = 'SUB_NOTIFICATION_ANS_REQUEST_TEST ===>';
    beforeAll(() => {
      hilog.info(domain, TAG, '%{public}s', 'beforeAll start');
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate end');
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          hilog.info(domain, TAG, '%{public}s', '-----'+ err.code);
        }
        hilog.info(domain, TAG, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      await Utils.msSleep(2000)
      hilog.info(domain, TAG, '%{public}s', 'beforeAll end');
    })

    /*
     * @tc.number    : Sub_Notification_Ans_Publish_Publish_Static_0900
     * @tc.name      : Sub_Notification_Ans_Publish_Publish_Static_0900
     * @tc.desc      : requestEnableNotification click allowed
     */
    it('Sub_Notification_Ans_Publish_Publish_Static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let TEST_CASE_NAME = 'Sub_Notification_Ans_Publish_Publish_Static_0900'
        console.info(`${TEST_CASE_NAME} START requestEnableNotification`)
        notificationManager.requestEnableNotification(testAbilityContext, (err: BusinessError | null) => {
          console.info(`${TEST_CASE_NAME} requestEnableNotification about ctx is ${testAbilityContext}`)
          console.info(`${TEST_CASE_NAME} come in requestEnableNotification`);
          if (err) {
            console.info(`${TEST_CASE_NAME} requestEnableNotification err: ${err.code}`)
            expect(false).assertTrue()
            done()
          }else {
            console.info(`${TEST_CASE_NAME} requestEnableNotification success`)
            expect(true).assertTrue()
            await Utils.msSleep(1000)
            done()
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
          console.info(`Sub_Notification_Ans_Publish_Publish_Static_0900 ===>====>button is click`)
          await Utils.msSleep(1000)
        } else {
          console.info(`${TEST_CASE_NAME} null button`)
        }

        let notificationRequest: notificationManager.NotificationRequest = {
          id: 1,
          content: {
            notificationContentType: notificationManager.ContentType.NOTIFICATION_CONTENT_BASIC_TEXT,
            normal: {
              title: 'text_title',
              text: 'text_text',
            } as notificationManager.NotificationBasicContent
          } as notificationManager.NotificationContent,
          creatorBundleName: "creatorBundleName",
          creatorUid: 100,
          creatorPid: 101,
          creatorUserId: 100,
          hashCode: "hashCode",
          source: 0,
          deviceId: undefined,
          notificationFlags: undefined,
          agentBundle: undefined,
          appInstanceKey: undefined,
        }
        hilog.info(0x000, `${TEST_CASE_NAME}`, `${TEST_CASE_NAME} test case start`);
        await Utils.msSleep(3000)
        try {
          notificationManager.publish(notificationRequest, (err: BusinessError | null) => {
            hilog.info(0x000, `${TEST_CASE_NAME}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
            if (err) {
              console.info(`${TEST_CASE_NAME} publish err: ${err.code}`)
              expect(false).assertTrue()
              done()
            }else {
              console.info(`${TEST_CASE_NAME} publish success`)
              expect(true).assertTrue()
              await Utils.msSleep(1000)
              done()
            }
            hilog.info(0x000, `${TEST_CASE_NAME}`, `${TEST_CASE_NAME} test case end`);
            done();
          })
        } catch (err) {
          hilog.info(0x000, `${TEST_CASE_NAME}`, `${TEST_CASE_NAME}` + 'publish fail,result is : %{public}s', JSON.stringify(err));
          expect().assertFail();
          hilog.info(0x000, `${TEST_CASE_NAME}`, `${TEST_CASE_NAME} test case end`);
          done();
        }
      })

  })
}