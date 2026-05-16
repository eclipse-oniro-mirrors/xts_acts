/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, ON } from '@ohos.UiTest';

let emitKey = "emitOnControllerAttachStateChangeError";
const driver = Driver.create();
let testAbilityContext: common.UIAbilityContext;

export default function ControllerAttachStateChange() {
    describe('OnControllerAttachStateChangeErrorTest', (): void => {
      beforeAll(async (): Promise<void> => {
        let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName:'entry',
          onAbilityCreate: (abilitys : UIAbility) : void => {
            testAbilityContext = abilitys.context
          },
        }, (err : BusinessError | null) : void => {
          if (err != null ) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand('aa start -a EntryAbility -b com.open.harmony.actsaceloadstatusdevtest.static')
        await Utils.msSleep(5000)
        console.log('beforeAll end,%s', 'Succeed!')
      });
      beforeEach(async () => {
        console.info('web beforeEach start');
      })

    /**
     * @tc.name   testOnControllerAttachStateChangeStatic
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_ON_CONTROLLER_ATTACH_STATE_001
     * @tc.desc   WebviewController on type null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnControllerAttachStateChangeStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testOnControllerAttachStateChange", 10)
      Utils.registerEvent("testOnControllerAttachStateChange", true, 141401, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('onControllerAttachStateChangeErrorButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testOffControllerAttachStateChangeStatic001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_OFF_CONTROLLER_ATTACH_STATE_001
     * @tc.desc   WebviewController OffControllerAttachStateChange one.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffControllerAttachStateChangeStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testOffControllerAttachStateChangeOne", 10)
      Utils.registerEvent("testOffControllerAttachStateChangeOne", true, 141402, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('onControllerAttachStateChangeErrorButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testOffControllerAttachStateChangeStatic002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_OFF_CONTROLLER_ATTACH_STATE_002
     * @tc.desc   WebviewController OffControllerAttachStateChange all.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOffControllerAttachStateChangeStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testOffControllerAttachStateChangeAll", 10)
      Utils.registerEvent("testOffControllerAttachStateChangeAll", true, 141403, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('onControllerAttachStateChangeErrorButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   SwitchNextPageStatic
     * @tc.number SwitchNextPageStatic_003141403
     * @tc.desc   test mediaOptions single instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('SwitchNextPageStatic', 10)
      await Utils.msSleep(1000);
      inspector.sendEventByKey('onControllerAttachStateChangeErrorButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })
  })
}
