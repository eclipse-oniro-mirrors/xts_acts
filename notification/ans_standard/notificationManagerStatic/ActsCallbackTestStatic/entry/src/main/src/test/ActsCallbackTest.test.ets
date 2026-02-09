/**
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

import notificationManager from '@ohos.notificationManager';
import hilog from '@ohos.hilog'
import { Component,Driver,ON,On,MatchPattern,MouseButton,WindowMode,UIElementInfo,UiDirection,PointerMatrix,DisplayRotation } from '@ohos.UiTest'
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index"
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { AppStorage } from '@ohos.arkui.stateManagement'

let testAbilityContext: common.UIAbilityContext | undefined;
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let bundle :string = 'com.example.actsnotificationmanagerrequestenablenotificationcallbacktest.static'
let count: int = 0;

export default function ActsCallbackTest() {
  describe('ActsCallbackTest', () => {

    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      console.info(`${tag} testAbilityContext 1`)
      await Utils.msSleep(2000)
      console.info(`${tag} testAbilityContext 2`)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle)}`)
      console.info(`${tag} testAbilityContext 3`)
      await Utils.msSleep(4000)
      console.info(`${tag} testAbilityContext 4`)
      testAbilityContext = AppStorage.get<common.UIAbilityContext>('UIAbilityContext') as common.UIAbilityContext
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');
    })

    /**
     * @tc.name   Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Callback_Test_Static_0100
     * @tc.number Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Callback_Test_Static_0100
     * @tc.desc   requestEnableNotification allowed button is clicked
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Callback_Test_Static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG = 'Sub_Notification_Ans_NotificationManager_RequestEnableNotification_Callback_Test_Static_0100'
        count = 0;
        notificationManager.requestEnableNotification(testAbilityContext!, (err: BusinessError | null) => {
          if (err) {
            console.info(`${TAG} requestEnableNotification err: ${JSON.stringify(err)}`)
            if (err.code !== 1600004) {
            console.info(`${TAG} requestEnableNotification err: JSON.stringify(err)`);
            expect(false).assertTrue()
            done()
            }else{
              count++;
              expect(count).assertEqual(1);
              console.info(`${TAG} succeeded.`);
              done()
            }
          } else {
            console.info(`${TAG} requestEnableNotification succeeded`)
            expect(false).assertTrue()
            await Utils.msSleep(1000)
            done()
          }

          
        })
        await Utils.msSleep(1500)
        let driver = Driver.create()
        await Utils.msSleep(1500)
        let button = await driver.findComponent(ON.text('不允许'))
        console.info(`${TAG} button is ${JSON.stringify(button)}`)
        if (button !== null) {
          await button.click();
          await Utils.msSleep(1500);
          done();
        } else {
          console.info(`${TAG} null button`);
        }
      })
  })
}
