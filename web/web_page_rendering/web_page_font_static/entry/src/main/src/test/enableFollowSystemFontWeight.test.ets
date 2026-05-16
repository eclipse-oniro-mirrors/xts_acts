/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, beforeAll,TestType,Size,Level } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import Utils from './Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;


let emitKey = 'enableFollowSystemFontWeight01';
export default function webenableFollowSystemFontWeightJsunit() {
  describe('enableFollowSystemFontWeightTest',  ():void =>{
    beforeAll(async ():Promise<void> =>{
      try {
        console.log(' App start')
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
        });
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.webpagefonttest.static')
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch(error: Error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });

    beforeEach(async  () =>{
      await Utils.msSleep(2000);
      console.info('enableFollowSystemFontWeight beforeEach start');
    })

    /**
     * @tc.name   enableFollowSystemFontWeightStatic01
     * @tc.number SUB_ACE_BASIC_ETS_ENABLESMOOTHDRAGRESIZE_API_001
     * @tc.desc   test enableSmoothDragResize01 interface when choose callback mode.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('enableFollowSystemFontWeightStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done:()=>void):Promise<void> =>{
      Utils.emitEvent('emitenableFollowSystemFontWeight01', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('enableFollowSystemFontWeight01','enableFollowSystemFontWeight',20241231,done);
      await Utils.msSleep(3000);
      let driver: Driver = Driver.create();
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('enableFollowSystemFontWeightButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   asvb1
     * @tc.number asvb1
     * @tc.desc   asvb1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('asvb1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("emitonSwitchNextPage1", 10)
        await Utils.msSleep(2000);
        let driver: Driver = Driver.create();
        await Utils.msSleep(2000);
        let button = await driver.findComponent(ON.id('enableFollowSystemFontWeightButton'));
        await Utils.msSleep(2000);
        button?.click();
        await Utils.msSleep(3000);
        done()
      })




  })
}