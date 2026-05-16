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

export default function WebViewBlankScreenDetectionConfigSuite() {
  describe('WebViewBlankScreenDetectionConfigTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });
    beforeEach(async () => {
      console.info('web beforeEach start');
    })

    /**
    * @tc.name         testWebViewBlankScreenDetectionConfigStatic
    * @tc.number       SUB_WEB_ONDETECTEDBLANKSCREEN_STATIC_0100
    * @tc.desc         test DetectedBlankScreenReason
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testWebViewBlankScreenDetectionConfigStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitWebViewBlankScreenDetectionConfig', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testWebViewBlankScreenDetectionConfig',  'onDetectedBlankScreen', 160602, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewBlankScreenDetectionConfigButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         testDetectedBlankScreenReasonStatic01
    * @tc.number       SUB_WEB_ONDETECTEDBLANKSCREEN_STATIC_0200
    * @tc.desc         test DetectedBlankScreenReason
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testDetectedBlankScreenReasonStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitDetectedBlankScreenReason01', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testDetectedBlankScreenReason01', true, 160600, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewBlankScreenDetectionConfigButton', 10, '');
      await Utils.msSleep(2000);
      done()
    })

    /**
    * @tc.name         testDetectedBlankScreenReasonStatic02
    * @tc.number       SUB_WEB_ONDETECTEDBLANKSCREEN_STATIC_0300
    * @tc.desc         test DetectedBlankScreenReason
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('testDetectedBlankScreenReasonStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent('emitDetectedBlankScreenReason02', 10)
      await Utils.msSleep(2000);
      Utils.registerEvent('testDetectedBlankScreenReason02', true, 160601, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebViewBlankScreenDetectionConfigButton', 10, '');
      await Utils.msSleep(6000);
      done()
    })

    /**
    * @tc.name         SwitchNextPageStatic
    * @tc.number       SUB_WEB_SWITCH_NEXT_PAGE_160601
    * @tc.desc         test SwitchNextPageStatic
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        LEVEL0
    */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebOnDataResubmittedTestButton', 10, '');
        await Utils.msSleep(3000);
        done()
      })
  })
}
