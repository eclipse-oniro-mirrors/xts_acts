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

import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { beforeAll, beforeEach, describe, it, Level, Size, TestType, afterEach } from '../../../hypium/index';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "wholeWebPageDrawing0100";
let testAbilityContext: common.UIAbilityContext;

export default function wholeWebPageDrawing() {
  describe('wholeWebPageDrawing', () => {
    beforeAll(async (): Promise<void> => {
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("web beforeEach start");
    })
    afterEach(async () => {
      await Utils.msSleep(2000);
      console.info("web afterEach finish");
    })

    /**
     * @tc.name   wholeWebPageDrawing0100
     * @tc.number SUB_ACE_BASIC_ETS_WHOLEWEBPAGEDRAWING_API_0100
     * @tc.desc   test wholeWebPageDrawing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('wholeWebPageDrawing0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent("wholeWebPageDrawing0100", 10)
        await Utils.msSleep(4000);
        Utils.registerEvent("wholeWebPageDrawing0100", "hello", 2793, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('wholeWebPageDrawingButton', 10, '');
        await Utils.msSleep(2000);
        done()
      })
  })
}
