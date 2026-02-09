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
      await Utils.msSleep(3000);
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(5000);
      console.info("componentLifeCycleTestOne beforeEach start");
    })

    /**
     * @tc.name   testOnFullScreenEnterStatic001
     * @tc.number SUB_WEB_ONFULLSCREENENTER_0100
     * @tc.desc   test onFullScreenEnter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnFullScreenEnterStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await Utils.msSleep(5000);
      Utils.emitEvent("emitOnFullScreenEnter", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testOnFullScreenEnter001", true, 442, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('OnFullScreenEnterTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })
  })
}
