/*
Copyright (c) 2025 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
*
http://www.apache.org/licenses/LICENSE-2.0
*
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
import { afterEach, beforeAll, beforeEach, describe, it, expect,TestType, Size, Level } from '../../../hypium/index';
import emitter from '@ohos.events.emitter';
import Utils from './Util.test';
import router from '@ohos.router';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;

export default function ActsAceWebviewPressureLevel(){
  describe('ActsAceWebviewPressureLevel', (): void => {
    beforeAll(async (): Promise<void> => {
      console.log('App start')
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName:'entry',
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log('onAbilityCreate end')
        },
      }, (err : BusinessError|null) : void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      })
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.performanceMaintenancetest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    })

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testWebviewPressureLevelModerateStatic
     * @tc.number SUB_ACE_WEBVIEW_PRESSURE_LEVEL_API_0001
     * @tc.desc   test testWebviewPressureLevelModerate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebviewPressureLevelModerateStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:() => void): Promise<void> => {
        await Utils.msSleep(3000);
        Utils.emitEvent('emitWebviewPressureLevelModerate', 10)
        await Utils.msSleep(5000);
        Utils.registerEvent('testWebviewPressureLevelModerate', 'success', 20001, done);
        await Utils.msSleep(1000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(1000);
        let button = await driver.findComponent(ON.id('webviewPressureLevelButton'));
        await Utils.msSleep(3000);
        button?.click();
        await Utils.msSleep(3000);
        done();
    })

    /**
     * @tc.name   testWebviewPressureLevelCriticalStatic
     * @tc.number SUB_ACE_WEBVIEW_PRESSURE_LEVEL_API_0002
     * @tc.desc   test testWebviewPressureLevelCritical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebviewPressureLevelCriticalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent('emitWebviewPressureLevelCritical', 10);
      await Utils.msSleep(3000);
      Utils.registerEvent('testWebviewPressureLevelCritical', 'success', 20002, done);
      await Utils.msSleep(4000);
      let driver: Driver = Driver.create();
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('webviewPressureLevelButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(2000);
      done();
    })
  })
}