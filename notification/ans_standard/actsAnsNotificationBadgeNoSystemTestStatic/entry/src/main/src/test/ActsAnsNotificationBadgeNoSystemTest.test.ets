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
import { AppStorage } from '@ohos.arkui.stateManagement';
import { RecordData } from '@kit.BasicServicesKit';

function getRandomNumber(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

let bundle1: string = 'com.example.actsansbadgenosystemtest.static'

export default function ActsAnsNotificationBadgeNoSystemTest() {
  let TEST_SUITE_NAME: string = 'ActsAnsNotificationBadgeNoSystemTest ===>'

  describe('ActsAnsNotificationBadgeNoSystemTest', () => {
    beforeAll(() => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand(`aa start -a EntryAbility -b ${JSON.stringify(bundle1)}`)
    })

    /**
     * @tc.name   Sub_Notification_Ans_Corner_Query_static_0006
     * @tc.number Sub_Notification_Ans_Corner_Query_static_0006
     * @tc.desc   non-system application invokes the onBadgeNumberQuery and offBadgeNumberQuery interfaces.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Sub_Notification_Ans_Corner_Query_static_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let TAG: string = 'Sub_Notification_Ans_Corner_Query_static_0006'
        try{
          notificationManager.onBadgeNumberQuery(
            async (bundleOption: notificationManager.BundleOption) => {
              return 1;
            }
          );
        } catch(err) {
          console.error(TEST_SUITE_NAME + TAG + `OnBadgeNumberQuery failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(202);
        }
        await Utils.msSleep(1000)
        try{
          notificationManager.offBadgeNumberQuery();
        } catch(err: BusinessError) {
          console.error(TEST_SUITE_NAME + TAG + `OffBadgeNumberQuery failed, code is ${err.code}, message is ${err.message}`);
          expect(err.code).assertEqual(202);
          done();
        }
      })




  })
}