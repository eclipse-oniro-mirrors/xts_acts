/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function webSetAppCustomUserAgent() {

  describe('webSetAppCustomUserAgent', () => {

    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(3000);
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testSetAppCustomUserAgentStatic
     * @tc.number SUB_ACE_WEB_SETAPPCUSTOMUSERAGENT_API_0100
     * @tc.desc   test setAppCustomUserAgent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAppCustomUserAgentStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetAppCustomUserAgent', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testSetAppCustomUserAgentStatic', false, 174020, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebSetAppCustomUserAgentButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   testSetAppCustomUserAgentEmptyStatic
     * @tc.number SUB_ACE_WEB_SETAPPCUSTOMUSERAGENT_ERROR_0100
     * @tc.desc   test setAppCustomUserAgent null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetAppCustomUserAgentEmptyStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      Utils.emitEvent('emitSetAppCustomUserAgentEmpty', 10);
      await Utils.msSleep(2000);
      Utils.registerEvent('testSetAppCustomUserAgentEmptyStatic', 'success', 174030, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebSetAppCustomUserAgentButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   emitAvoidVisibleViewportBottomErrStatic
     * @tc.number SUB_ACE_BASIC_ETS_WEBVIEWERROR_7700
     * @tc.desc   test interface of setAudioMuted with not been associated with specific Web Components
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitAvoidVisibleViewportBottomErrStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('emitAvoidVisibleViewportBottomErr', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("emitAvoidVisibleViewportBottomErrStatic", 17100001, 20250827, done);
        inspector.sendEventByKey('WebSetAppCustomUserAgentButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      SUB_WEB_ERRORCODE_JSMESSAGEEXT_GETARRAY_1300
     * @tc.desc        test PAGE_REDIRECT
     * @tc.size        MEDIUM
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('WebSetAppCustomUserAgentButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
