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

import { afterEach, beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import router from '@ohos.router';
import { Utils } from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';


let testAbilityContext:common.UIAbilityContext;

export default function webOnInterceptKeyEvent() {
  describe('WebOnInterceptKeyEventTest', ():void => {
    beforeAll(async (): Promise<void> => {
      console.info('beforeAll start');
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testOnInterceptKeyEventStatic002
     * @tc.number SUB_WEB_ONINTERCEPTKEYEVENT_0200
     * @tc.desc   test onInterceptKeyEvent when return true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnInterceptKeyEventStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:()=>void):Promise<void> => {
      await Utils.msSleep(1000)
      let driver = Driver.create();
      Utils.emitEvent("emitOnInterceptKeyEvent002", 10)
      await Utils.msSleep(1000)
      await driver.triggerKey(2046);
      await Utils.msSleep(3000)
      let buttonClick = await driver.findComponent((ON.id('WebOnInterceptKeyEventWebView')));
      await Utils.msSleep(1000)
      if (buttonClick != null) {
        await buttonClick.click();
      }
      await Utils.msSleep(5000)
      await driver.triggerKey(2047);
      await Utils.msSleep(5000)
      Utils.registerEvent("testOnInterceptKeyEvent002", 2047, 70422, done);
      await Utils.msSleep(3000)
      inspector.sendEventByKey('WebOnInterceptKeyEventTestButton', 10, '');
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testOnInterceptKeyEventStatic003
     * @tc.number SUB_WEB_ONINTERCEPTKEYEVENT_0300
     * @tc.desc   test onInterceptKeyEvent when return false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnInterceptKeyEventStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: ()=>void):Promise<void> => {
      let driver = Driver.create();
      Utils.emitEvent("emitOnInterceptKeyEvent003", 10)
      await Utils.msSleep(1000)
      await driver.triggerKey(2047);
      await Utils.msSleep(3000)
      let buttonClick = await driver.findComponent((ON.id('WebOnInterceptKeyEventWebView')));
      await Utils.msSleep(1000)
      if (buttonClick != null) {
        await buttonClick.click();
      }
      await Utils.msSleep(5000)
      await driver.triggerKey(2047);
      await Utils.msSleep(5000)
      Utils.registerEvent("testOnInterceptKeyEvent003", 2047, 70425, done);
      await Utils.msSleep(3000)
      inspector.sendEventByKey('WebOnInterceptKeyEventTestButton', 10, '');
      await Utils.msSleep(2000)
      done();
    })
  })
}