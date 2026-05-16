/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { expect, afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;
const driver = Driver.create();
export default function webOnActivateContentTest() {
  describe('onActivateContentTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("componentLifeCycleTestOne beforeEach start");
    })

    /**
     * @tc.name   testOnActivateContentStatic00
     * @tc.number SUB_WEB_WEBONACTIVATECONTENT_0000
     * @tc.desc   test OnActivateContent.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testOnActivateContentStatic00',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testOnActivateContent00", 10)
      await Utils.msSleep(2000)
      let buttonOne = await driver.findComponent(ON.text('第一次调用'));
      if(buttonOne)
      {
        await buttonOne.click();
      }
      Utils.registerEvent("testOnActivateContent00", true, 141310, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('onActivateContentButton',10,'');
      await Utils.msSleep(2000)
      done()
    })
  })
}
