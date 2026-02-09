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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { OnRenderExitedEvent, RenderExitReason } from "@ohos.arkui.component"
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext: common.UIAbilityContext;

export default function webAttributeTest() {

  describe('WebAttributeTest', (): void => {

    beforeAll(async (): Promise<void> => {
      console.log("[Boruto]:App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
          console.log("[Boruto]:onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("[Boruto]:-----" + err.code)
        }
        console.log("[Boruto]:BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.crashinformationtest.static")
      await Utils.msSleep(2000)
      console.log("[Boruto-0]:beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testOnRenderExitedStatic001
     * @tc.number SUB_WEB_ONRENDEREXITED_0100
     * @tc.desc   test onRenderExited RenderExitReason.PROCESS_CRASHED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnRenderExitedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("emitOnRenderExited", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testOnRenderExited001", RenderExitReason.PROCESS_CRASHED, 60106, done);
        await Utils.msSleep(2000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebAttributeTestButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done()
      })
    /**
     * @tc.name   testRenderExitReasonProcessCrashedStatic001
     * @tc.number SUB_WEB_RENDEREXITREASONPROCESSCRASHED_0100
     * @tc.desc   test RenderExitReasonProcessCrashed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRenderExitReasonProcessCrashedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("emitRenderExitReasonProcessCrashed", 10)
        await Utils.msSleep(2000);
        Utils.registerEvent("testRenderExitReasonProcessCrashed001", 2, 901, done);
        await Utils.msSleep(2000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('WebAttributeTestButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done()
      })
  })
}