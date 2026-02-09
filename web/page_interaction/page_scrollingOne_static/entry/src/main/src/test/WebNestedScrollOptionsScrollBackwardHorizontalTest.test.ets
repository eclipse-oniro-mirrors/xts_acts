/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import UtilsHelpers from './UtilsHelper'
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import deviceInfo from '@ohos.deviceInfo'


let testAbilityContext:common.UIAbilityContext;

export default function webNestedScrollOptionsScrollBackwardHorizontalTest() {

  describe('WebNestedScrollOptionsScrollBackwardHorizontalTest', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.pageInteractionTwoscrollingOne.test.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("componentLifeCycleTestOne beforeEach start");
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontalStatic003
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0300
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNestedScrollOptionsScrollBackwardHorizontalStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testNestedScrollOptionsScrollBackwardHorizontal003", 10)
      let webRect = UtilsHelpers.getComponentRect('RowSize');
      await Utils.msSleep(2000)
      let X = Utils.getRectHorizontalCenterX(webRect).toInt();
      let Y = Utils.getRectVerticalCenterY(webRect).toInt();
      let driver = Driver.create();
      let deviceType: string = deviceInfo.deviceType;
      await Utils.msSleep(5000)
      if (deviceType == '2in1') {
        driver.swipe(X - 60, Y, X + 60, Y);
      } else {
        driver.swipe(X - 100, Y, X + 100, Y);
      }
      await Utils.msSleep(2000);
      Utils.registerEvent("testNestedScrollOptionsScrollBackwardHorizontal003", true, 9003, done);
      inspector.sendEventByKey('NestedScrollOptionsScrollBackwardHorizontalTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })
  })
}
