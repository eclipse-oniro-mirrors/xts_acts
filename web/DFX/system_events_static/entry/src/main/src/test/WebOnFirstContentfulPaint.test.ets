/**
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
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;
export default function webOnFirstContentfulPaint() {
  describe('WebOnFirstContentfulPaintTest', () :void=> {
    beforeAll(async ():Promise<void> => {

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
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.systemeventstest.static')
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })



    /**
     * @tc.name   testOnFirstContentfulPaintStatic001
     * @tc.number SUB_WEB_ONFIRSTCONTENTFULPAINT_0100
     * @tc.desc   test onFirstContentfulPaint with Visibility.None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnFirstContentfulPaintStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void):Promise<void> => {
      Utils.emitEvent('emitOnFirstContentfulPaint001', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testOnFirstContentfulPaint001', false, 520, done);
      // inspector.sendEventByKey('WebOnFirstContentfulPaintButton', 10, '');
      let driver: Driver = Driver.create();
      await Utils.msSleep(2000);
      let button = await driver.findComponent(ON.id('WebOnFirstContentfulPaintButton'));
      await Utils.msSleep(2000);
      button?.click();
      await Utils.msSleep(3000);
      done()
    })

    /**
     * @tc.name   testOnFirstContentfulPaintStatic002
     * @tc.number SUB_WEB_ONFIRSTCONTENTFULPAINT_0200
     * @tc.desc   test onFirstContentfulPaint with Visibility.Visible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnFirstContentfulPaintStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      Utils.emitEvent('emitOnFirstContentfulPaint002', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testOnFirstContentfulPaintStatic002', false, 522, done);
      inspector.sendEventByKey('WebOnFirstContentfulPaintButton', 10, '');
      await Utils.msSleep(5000);
      setTimeout(() => {
        done();
      }, 10000);
    })
  })
}