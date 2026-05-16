/**
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';
const driver = Driver.create();
let testAbilityContext:common.UIAbilityContext;

export default function WebviewControllerSetActiveWebEngineVersionTest() {
    describe('WebviewControllerSetActiveWebEngineVersionTest', (): void => {
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
        }, (err : BusinessError| null) : void => {
          if (err != null ) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.WebEngineVersion.test.static')
        await Utils.msSleep(3000)
        console.log('beforeAll end,%s', 'Succeed!')
      });

      beforeEach(async () => {
        await Utils.msSleep(2000);
        console.info('web beforeEach start');
      })
    /**
     * @tc.name testSetActiveWebEngineVersionArkwebEvergreenStatic
     * @tc.number SUB_WEB_WEBVIEW_CONTROLLER_SET_ACTIVE_WEB_ENGINE_VERSION_ARKWEB_EVERGREEN_001
     * @tc.desc Test setActiveWebEngineVersion with ARKWEB_EVERGREEN enum value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL1
     */
    it('testSetActiveWebEngineVersionArkwebEvergreenStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testSetActiveWebEngineVersionArkwebEvergreen', 10)
        await Utils.msSleep(3000);
        Utils.registerEvent("testSetActiveWebEngineVersionArkwebEvergreen", "success", 20260255, done);
        await Utils.msSleep(3000);
        let button = await driver.findComponent(ON.id('setActiveWebEngineVersionClick'));
        await Utils.msSleep(3000);
        button?.click();
        await Utils.msSleep(3000);
        done();
      });
    /**
     * * @tc.name     : SwitchNextPageStatic
     * @tc.number     : testWebViewWindowFeatures009
     * @tc.desc       : onWindowNewExt
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(1000);
        let button = await driver.findComponent(ON.id('setActiveWebEngineVersionClick'));
        await Utils.msSleep(1000);
        button?.click();
        await Utils.msSleep(4000)
        done()
      })
  })
}
