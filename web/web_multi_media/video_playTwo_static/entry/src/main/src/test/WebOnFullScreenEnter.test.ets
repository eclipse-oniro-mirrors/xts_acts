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

let testAbilityContext:common.UIAbilityContext;

export default function webJsunitTwo() {

  describe('componentLifeCycleTestOne', (): void => {
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
      }, (err: BusinessError<void> | null): void => {
        if (err != null ) {
          console.log('-----' + err.code)
        }
        console.log('BusinessError  end')
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.videoplaybackTwotest.static')
      await Utils.msSleep(5000);
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info('web beforeEach start');
    })

    /**
     * @tc.name   testOnFullScreenEnterStatic001
     * @tc.number SUB_WEB_ONFULLSCREENENTER_0100
     * @tc.desc   test onFullScreenEnter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnFullScreenEnterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(5000);
      Utils.emitEvent("emitOnFullScreenEnter", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnFullScreenEnter001", true, 442, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('OnFullScreenEnterTestButton', 10, '');
      await Utils.msSleep(3000);
      done();
    })

    /**
     * @tc.name   testOnFullScreenEnterStatic002
     * @tc.number SUB_WEB_ONFULLSCREENENTER_0200
     * @tc.desc   test onFullScreenEnter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnFullScreenEnterStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(5000);
      Utils.emitEvent("emitOnFullScreenEnter_handler", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnFullScreenEnter002", true, 443, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('OnFullScreenEnterTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testOnFullScreenEnterStatic003
     * @tc.number SUB_WEB_ONFULLSCREENENTER_0300
     * @tc.desc   test onFullScreenEnter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnFullScreenEnterStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(5000);
      Utils.emitEvent("emitOnFullScreenEnter_handler_exitFullScreen", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnFullScreenEnter003", true, 444, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('OnFullScreenEnterTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testOnFullScreenEnterStatic004
     * @tc.number SUB_WEB_ONFULLSCREENENTER_0400
     * @tc.desc   test onFullScreenEnter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnFullScreenEnterStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(5000);
      Utils.emitEvent("emitOnFullScreenEnter_videoWidth", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnFullScreenEnter004", true, 445, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('OnFullScreenEnterTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testOnFullScreenEnterStatic005
     * @tc.number SUB_WEB_ONFULLSCREENENTER_0500
     * @tc.desc   test onFullScreenEnter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnFullScreenEnterStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(5000);
      Utils.emitEvent("emitOnFullScreenEnter_videoHeight", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnFullScreenEnter005", true, 446, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('OnFullScreenEnterTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   SwitchNextPageStatic
     * @tc.number UB_WEB_ONFULLSCREENENTER_0442
     * @tc.desc   test mediaOptions single instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('OnFullScreenEnterTestButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}
