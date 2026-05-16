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
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;

export default function WebViewBypassVsyncCondition() {
  describe('WebViewWebViewBypassVsyncConditionTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name         emitBypassVsyncConditionStatic01
    * @tc.number       SUB_WEB_BYPASSVSYNCCONDITION_STATIC_183010
    * @tc.desc         emitBypassVsyncCondition01
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('emitBypassVsyncConditionStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitBypassVsyncCondition01', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('emitBypassVsyncCondition01', 1, 183010, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('BypassVsyncConditionButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         emitBypassVsyncConditionStatic02
    * @tc.number       SUB_WEB_BYPASSVSYNCCONDITION_STATIC_0200
    * @tc.desc         emitBypassVsyncCondition02
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('emitBypassVsyncConditionStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitBypassVsyncCondition02', 10)
      await Utils.msSleep(3000);
      Utils.registerEvent('emitBypassVsyncCondition02', 0, 183020, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('BypassVsyncConditionButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })
  })
}
